# Description:
#	docker geth client for raspberrypi3
#	based on https://github.com/ethereum/go-ethereum/blob/master/Dockerfile
#	and modified for raspberrypi3

# Usage:
#	https://github.com/ethereum/go-ethereum/wiki/Running-in-Docker

# build Geth in a stock Go builder container
FROM resin/%%RESIN_MACHINE_NAME%%-alpine-golang:latest as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

RUN go get -d -v github.com/ethereum/go-ethereum

RUN cd /go/src/github.com/ethereum/go-ethereum && make geth

# pull Geth into a second stage deploy alpine container
FROM resin/%%RESIN_MACHINE_NAME%%-alpine:latest

RUN apk add --no-cache ca-certificates

COPY --from=builder /go/src/github.com/ethereum/go-ethereum/build/bin/geth /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp

# persist downloaded blockchain data between container starts
VOLUME /root/.ethereum

ENTRYPOINT ["geth"]
