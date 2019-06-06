IMAGE:=sapcc/k8sniff
VERSION:=$(shell git rev-parse --verify HEAD)

build:
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)
