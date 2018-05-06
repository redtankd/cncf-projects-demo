FROM redtankd/base

ARG USER_HOME=/root

# install dependecies

RUN apt-get update && \
    apt-get install -y --fix-missing pkg-config && \
    apt-get install -y python-minimal g++ \
        cmake cmake-data binutils-dev libiberty-dev \
        libdw-dev libelf-dev \
        libcurl4-openssl-dev zlib1g zlib1g-dev

# install kcov

# expected kcov's git commit
ARG KCOV_GIT_REF

ARG SRC_DIR_KCOV=$USER_HOME/dev/kcov-src 
ARG URL_GIT_KCOV=https://github.com/SimonKagstrom/kcov.git

RUN git clone $URL_GIT_KCOV $SRC_DIR_KCOV; \
    cd $SRC_DIR_KCOV; \
    # default to latest tagged version
    DEFAULT_KCOV_GIT_REF=$(git tag --list | grep "^v[0-9]\+$" | sort -V | tail --lines 1); \
    KCOV_GIT_REF=${KCOV_GIT_REF:-$DEFAULT_KCOV_GIT_REF}; \
    git reset --hard $KCOV_GIT_REF; \
    \
    cd $SRC_DIR_KCOV && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

# install rust

ARG RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static 

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y
RUN $USER_HOME/.cargo/bin/rustup toolchain install nightly

COPY cargo/config $USER_HOME/.cargo/config
COPY config/fish/config.fish $USER_HOME/.config/fish/config.fish.rust
RUN echo >> $USER_HOME/.config/fish/config.fish
RUN cat $USER_HOME/.config/fish/config.fish.rust >> $USER_HOME/.config/fish/config.fish
RUN rm $USER_HOME/.config/fish/config.fish.rust

RUN $USER_HOME/.cargo/bin/cargo install cargo-kcov
