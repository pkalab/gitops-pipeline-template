SHELL := /bin/bash

.PHONY: help lint test build scan push bootstrap-argocd bootstrap-flux encrypt decrypt

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

lint: ## Run linters
	@echo "Running linters..."

test: ## Run tests
	@echo "Running tests..."

build: ## Build container image
	@echo "Building image..."

scan: ## Scan image for vulnerabilities
	@echo "Scanning with Trivy..."

push: ## Push image to registry
	@echo "Pushing image..."

encrypt: ## Encrypt secrets with SOPS
	@sops --encrypt $(FILE) > $(FILE:.yaml=.enc.yaml)

decrypt: ## Decrypt secrets with SOPS
	@sops --decrypt $(FILE) > $(FILE:.enc.yaml=.yaml)

bootstrap-argocd: ## Bootstrap ArgoCD on cluster
	@./scripts/bootstrap-argocd.sh

bootstrap-flux: ## Bootstrap Flux on cluster
	@./scripts/bootstrap-flux.sh
