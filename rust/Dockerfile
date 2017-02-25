FROM ubuntu:latest

# kcov's git commit
ARG KCOV_GIT_REF

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-add-repository ppa:fish-shell/release-2
RUN apt-get update
RUN apt-get install -y --fix-missing pkg-config
RUN apt-get install -y fish \
    git cmake cmake-data binutils-dev libiberty-dev g++ \
    libdw-dev libelf-dev \
    wget curl libcurl4-openssl-dev zlib1g zlib1g-dev

COPY config.fish /root/.config/fish/config.fish

# install kcov
ENV SRC_DIR_KCOV=~/kcov-src \
    URL_GIT_KCOV=https://github.com/SimonKagstrom/kcov.git

RUN git clone $URL_GIT_KCOV $SRC_DIR_KCOV; \
    cd $SRC_DIR_KCOV; \
    # default to latest tagged version
    DEFAULT_KCOV_GIT_REF=$(git tag --list | grep "^v[0-9]\+$" | sort -V | tail --lines 1); \
    KCOV_GIT_REF=${KCOV_GIT_REF:-$DEFAULT_KCOV_GIT_REF}; \
    git reset --hard $KCOV_GIT_REF;

RUN cd $SRC_DIR_KCOV && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

# install rust

ENV RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static \
    RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

RUN curl https://sh.rustup.rs -sSf | sh -y

RUN cargo install cargo-kcov

ENTRYPOINT ["/usr/bin/fish"]
CMD [""]