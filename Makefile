# =========================================================================== #
#                                                                             #
#                 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓                 #
#                 ┃   ███╗   ██╗ ██████╗ ██╗   ██╗ █████╗   ┃                 #
#                 ┃   ████╗  ██║██╔═████╗██║   ██║██╔══██╗  ┃                 #
#                 ┃   ██╔██╗ ██║██║██╔██║██║   ██║███████║  ┃                 #
#                 ┃   ██║╚██╗██║████╔╝██║╚██╗ ██╔╝██╔══██║  ┃                 #
#                 ┃   ██║ ╚████║╚██████╔╝ ╚████╔╝ ██║  ██║  ┃                 #
#                 ┃   ╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝  ╚═╝  ┃                 #
#                 ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛                 #
#                                                                             #
#                        This machine kills fascists.                         #
#                                                                             #
# =========================================================================== #

CONTAINER       = krisnova/home
CONTAINER_TAG   = latest
CONTAINER_SHA   = $(shell git rev-parse --short HEAD)
CPU_SET         = $(shell cat /proc/1/status | grep -i cpus_allowed_list | cut -d ":" -f 2 | sed 's/\t//g')

default: help

install: ## Install "Novix" on the local workstation. 
	@echo "Installing..."
	. lib/_install

container: ## Build the Dockerfile
	@echo "Building Dockerfile"
	sudo -E docker build --cpuset-cpus="${CPU_SET}" -t ${CONTAINER}:${CONTAINER_TAG} -f Dockerfile .
	sudo -E docker tag ${CONTAINER}:${CONTAINER_TAG} ${CONTAINER}:${CONTAINER_SHA}

dev: ## Run a development copy of Novix in a container
	sudo -E docker run --hostname=novix -it ${CONTAINER}:${CONTAINER_TAG} /bin/bash

push: ## Push the container image to dockerhub
	sudo -E docker push ${CONTAINER}:${CONTAINER_TAG}
	sudo -E docker push ${CONTAINER}:${CONTAINER_SHA}

clean: ## Clean your artifacts 🧼
	@echo "Cleaning..."
	rm -rvf out/*
	rm -rvf *flag*
	rm -rvf tmp/*

.PHONY: help
help:  ## 🤔 Show help messages for make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'
