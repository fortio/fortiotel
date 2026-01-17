module fortio.org/fortiotel

go 1.24.0

require (
	fortio.org/cli v1.12.3
	fortio.org/dflag v1.9.3
	fortio.org/fortio v1.73.2
	fortio.org/log v1.18.3
	go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace v0.64.0
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.64.0
	go.opentelemetry.io/contrib/propagators/b3 v1.39.0
	go.opentelemetry.io/otel v1.39.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.39.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.39.0
	go.opentelemetry.io/otel/sdk v1.39.0
	go.opentelemetry.io/otel/trace v1.39.0
)

// During development, point to local repo for fortio
// replace fortio.org/fortio => ../fortio

require (
	fortio.org/duration v1.0.4 // indirect
	fortio.org/safecast v1.2.0 // indirect
	fortio.org/scli v1.19.0 // indirect
	fortio.org/sets v1.3.0 // indirect
	fortio.org/struct2env v0.4.2 // indirect
	fortio.org/terminal v0.63.1 // indirect
	fortio.org/version v1.0.4 // indirect
	github.com/bufbuild/protocompile v0.14.1 // indirect
	github.com/cenkalti/backoff/v5 v5.0.3 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/fsnotify/fsnotify v1.8.0 // indirect
	github.com/go-logr/logr v1.4.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.27.3 // indirect
	github.com/jbuchbinder/gopnm v0.0.0-20220507095634-e31f54490ce0 // indirect
	github.com/jhump/protoreflect v1.17.0 // indirect
	github.com/kortschak/goroutine v1.1.3 // indirect
	github.com/rivo/uniseg v0.4.7 // indirect
	go.opentelemetry.io/auto/sdk v1.2.1 // indirect
	go.opentelemetry.io/otel/metric v1.39.0 // indirect
	go.opentelemetry.io/proto/otlp v1.9.0 // indirect
	golang.org/x/crypto/x509roots/fallback v0.0.0-20250406160420-959f8f3db0fb // indirect
	golang.org/x/image v0.35.0 // indirect
	golang.org/x/net v0.49.0 // indirect
	golang.org/x/sys v0.40.0 // indirect
	golang.org/x/term v0.39.0 // indirect
	golang.org/x/text v0.33.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20251202230838-ff82c1b0f217 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20251202230838-ff82c1b0f217 // indirect
	google.golang.org/grpc v1.78.0 // indirect
	google.golang.org/protobuf v1.36.10 // indirect
	grol.io/grol v0.97.1 // indirect
)
