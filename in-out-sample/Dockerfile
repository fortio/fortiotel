FROM golang as build
ARG VERSION=latest
RUN go version
RUN CGO_ENABLED=0 go install -a -ldflags -s fortio.org/fortiotel/in-out-sample@${VERSION}
FROM scratch
COPY --from=build /go/bin/in-out-sample /usr/local/bin/
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
EXPOSE 8080
ENV OTEL_SERVICE_NAME "in-out-sample"
# Assumes you added --collector.otlp.enabled=true to your Jaeger deployment
ENV OTEL_EXPORTER_OTLP_ENDPOINT http://jaeger-collector.istio-system.svc.cluster.local:4317
CMD ["/usr/local/bin/in-out-sample", "-b3"]
