# Config
THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: help

# All help commands
help: ## This help.
	@echo ""
	@echo "     make help - list of all available commands"
	@echo "     make start - Start docker containers"
	@echo "     make stop - Stop docker containers"
	@echo "     make down - Down docker containers"
	@echo "     make rebuild - Rebuild the entire docker containers"
	@echo "     make workspace - Execute the workspace container"
	@echo "     make db - Execute the postgres container"
	@echo ""

.DEFAULT_GOAL := help

# Start services: nginx, mysql, and phpmyadmin
start: 
	docker-compose up -d nginx postgres

# Stop services 
stop: 
	docker-compose stop

# down services
down: 
	docker-compose down

# rebuild the containers
rebuild: 
	sudo docker-compose up -d --build nginx postgres

# execute workspace container
workdir:
	docker-compose exec --user=laradock workspace bash

# execute mysql container
db: 
	docker-compose exec postgres bash