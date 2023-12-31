# Variables
APP_NAME=golang_version
APP_CMD=./cmd/main.go

## Help para todos os Targets
.PHONY: help
help:
	@awk '/^.PHONY: / { \
		msg = match(lastLine, /^## /); \
			if (msg) { \
				cmd = substr($$0, 9, 100); \
				msg = substr(lastLine, 4, 1000); \
				printf "  ${GREEN}%-30s${RESET} %s\n", cmd, msg; \
			} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## Build App
.PHONY: build
build:
	@go run build

## Run App
.PHONY: run
run:
	@go run $(APP_CMD)	

## Clean Build App
.PHONY: clean
clean:
	@rm -f $(APP_NAME)		
	
## Run Tests App
.PHONY: test
test:
	@go test ./...  

## Run Format App
.PHONY: fmt
fmt:
	@go fmt ./...  

## Run Lint App
.PHONY: lint
lint:
	@golint ./...
	@golangci-lint run

## Build container test do com compose de CI
.PHONY: ci/linter
ci/linter:
	docker-compose -f docker-compose.ci.yml run ci