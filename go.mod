module fortio.org/fortiotel

go 1.21

// toolchain go1.22.5 // this shouldn't be necessary - see https://github.com/golang/go/issues/66175#issuecomment-2010343876

require (
	fortio.org/cli v1.8.0
	fortio.org/dflag v1.7.2
	fortio.org/fortio v1.66.0
	fortio.org/log v1.16.0
	go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace v0.53.0
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.53.0
	go.opentelemetry.io/contrib/propagators/b3 v1.28.0
	go.opentelemetry.io/otel v1.28.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.28.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.28.0
	go.opentelemetry.io/otel/sdk v1.28.0
	go.opentelemetry.io/otel/trace v1.28.0
)

// During development, point to local repo for fortio
// replace fortio.org/fortio => ../fortio

require (
	fortio.org/scli v1.15.1 // indirect
	fortio.org/sets v1.1.1 // indirect
	fortio.org/struct2env v0.4.1 // indirect
	fortio.org/version v1.0.4 // indirect
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/fsnotify/fsnotify v1.7.0 // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.20.0 // indirect
	github.com/kortschak/goroutine v1.1.2 // indirect
	go.opentelemetry.io/otel/metric v1.28.0 // indirect
	go.opentelemetry.io/proto/otlp v1.3.1 // indirect
	golang.org/x/crypto/x509roots/fallback v0.0.0-20240626151235-a6a393ffd658 // indirect
	golang.org/x/exp v0.0.0-20240613232115-7f521ea00fb8 // indirect
	golang.org/x/net v0.26.0 // indirect
	golang.org/x/sys v0.21.0 // indirect
	golang.org/x/text v0.16.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20240701130421-f6361c86f094 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240701130421-f6361c86f094 // indirect
	google.golang.org/grpc v1.65.0 // indirect
	google.golang.org/protobuf v1.34.2 // indirect
)
