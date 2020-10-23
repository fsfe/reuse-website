# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

FROM php:7-apache

ENV HUGO_VERSION 0.76.5
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

# Install po4a from backports to make use of all features
RUN echo "deb http://deb.debian.org/debian buster-backports main" > /etc/apt/sources.list.d/backports.list \
    && apt-get update && apt-get -t buster-backports install po4a -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download and install Hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

COPY . /tmp/reuse-website

RUN /tmp/reuse-website/sync-docs.sh

RUN hugo -s /tmp/reuse-website/site -d /var/www/html

COPY 000-default.conf /etc/apache2/sites-enabled/

RUN a2enmod rewrite headers expires

CMD apache2-foreground
