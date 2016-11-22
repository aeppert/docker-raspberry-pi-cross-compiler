#!/bin/bash

GO_URL=https://storage.googleapis.com/golang
GO_VER=go1.7.3.linux-armv6l.tar.gz

install_go() {
	GO_DEST=image/usr/local
	if [ ! -f "$GO_VER" ]; then
		curl -O -J $GO_URL/$GO_VER
	fi

	mkdir -p $GO_DEST	
	tar xvfj $GO_VER -C $GO_DEST
}

: ${RPXC_IMAGE:=aeppert/raspberry-pi-cross-compiler}

install_go
docker build -t $RPXC_IMAGE .
