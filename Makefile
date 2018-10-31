


.PHONY: build
build:
	docker build . -t zommarin/ansible-runner

.PHONY: push
push:
	docker push zommarin/ansible-runner
