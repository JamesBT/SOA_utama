build-image:
	docker build -t nameko/nameko-example-user:$(TAG) .;

docker-tag:
	docker tag nameko/nameko-example-user:$(FROM_TAG) \
	nameko/nameko-example-user:$(TAG)

push-image:
	docker push nameko/nameko-example-user:$(TAG)
