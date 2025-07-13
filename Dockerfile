FROM alpine:edge

RUN apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
    pptpclient dante-server shadow

COPY entrypoint.sh /entrypoint.sh
COPY sockd.conf /etc/sockd.conf

EXPOSE 1080

ENTRYPOINT ["/entrypoint.sh"]
