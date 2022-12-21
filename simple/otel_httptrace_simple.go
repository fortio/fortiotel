// Repro basic issue with otelhttptrace
// This generates 4 traces instead of 1 trace with all the spans

package main

import (
	"context"
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/http/httptrace"

	"go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace"
	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
	"go.opentelemetry.io/otel"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc"
	"go.opentelemetry.io/otel/propagation"
	sdktrace "go.opentelemetry.io/otel/sdk/trace"
)

// Simplified version of
// https://github.com/open-telemetry/opentelemetry-go/blob/main/exporters/otlp/otlptrace/otlptracehttp/example_test.go

// +
// https://github.com/open-telemetry/opentelemetry-go-contrib/blob/main/instrumentation/net/http/otelhttp/example/client/client.go
// to get actual trace headers like
// Traceparent: 00-6311bdab85facd517d5c032870fa7d13-d597dfa84926ad26-01

// See traces using:
/*
 docker run -p 16686:16686 -p 4317:4317 jaegertracing/all-in-one:latest \
--collector.otlp.enabled=true --collector.otlp.grpc.host-port=:4317

# generate with

OTEL_SERVICE_NAME=test go run . -url http://localhost:8080/ # with fortio server -loglevel debug running to see incoming headers
*/

func installExportPipeline(ctx context.Context) (func(context.Context) error, error) {
	// Insecure needed for jaeger otel grpc endpoint by default/using all-in-one.
	// (and istio envoy will mtls secure it when not running local tests anyway)
	client := otlptracegrpc.NewClient(otlptracegrpc.WithInsecure())
	exporter, err := otlptrace.New(ctx, client)
	if err != nil {
		return nil, fmt.Errorf("creating OTLP trace exporter: %w", err)
	}

	tracerProvider := sdktrace.NewTracerProvider(
		sdktrace.WithBatcher(exporter),
	)
	otel.SetTracerProvider(tracerProvider)
	propagator := propagation.NewCompositeTextMapPropagator(propagation.Baggage{}, propagation.TraceContext{})
	otel.SetTextMapPropagator(propagator) // key for getting headers

	return tracerProvider.Shutdown, nil
}

func main() {
	url := flag.String("url", "http://www.google.com/", "URL to fetch")
	flag.Parse()
	ctx := context.Background()
	// Registers a tracer Provider globally.
	shutdown, err := installExportPipeline(ctx)
	if err != nil {
		log.Fatalf("Error setting up export pipeline: %v", err)
	}
	log.Printf("OTEL export pipeline setup successfully - making a single request to -url %s", *url)
	// Without this the httptrace spans are disjoint.
	tracer := otel.Tracer("github.com/fortio/fortiotel")
	ctx, span := tracer.Start(ctx, "main")
	clientTrace := otelhttptrace.NewClientTrace(ctx)
	req, err := http.NewRequestWithContext(ctx, http.MethodGet, *url, nil)
	if err != nil {
		log.Fatalf("Error creating request: %v", err)
	}
	req = req.WithContext(httptrace.WithClientTrace(req.Context(), clientTrace))
	// Create an http.Client that uses the (ot)http.Transport
	// wrapped around the http.DefaultTransport - but headers are available through the propagator above.
	// Unfortunately the http trace spans aren't nested in the http one...
	// https://github.com/open-telemetry/opentelemetry-go-contrib/issues/399
	cli := http.Client{
		Transport: otelhttp.NewTransport(http.DefaultTransport),
	}
	resp, err := cli.Do(req)
	if err != nil {
		log.Fatalf("Error executing request: %v", err)
	}
	_, err = io.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Error reading response body: %v", err)
	}
	_ = resp.Body.Close()
	span.End()
	if err := shutdown(context.Background()); err != nil {
		log.Fatalf("Error shutting down up export pipeline: %v", err)
	}
	log.Printf("OTEL export pipeline shut down successfully")
}
