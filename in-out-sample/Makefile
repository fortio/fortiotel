
docker-push:
	docker buildx build . --platform linux/amd64,linux/arm64 --tag fortio/in-out-sample --push

docker-buildx-setup:
	docker context create build
	docker buildx create --use build
