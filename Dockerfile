FROM rust:1.78

RUN rustup target add wasm32-unknown-unknown

RUN cargo install trunk && mv /usr/local/cargo/bin/trunk /usr/local/cargo/bin/trunks

RUN cargo install -f wasm-bindgen-cli

EXPOSE 8080

VOLUME [ "/yewduxrs" ]

WORKDIR /yewduxrs

#  Can use CMD [ "sleep", "infinity" ]
CMD [ "trunks", "serve" ]
