
TAG:=$(shell git describe --tags --match 'v*' --always)

docker-push:
	docker buildx build . --build-arg VERSION=$(TAG) --platform linux/amd64,linux/arm64 --tag fortio/in-out-sample:$(TAG)  --tag fortio/in-out-sample:latest --push

docker-buildx-setup:
	docker context create build
	docker buildx create --use build
