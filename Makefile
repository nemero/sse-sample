.PHONY: help
# tips https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
# @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#init: ## Init project

build: ## Build the project containers
	UID=$$(id -u) GID=$$(id -g) docker-compose build
rebuild: ## Rebuild all project containers with no-cache flag
	UID=$$(id -u) GID=$$(id -g) docker-compose build --no-cache

run: ## Exec to Web container
	UID=$$(id -u) GID=$$(id -g) docker-compose run --rm app bash
run-nginx: ## Exec to Web container
	UID=$$(id -u) GID=$$(id -g) docker-compose run --rm nginx sh
up: down ## Start all containers
	UID=$$(id -u) GID=$$(id -g) docker-compose up -d
down: ## Down all containers
	UID=$$(id -u) GID=$$(id -g) docker-compose down --remove-orphans

logs: ## Runtime STDout for All Containers
	docker-compose logs -f
