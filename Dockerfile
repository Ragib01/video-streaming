FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y build-essential git libpcre3-dev libssl-dev zlib1g-dev

WORKDIR /livestr

COPY nginx /nginx
COPY nginx-rtmp-module /nginx-rtmp-module

WORKDIR /livestr/nginx

RUN ./auto/configure --add-module=../nginx-rtmp-module && \
    make && \
    make install
