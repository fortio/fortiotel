
test:
	go test -race ./...
	go run -race . -version


docker-test:
	GOOS=linux go build
	docker build . --tag fortio/fortiotel:test
	docker run fortio/fortiotel:test

start-local-jaeger:
	docker run -d --name jaeger -p 16686:16686 -p 4317:4317 jaegertracing/all-in-one:latest \
		--collector.otlp.enabled=true --collector.otlp.grpc.host-port=:4317
	@echo "Jaeger UI:\nhttp://localhost:16686"

stop-local-jaeger:
	docker stop jaeger
	docker rm jaeger
