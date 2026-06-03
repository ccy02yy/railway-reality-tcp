FROM alpine:latest

RUN apk add --no-cache ca-certificates wget unzip && \
    wget -qO- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | busybox unzip - && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*

COPY config.json /config.json

CMD ["/xray", "-c", "/config.json"]
