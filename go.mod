module fortio.org/fortiotel

go 1.18

require (
	fortio.org/cli v1.3.3
	fortio.org/dflag v1.5.3
	fortio.org/fortio v1.58.0
	fortio.org/log v1.10.0
	go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace v0.42.0
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.42.0
	go.opentelemetry.io/contrib/propagators/b3 v1.17.0
	go.opentelemetry.io/otel v1.16.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.16.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.16.0
	go.opentelemetry.io/otel/sdk v1.16.0
	go.opentelemetry.io/otel/trace v1.16.0
)

// During development, point to local repo for fortio
// replace fortio.org/fortio => ../fortio

require (
	fortio.org/scli v1.11.0 // indirect
	fortio.org/sets v1.0.3 // indirect
	fortio.org/version v1.0.2 // indirect
	github.com/cenkalti/backoff/v4 v4.2.1 // indirect
	github.com/felixge/httpsnoop v1.0.3 // indirect
	github.com/fsnotify/fsnotify v1.6.0 // indirect
	github.com/go-logr/logr v1.2.4 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/google/uuid v1.3.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.16.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/internal/retry v1.16.0 // indirect
	go.opentelemetry.io/otel/metric v1.16.0 // indirect
	go.opentelemetry.io/proto/otlp v0.20.0 // indirect
	golang.org/x/exp v0.0.0-20230801115018-d63ba01acd4b // indirect
	golang.org/x/net v0.13.0 // indirect
	golang.org/x/sys v0.10.0 // indirect
	golang.org/x/text v0.11.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20230530153820-e85fd2cbaebc // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20230803162519-f966b187b2e5 // indirect
	google.golang.org/grpc v1.57.0 // indirect
	google.golang.org/protobuf v1.31.0 // indirect
)
