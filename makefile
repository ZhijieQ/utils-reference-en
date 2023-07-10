VERSION := $(shell git log --pretty=format:'' | wc -l)

build:
	docker build -t portfolio-app:$(VERSION) . -f Dockerfile-zhijie
	docker build -t portfolio-nginx:$(VERSION) ./nginx

run:
	docker-compose up --build

stop:
	docker compose --file 'docker-compose.yml' --project-name 'utils-reference' stop

clean: stop
	docker compose --file 'docker-compose.yml' --project-name 'utils-reference' down