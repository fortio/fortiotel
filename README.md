# Fortio experimental OTel = fortiotel

[Fortio](https://github.com/fortio/fortio) but with experimental open telemetry tracing.

# Install

using golang 1.18+

```shell
go install github.com/fortio/fortiotel@latest
```

You can also download one of the many binary [releases](https://github.com/fortio/fortiotel/releases)

We publish a multi architecture docker image (linux/amd64, linux/arm64) `docker run fortio/fortiotel`

# Documentation

Loosely based on

https://github.com/open-telemetry/opentelemetry-go-contrib/tree/main/instrumentation/net/http/httptrace/otelhttptrace
