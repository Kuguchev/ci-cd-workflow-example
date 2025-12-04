FROM golang:1.25-alpine AS builder

ARG BUILDER_NAME
ARG BUILDER_EMAIL

RUN apk add --no-cache git=2.52.0-r0 make=4.4.1-r3

WORKDIR /src

RUN git clone --depth 1 --branch main https://github.com/checkmake/checkmake.git .

ENV GOOS=linux GOARCH=amd64 CGO_ENABLED=0

RUN make binaries

FROM alpine:3.22

USER nobody

COPY --from=builder /src/checkmake /usr/local/bin/checkmake
