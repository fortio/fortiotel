# Fortio experimental OTel = fortiotel

[Fortio](https://github.com/fortio/fortio) but with experimental open telemetry tracing.

# Install

using golang 1.18+

```shell
go install github.com/fortio/fortiotel@latest
```

You can also download one of the many binary [releases](https://github.com/fortio/fortiotel/releases)

We publish a multi architecture docker image (linux/amd64, linux/arm64) `docker run fortio/fortiotel`

# Testing:

Start a local jaeger with otel receiver:
```
docker run -p 16686:16686 -p 4317:4317 jaegertracing/all-in-one:latest --collector.otlp.enabled=true --collector.otlp.grpc.host-port=:4317
```

Run fortio server and then for instance:
```
go run . load localhost:8080
```

Get disjoint traces (for now): http://localhost:16686/search

# Documentation

Loosely based on

https://github.com/open-telemetry/opentelemetry-go-contrib/tree/main/instrumentation/net/http/httptrace/otelhttptrace
