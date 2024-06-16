TAG = latest

build-image:
	docker build -t nameko/nameko-example-user:$(TAG) ./user

docker-tag:
	docker tag nameko/nameko-example-user:$(TAG) \
	nameko/nameko-example-user:$(TAG)

push-image:
	docker push nameko/nameko-example-user:$(TAG)
