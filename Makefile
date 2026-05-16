.PHONY: api

build:
	DOCKER_BUILDKIT=0 docker build -t myridia/opencode:latest .

default: build
