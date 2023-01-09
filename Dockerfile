##--- Builder image ---##
FROM rust:1.66.0-slim-buster AS builder

# Create appuser
ENV USER=rust
ENV UID=10001

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/home/rust" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    "${USER}"

RUN mkdir -p /home/rust/.cargo && \
    chown -R rust:rust /home/rust/.cargo

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i 's/deb.debian.org/mirrors.cloud.tencent.com/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.cloud.tencent.com/g' /etc/apt/sources.list

COPY ./config /home/rust/.cargo/config

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -yq \
        build-essential \
        cmake \
        curl \
        file \
        git \
        graphviz \
        musl-dev \
        musl-tools \
        libpq-dev \
        libsqlite-dev \
        libssl-dev \
        linux-libc-dev \
        pkgconf \
        sudo \
        unzip \
        xutils-dev \
        && \
    apt-get clean && rm -rf /var/lib/apt/lists/*