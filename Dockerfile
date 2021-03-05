# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

FROM php:7-apache

COPY site/public/ /var/www/html

COPY 000-default.conf /etc/apache2/sites-enabled/

RUN a2enmod rewrite headers expires

CMD apache2-foreground
