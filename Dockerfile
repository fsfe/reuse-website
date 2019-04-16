FROM php:7-apache

ENV HUGO_VERSION 0.54.0
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

COPY ./site /tmp/reuse-web/

# copy markdown files from submodule
COPY ./reuse-docs/practices /tmp/reuse-web/content/practices

# copy generated PDF files from reuse-docs' shared volume, build website, and run apache
CMD cp /tmp/pdf/*.pdf /tmp/reuse-web/static/ && \
    hugo -s /tmp/reuse-web -d /var/www/html && \
    apache2-foreground
