include .env

MODULE := $(shell go list -m)

BIN := $(PWD)/bin
export GOBIN := $(BIN)
export PATH := $(BIN):$(PATH)

$(BIN)/stringer:
	@mkdir -p $(BIN)
	go install golang.org/x/tools/cmd/stringer

$(BIN)/goimports:
	@mkdir -p $(BIN)
	go install golang.org/x/tools/cmd/goimports

## generate: Run go generate
generate: $(BIN)/stringer
	go generate .

## format: Run goimports
format: $(BIN)/goimports
	goimports -local "$(MODULE)" -w .

## run: Run application
run:
	@go run .

## clean: Clean stuff
clean:
	@rm -rf $(BIN)

## help: Print help message
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECT_NAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' | sed -e 's/^/ /'
	@echo

.DEFAULT_GOAL := help
