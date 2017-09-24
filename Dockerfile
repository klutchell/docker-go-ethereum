FROM resin/raspberrypi3-alpine-golang:latest as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

RUN go get -d -v github.com/ethereum/go-ethereum

RUN cd /go/src/github.com/ethereum/go-ethereum && make geth

FROM resin/raspberrypi3-alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/ethereum/go-ethereum/build/bin/geth /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["geth"]
