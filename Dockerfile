FROM rust:1.54.0-alpine3.14

RUN apk update && apk add musl-dev

WORKDIR /usr/local/src/

ADD Cargo.toml Cargo.lock ./
RUN cargo update

RUN cargo fetch
COPY src src
RUN cargo build --release

RUN strip /usr/local/src/target/release/httpecho

FROM scratch
COPY --from=0 /usr/local/src/target/release/httpecho /httpecho
EXPOSE 8080
CMD [ "/httpecho" ]