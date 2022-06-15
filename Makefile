SHELL:=bash
.SHELLFLAGS:=-euo pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules


lint:
	swiftformat --lint .

format:
	swiftformat .
