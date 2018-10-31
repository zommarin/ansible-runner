#
# Container for running Ansible in.
#
# Based on https://github.com/jessfraz/dockerfiles/blob/master/ansible/Dockerfile
#
FROM alpine:latest

ENV BUILD_DEPS python-dev py2-pip musl-dev openssl-dev libffi-dev gcc

RUN apk --no-cache add \
	ca-certificates \
	python \
	py-paramiko \
	py-yaml \
	py-jinja2 \
	py-httplib2 \
	$BUILD_DEPS

RUN pip install --upgrade pip

RUN pip install \
		ansible \
		six \
		boto3 \
		botocore

RUN apk del --purge $BUILD_DEPS
RUN mkdir /work

WORKDIR /work

CMD ansible --help