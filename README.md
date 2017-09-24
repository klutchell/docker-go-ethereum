# docker-go-ethereum
minimal ethereum client docker image using alpine and golang

## Tags
| tag | platform | base |
| --- | --- | --- |
| latest | arm32v7 | [resin/raspberrypi3-alpine-golang](https://hub.docker.com/r/resin/raspberrypi3-alpine-golang/) |
| alpine | arm32v7 | [resin/raspberrypi3-alpine-golang](https://hub.docker.com/r/resin/raspberrypi3-alpine-golang/) |
| rpi3 | arm32v7 | [resin/raspberrypi3-alpine-golang](https://hub.docker.com/r/resin/raspberrypi3-alpine-golang/) |

## Usage
Follow the instructions here but replace `ethereum/client-go` with `klutchell/raspberrypi3-geth`:
https://github.com/ethereum/go-ethereum/wiki/Running-in-Docker

## Author
Kyle Harding <kylemharding@gmail.com>

## Sources
* https://github.com/ethereum/go-ethereum/wiki/Running-in-Docker
* https://github.com/resin-io-library/base-images
