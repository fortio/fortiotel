
test:
	go test -race ./...
	go run -race . -version


docker-test:
	GOOS=linux go build
	docker build . --tag fortio/fortiotel:test
	docker run fortio/fortiotel:test
