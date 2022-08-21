SHELL:=bash
.SHELLFLAGS:=-euo pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.PHONY: build build-release build-debug lint format clean

build: build-release

build-release:
	swift build -c release --product Run

build-debug:
	swift build --product Run

lint:
	swiftformat --lint .

format:
	swiftformat --verbose .

clean:
	swift package clean
