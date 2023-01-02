# Go releaser dockerfile
FROM alpine as certs
RUN apk update && apk add ca-certificates
FROM scratch
COPY fortiotel /usr/bin/fortio
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
# TODO: Prom metrics exports/scrape
# EXPOSE 9102
# ENV OTEL_SERVICE_NAME "fortio"
# Assumes you added --collector.otlp.enabled=true to your Jaeger deployment
ENV OTEL_EXPORTER_OTLP_ENDPOINT http://jaeger-collector.istio-system.svc.cluster.local:4317
# Same as original fortio/fortio Dockerfile
EXPOSE 8078
EXPOSE 8079
EXPOSE 8080
EXPOSE 8081
# configmap (dynamic flags)
VOLUME /etc/fortio
# data files etc
VOLUME /var/lib/fortio
WORKDIR /var/lib/fortio
ENTRYPOINT ["/usr/bin/fortio"]
# start the server mode (grpc ping on 8079, http echo and UI on 8080, redirector on 8081) by default
CMD ["server", "-config", "/etc/fortio"]
