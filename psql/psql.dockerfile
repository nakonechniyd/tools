FROM postgres:latest

RUN apt-get update && apt-get install -y \
    less \
    curl \
    && curl https://getmic.ro | bash \
    && apt-get purge -y curl \
    && rm -rf /var/lib/apt/lists/*

ENV PAGER less -S
ENV EDITOR micro
