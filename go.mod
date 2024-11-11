module fortio.org/fortiotel

go 1.22

// toolchain go1.22.8 // this shouldn't be necessary - see https://github.com/golang/go/issues/66175#issuecomment-2010343876

require (
	fortio.org/cli v1.9.2
	fortio.org/dflag v1.7.3
	fortio.org/fortio v1.67.1
	fortio.org/log v1.17.1
	go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace v0.57.0
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.57.0
	go.opentelemetry.io/contrib/propagators/b3 v1.32.0
	go.opentelemetry.io/otel v1.32.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.32.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.32.0
	go.opentelemetry.io/otel/sdk v1.32.0
	go.opentelemetry.io/otel/trace v1.32.0
)

// During development, point to local repo for fortio
// replace fortio.org/fortio => ../fortio

require (
	fortio.org/safecast v1.0.0 // indirect
	fortio.org/scli v1.15.3 // indirect
	fortio.org/sets v1.2.0 // indirect
	fortio.org/struct2env v0.4.1 // indirect
	fortio.org/version v1.0.4 // indirect
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/fsnotify/fsnotify v1.7.0 // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.23.0 // indirect
	github.com/kortschak/goroutine v1.1.2 // indirect
	go.opentelemetry.io/otel/metric v1.32.0 // indirect
	go.opentelemetry.io/proto/otlp v1.3.1 // indirect
	golang.org/x/crypto/x509roots/fallback v0.0.0-20240904212608-c9da6b9a4008 // indirect
	golang.org/x/exp v0.0.0-20240904232852-e7e105dedf7e // indirect
	golang.org/x/net v0.30.0 // indirect
	golang.org/x/sys v0.27.0 // indirect
	golang.org/x/text v0.20.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20241104194629-dd2ea8efbc28 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20241104194629-dd2ea8efbc28 // indirect
	google.golang.org/grpc v1.67.1 // indirect
	google.golang.org/protobuf v1.35.1 // indirect
)
