// Copyright 2022 Fortio Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"context"
	"flag"
	"fmt"
	"net/http"
	"net/http/httptrace"
	"time"

	"fortio.org/cli"
	"fortio.org/dflag/dynloglevel"
	fcli "fortio.org/fortio/cli"
	"fortio.org/fortio/fhttp"
	"fortio.org/fortio/periodic"
	"fortio.org/log"
	"go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace"
	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
	"go.opentelemetry.io/contrib/propagators/b3"
	"go.opentelemetry.io/otel"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc"
	"go.opentelemetry.io/otel/propagation"
	sdktrace "go.opentelemetry.io/otel/sdk/trace"
	"go.opentelemetry.io/otel/trace"
)

// Sort of inspired from
// https://github.com/open-telemetry/opentelemetry-go/blob/main/exporters/otlp/otlptrace/otlptracehttp/example_test.go
// (see also simple/ and https://github.com/fortio/otel-sample-app/)

var (
	b3SingleFlag = flag.Bool("b3single", false, "Set to use b3 single header propagation instead of traceparent")
	b3MultiFlag  = flag.Bool("b3multi", true, "Set to use b3 multi header propagation instead of traceparent")
)

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
	// Needed to get headers, either b3 or traceparent
	var propagator propagation.TextMapPropagator
	if *b3SingleFlag {
		propagator = b3.New(b3.WithInjectEncoding(b3.B3SingleHeader))
	} else if *b3MultiFlag {
		propagator = b3.New(b3.WithInjectEncoding(b3.B3MultipleHeader))
	} else {
		propagator = propagation.NewCompositeTextMapPropagator( /*propagation.Baggage{},*/ propagation.TraceContext{})
	}
	otel.SetTextMapPropagator(propagator) // key for getting headers

	return tracerProvider.Shutdown, nil
}

var shutdown func(context.Context) error

type OtelLogger struct {
	tracer trace.Tracer
}

type OtelSpan struct{}

// Before each Run().
func (o *OtelLogger) Start(ctx context.Context, threadID periodic.ThreadID, iter int64, startTime time.Time) context.Context {
	ctx, span := o.tracer.Start(ctx, fmt.Sprintf("run %d", threadID))
	return context.WithValue(ctx, OtelSpan{}, span)
}

// Report logs a single request to a file.
func (o *OtelLogger) Report(ctx context.Context, thread periodic.ThreadID, iter int64,
	startTime time.Time, latency float64, status bool, details string,
) {
	span := ctx.Value(OtelSpan{}).(trace.Span)
	span.End()
}

// Info is used to print information about the logger.
func (o *OtelLogger) Info() string {
	return "otel"
}

func CreateTrace(ctx context.Context) *httptrace.ClientTrace {
	return otelhttptrace.NewClientTrace(ctx)
}

func transportChain(t http.RoundTripper) http.RoundTripper {
	return otelhttp.NewTransport(t)
}

func hook(ho *fhttp.HTTPOptions, ro *periodic.RunnerOptions) {
	ctx := context.Background()
	o := OtelLogger{
		tracer: otel.Tracer("fortio.org/fortio"),
	}
	ro.AccessLogger = &o
	ho.ClientTrace = CreateTrace
	ho.Transport = transportChain
	// Registers a tracer Provider globally.
	var err error
	shutdown, err = installExportPipeline(ctx)
	if err != nil {
		log.Fatalf("Error setting up export pipeline: %v", err)
	}
	log.Infof("Fortio OTEL variant %s - export pipeline setup successfully", cli.ShortVersion)
}

func main() {
	// Change a bunch of defaults to better ones "2.0" afforded by this being a new binary.
	dynloglevel.ChangeFlagsDefault("true", "stdclient", "nocatchup", "uniform", "a", "h2")
	cli.ProgramName = "Fortio OTEL variant"
	fcli.FortioMain(hook)
	if err := shutdown(context.Background()); err != nil {
		log.Fatalf("Error shutting down up export pipeline: %v", err)
	}
	log.Infof("OTEL export pipeline shut down successfully")
}
