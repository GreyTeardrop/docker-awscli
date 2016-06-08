FROM python:3.5-slim
MAINTAINER Nikolay Rybak <mykola.rybak@gmail.com>

RUN \
	mkdir -p /aws && \
	pip install --upgrade awscli==1.10.36 && \
    rm -rf /root/.cache && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /aws
ENTRYPOINT ["aws"]
