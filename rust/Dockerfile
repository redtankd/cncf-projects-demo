FROM ubuntu:latest

ARG USERHOME=/root

# expected kcov's git commit
ARG KCOV_GIT_REF

# install dependecies
RUN apt-get update && \
    apt-get install -y --fix-missing pkg-config && \
    apt-get install -y python-minimal g++ \
    git cmake cmake-data binutils-dev libiberty-dev \
    libdw-dev libelf-dev \
    wget curl libcurl4-openssl-dev zlib1g zlib1g-dev

# install kcov
ENV SRC_DIR_KCOV=$USERHOME/kcov-src \
    URL_GIT_KCOV=https://github.com/SimonKagstrom/kcov.git

RUN git clone $URL_GIT_KCOV $SRC_DIR_KCOV; \
    cd $SRC_DIR_KCOV; \
    # default to latest tagged version
    DEFAULT_KCOV_GIT_REF=$(git tag --list | grep "^v[0-9]\+$" | sort -V | tail --lines 1); \
    KCOV_GIT_REF=${KCOV_GIT_REF:-$DEFAULT_KCOV_GIT_REF}; \
    git reset --hard $KCOV_GIT_REF; \

    cd $SRC_DIR_KCOV && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

# install rust

ENV RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static \
    RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup \
    PATH=$USERHOME/.cargo/bin:$PATH

RUN curl https://sh.rustup.rs -sSf | \
		sh -s -- --default-toolchain stable -y && \
	rustup completions bash > /etc/bash_completion.d/rustup

COPY cargo-config $USERHOME/.cargo/config

RUN cargo install cargo-kcov

WORKDIR $USERHOME/dev

ENTRYPOINT [""]