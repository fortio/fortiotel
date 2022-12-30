# Go releaser dockerfile
#FROM alpine as certs
#RUN apk update && apk add ca-certificates
# ^ alpine doesn't seem to work (with goreleaser, works fine from docker build cmd line), trying with ubuntu
#FROM ubuntu as certs
#RUN apt-get update && apt-get install -y ca-certificates
# ^ doesn't (yet) work either https://github.com/goreleaser/goreleaser/issues/3676
FROM scratch
COPY fortiotel /usr/bin/fortio
#COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["/usr/bin/fortio"]
EXPOSE 8080
# Prom metrics exports/scrape
EXPOSE 9102
# configmap (dynamic flags)
VOLUME /etc/fortio-config
# logs etc
WORKDIR /var/log/fortio
# start the fortiotel with default; the routes and cert by default
CMD ["-config", "/etc/fortio-config"]
