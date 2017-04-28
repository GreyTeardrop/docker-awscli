FROM python:3.5-slim
MAINTAINER Nikolay Rybak <mykola.rybak@gmail.com>

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends groff-base && \
    mkdir -p /aws && \
    pip install --upgrade awscli==1.11.81 && \
    rm -rf /root/.cache && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /aws
ENTRYPOINT ["aws"]
