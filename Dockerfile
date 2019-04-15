FROM php:7-apache

ENV HUGO_VERSION 0.54.0
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

COPY ./site /tmp/reuse-web/

RUN hugo -s /tmp/reuse-web

RUN rm -r /var/www/html && \
    mv /tmp/reuse-web/public /var/www && \
    mv /var/www/public /var/www/html && \
    rm -r /tmp/reuse-web

CMD apache2-foreground
