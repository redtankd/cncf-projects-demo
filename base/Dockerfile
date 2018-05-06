ARG LINUX_VERSION=ubuntu:latest
FROM ${LINUX_VERSION}

ARG USER_HOME=/root

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:fish-shell/release-2
RUN apt-get update
RUN apt-get install -y fish git vim wget curl

WORKDIR $USER_HOME

COPY config/fish/config.fish .config/fish/config.fish
COPY config/fish/functions/* .config/fish/functions/
COPY gitconfig .gitconfig