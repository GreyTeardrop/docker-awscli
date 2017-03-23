FROM python:3.5-slim
MAINTAINER Nikolay Rybak <mykola.rybak@gmail.com>

RUN \
    mkdir -p /aws && \
    pip install --upgrade awscli==1.11.65 && \
    rm -rf /root/.cache && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /aws
ENTRYPOINT ["aws"]
