VERSION := $(shell git log --pretty=format:'' | wc -l)

build:
	docker build -t reference-en-app:$(VERSION) . -f Dockerfile-zhijie
	docker build -t reference-en-nginx:$(VERSION) ./nginx

run:
	docker-compose up --build

stop:
	docker compose --file 'docker-compose.yml' --project-name 'utils-reference' stop

clean: stop
	docker compose --file 'docker-compose.yml' --project-name 'utils-reference' down

status:
	@if docker images | grep -q reference-en; then \
        echo "Reference-en Builded"; \
	else \
		echo "No Image Builded"; \
    fi