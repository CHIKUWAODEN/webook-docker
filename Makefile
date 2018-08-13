build:
	docker build -t webook .

rebuild:
	docker build -t webook --nocache .

run: build
	-docker rm webook
	docker run \
	--privileged \
	--interactive \
	--tty \
	--volume `pwd`/:/webook-docker \
	--name webook \
	-p 13001:13001 \
	webook:latest


webook_build:
	docker exec -t webook "cd /webook-docker/hello && webook build"