FROM scratch
COPY fortiotel /usr/bin/fortio
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
