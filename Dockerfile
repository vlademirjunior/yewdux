FROM rust:1.78

RUN rustup target add wasm32-unknown-unknown

RUN cargo install trunk

# Rename trunk serve because we need install other trunk tool (lint)
RUN mv /usr/local/cargo/bin/trunk /usr/local/cargo/bin/trunks

RUN cargo install -f wasm-bindgen-cli

WORKDIR /yewduxrs

COPY . .

EXPOSE 8080
