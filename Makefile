build:
	docker build -t webook .


run: build
	-docker rm webook
	docker run \
	--interactive \
	--tty \
	--volume `pwd`/book:/book \
	--name webook \
	webook:latest /bin/bash

shell: run
	docker exec -it webook /bin/bash