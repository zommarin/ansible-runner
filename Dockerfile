#
# Container for running Ansible in.
#
# Based on https://github.com/jessfraz/dockerfiles/blob/master/ansible/Dockerfile
#
FROM alpine:latest

RUN builddeps=' \
		python-dev \
		py2-pip \
		musl-dev \
		openssl-dev \
		libffi-dev \
		gcc \
		' \
	&& apk --no-cache add \
	ca-certificates \
	python \
	py-paramiko \
	py-yaml \
	py-jinja2 \
	py-httplib2 \
	$builddeps \
	&& pip install --upgrade pip \
	&& pip install \
		ansible \
		six \
	&& apk del --purge $builddeps

ENTRYPOINT [ "ansible" ]
