# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

FROM php:7-apache

ENV HUGO_VERSION 0.63.2
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

COPY . /tmp/reuse-website

RUN /tmp/reuse-website/sync-docs.sh

RUN hugo -s /tmp/reuse-website/site -d /var/www/html

COPY 000-default.conf /etc/apache2/sites-enabled/

RUN a2enmod rewrite headers expires

CMD apache2-foreground
