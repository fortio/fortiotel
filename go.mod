module fortio.org/fortiotel

go 1.18

require (
	fortio.org/cli v1.5.1
	fortio.org/dflag v1.7.0
	fortio.org/fortio v1.63.2
	fortio.org/log v1.12.0
	go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace v0.48.0
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.48.0
	go.opentelemetry.io/contrib/propagators/b3 v1.22.0
	go.opentelemetry.io/otel v1.23.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.22.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.22.0
	go.opentelemetry.io/otel/sdk v1.22.0
	go.opentelemetry.io/otel/trace v1.23.0
)

// During development, point to local repo for fortio
// replace fortio.org/fortio => ../fortio

require (
	fortio.org/scli v1.13.1 // indirect
	fortio.org/sets v1.0.3 // indirect
	fortio.org/struct2env v0.4.0 // indirect
	fortio.org/version v1.0.3 // indirect
	github.com/cenkalti/backoff/v4 v4.2.1 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/fsnotify/fsnotify v1.7.0 // indirect
	github.com/go-logr/logr v1.4.1 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/google/uuid v1.5.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.18.1 // indirect
	go.opentelemetry.io/otel/metric v1.23.0 // indirect
	go.opentelemetry.io/proto/otlp v1.0.0 // indirect
	golang.org/x/exp v0.0.0-20231206192017-f3f8817b8deb // indirect
	golang.org/x/net v0.20.0 // indirect
	golang.org/x/sys v0.16.0 // indirect
	golang.org/x/text v0.14.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20231106174013-bbf56f31fb17 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20231127180814-3a041ad873d4 // indirect
	google.golang.org/grpc v1.60.1 // indirect
	google.golang.org/protobuf v1.32.0 // indirect
)
