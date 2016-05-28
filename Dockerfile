FROM python:3.5-slim
MAINTAINER Nikolay Rybak <mykola.rybak@gmail.com>

RUN \
	mkdir -p /aws && \
	pip install --upgrade awscli==1.10.32

WORKDIR /aws
ENTRYPOINT ["aws"]
