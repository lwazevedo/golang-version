# Variables
APP_NAME=golang_version
APP_CMD=./cmd/main.go
PF=null

ifeq (version_and_git_tag,$(firstword $(MAKECMDGOALS)))
ifndef VE
$(error Versão não especificada. Utilize 'make build VE=<valor>  (OPTIONAL) PF=<valor>')
endif
endif
ifeq (version_and_git_tag,$(firstword $(MAKECMDGOALS)))
ifeq ($(filter $(VE), MA MI PA),)
$(error Versão inválida. Utilize 'MA => para Major', 'MI => para Minor' ou 'PA => para Path' para a versão.)
endif
endif


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

## Run chmod git hooks
.PHONY: hooks
hooks:
	@chmod ug+x ./.githooks/*


## Gera uma nova versão, cria uma tag e publica no git VE=MA PF=RC
.PHONY: version_and_git_tag
version_and_git_tag:
	@./.githooks/version $(VE) $(PF)