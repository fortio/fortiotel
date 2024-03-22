# See also github.com/fortio/otel-sample-app


test:
	go test -race ./...
	go run -race . -version


docker-test:
	GOOS=linux go build
	docker build . --tag fortio/fortiotel:test
	docker run fortio/fortiotel:test

start-local-jaeger:
	docker run -d --name jaeger -p 16686:16686 -p 4317:4317 jaegertracing/all-in-one:latest \
		--collector.otlp.enabled=true
	@echo "Jaeger UI:\nhttp://localhost:16686"

stop-local-jaeger:
	docker stop jaeger
	docker rm jaeger

race-test:
	# Also crashes without -race
	OTEL_SERVICE_NAME=race-test go run -race . load -n 40 -c 2 -qps -1 "http://localhost:8080/?delay=200ms"

.golangci.yml: Makefile
	curl -fsS -o .golangci.yml https://raw.githubusercontent.com/fortio/workflows/main/golangci.yml

lint: .golangci.yml
	golangci-lint run
