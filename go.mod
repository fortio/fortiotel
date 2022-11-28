module github.com/fortio/fortiotel

go 1.18

require (
	fortio.org/fortio v1.39.0-pre4
	go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace v0.36.4
)

// During development, point to local repo for fortio
// replace fortio.org/fortio => ../fortio

require (
	github.com/fsnotify/fsnotify v1.6.0 // indirect
	github.com/go-logr/logr v1.2.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/golang/protobuf v1.5.2 // indirect
	github.com/google/uuid v1.3.0 // indirect
	go.opentelemetry.io/otel v1.11.1 // indirect
	go.opentelemetry.io/otel/trace v1.11.1 // indirect
	golang.org/x/exp v0.0.0-20221111204811-129d8d6c17ab // indirect
	golang.org/x/net v0.2.0 // indirect
	golang.org/x/sys v0.2.0 // indirect
	golang.org/x/text v0.4.0 // indirect
	google.golang.org/genproto v0.0.0-20220714211235-042d03aeabc9 // indirect
	google.golang.org/grpc v1.51.0 // indirect
	google.golang.org/protobuf v1.28.0 // indirect
)
