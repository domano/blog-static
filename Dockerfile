FROM alpine as builder

ENV HUGO_VERSION 0.37.1

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp/hugo.tar.gz

RUN tar xvf /tmp/hugo.tar.gz hugo -C /

COPY gomano/ gomano/

RUN /hugo -s /gomano/ -d /site/


FROM abiosoft/caddy

COPY --from=builder /site/ /srv

