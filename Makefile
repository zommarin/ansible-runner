
IMAGE=zommarin/ansible-runner
VERSION=latest

.PHONY: build
build:
	docker build . -t $(IMAGE):$(VERSION)

.PHONY: push
push: build
	docker push $(IMAGE):$(VERSION)
