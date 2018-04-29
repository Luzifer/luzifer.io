FROM alpine:latest as builder

ENV HUGO_VERSION 0.40.1

RUN set -ex \
 && apk --no-cache add curl \
 && curl -sSfL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | \
    tar -C /usr/local/bin -xz 'hugo'

ADD . /src
WORKDIR /src
RUN set -ex \
 && /usr/local/bin/hugo --baseUrl=https://ahlers.me/ --destination /opt/webroot

FROM nginx:alpine

COPY --from=builder /opt/webroot /opt/webroot
COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
