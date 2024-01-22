setup:
	docker-compose run --rm app npm ci

ci:
	$(MAKE) prepare-env
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

dev:
	$(MAKE) prepare-env
	docker-compose up

build:
	docker-compose -f docker-compose.yml build app

push:
	docker-compose -f docker-compose.yml push app

prepare-env:
	if [ ! -f .env ]; then cp ./app/.env.example .env; fi
