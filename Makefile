#!/usr/bin/env make
PROJECT := rubycritic
VERSION := 3.1.3_0

# Declare all targets as phony targets
# https://www.gnu.org/software/make/manual/make.html#Phony-Targets
.PHONY: %

# By default, `make` without arguments runs the first target in the Makefile.
# Hence let's declare it explicitly.
_default: build

build:
	docker build . -t harmjanblok/$(PROJECT):$(VERSION)

push:
	docker tag harmjanblok/$(PROJECT):$(VERSION) harmjanblok/$(PROJECT):latest
	docker push harmjanblok/$(PROJECT):$(VERSION)
	docker push harmjanblok/$(PROJECT):latest

test:
	docker run \
		--rm \
		--volume $(shell pwd):/usr/src/app \
		harmjanblok/$(PROJECT):$(VERSION)
