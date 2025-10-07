# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

# =============================================================================
# Configure webserver
# =============================================================================

FROM httpd:alpine as webserver-prep

# Copy our vhost config & tell Apache to use it
COPY reuse.software.conf /usr/local/apache2/conf/vhost.conf
RUN echo "Include conf/vhost.conf" >> /usr/local/apache2/conf/httpd.conf

## Enable mod_expires module
# Listen on our custom port & enable expires module
RUN sed -i \
  -e 's/Listen 80/Listen 8080/' \
  -e 's/#LoadModule expires_module/LoadModule expires_module/' \
  /usr/local/apache2/conf/httpd.conf



# =============================================================================
# Development Preparation: run po4a and hugo
# =============================================================================

FROM alpine:3.20 as dev-prep

# Dependencies
RUN apk --no-cache add bash perl-yaml-tiny po4a hugo python3 diffutils

COPY . /app

WORKDIR /app/

# Run po4a for reuse-website po strings
RUN po4a po4a.conf

# Create .status file for important i18n translation strings
RUN python3 check_translations.py site/i18n

# Build hugo
RUN hugo -s site


# =============================================================================
# Development (use the site built in dev-prep)
# =============================================================================

FROM webserver-prep as development

COPY --from=dev-prep /app/site/public/ /app/


# =============================================================================
# Production (use the site built in hugo step in .drone.yml)
# =============================================================================

FROM webserver-prep as production

COPY site/public/ /app/
