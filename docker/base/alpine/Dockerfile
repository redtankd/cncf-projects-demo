ARG ALPINE_VERSION=latest

FROM alpine:${ALPINE_VERSION}

ARG USER_HOME=/root

RUN apk update && apk upgrade && \
	apk add --no-cache ncurses fish git vim wget curl tzdata

RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV LANG zh_CN.UTF-8

WORKDIR $USER_HOME

COPY config/fish/config.fish .config/fish/config.fish
COPY config/fish/functions/* .config/fish/functions/
COPY gitconfig .gitconfig