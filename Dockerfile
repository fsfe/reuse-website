# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

# =============================================================================
# Configure webserver
# =============================================================================

FROM httpd:alpine AS webserver-prep

# Copy our vhost config & tell Apache to use it
COPY vhost.conf /usr/local/apache2/conf/
RUN echo "Include conf/vhost.conf" >> /usr/local/apache2/conf/httpd.conf

## Enable mod_expires module
# Listen on our custom port & enable expires & rewrite modules
RUN sed -i \
  -e 's/Listen 80/Listen 8080/' \
  -e 's/#LoadModule expires_module/LoadModule expires_module/' \
  -e 's/#LoadModule rewrite_module/LoadModule rewrite_module/' \
  /usr/local/apache2/conf/httpd.conf



# =============================================================================
# Development Preparation: run po4a and hugo
# =============================================================================

FROM alpine AS dev-prep

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

FROM webserver-prep AS development

COPY --from=dev-prep /app/site/public/ /app/


# =============================================================================
# Production (use the site built in hugo step in .drone.yml)
# =============================================================================

FROM webserver-prep AS production

COPY site/public/ /app/
