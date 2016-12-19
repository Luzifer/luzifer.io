FROM nginx

ENV HUGO_VERSION 0.17

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp/hugo.tgz
RUN set -ex \
 && tar -C /usr/local/bin -xz -f /tmp/hugo.tgz --wildcards --strip-components=1 '*/hugo*' \
 && ln -sf /usr/local/bin/hugo* /usr/local/bin/hugo \
 && rm /tmp/hugo.tgz

ADD . /src
WORKDIR /src
RUN set -ex \
 && /usr/local/bin/hugo --baseUrl=https://ahlers.me/ --destination /opt/webroot

ENTRYPOINT ["nginx", "-c", "/src/nginx.conf"]
