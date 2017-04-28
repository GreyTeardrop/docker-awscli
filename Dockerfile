FROM python:3.5-slim
MAINTAINER Nikolay Rybak <mykola.rybak@gmail.com>

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="AWS CLI" \
      org.label-schema.url="https://aws.amazon.com/cli/" \
      org.label-schema.vcs-url="https://github.com/GreyTeardrop/docker-awscli" \
      org.label-schema.version="1.11.81"

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends groff-base && \
    mkdir -p /aws && \
    pip install --upgrade awscli==1.11.81 && \
    rm -rf /root/.cache && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /aws
ENTRYPOINT ["aws"]
