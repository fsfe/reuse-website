# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

# =============================================================================
# Configure webserver
# =============================================================================

FROM bitnami/apache:2.4 as webserver-prep

COPY reuse.software.conf /vhosts/

## Enable mod_expires module
RUN sed -i -r 's/#LoadModule expires_module/LoadModule expires_module/' /opt/bitnami/apache/conf/httpd.conf


# =============================================================================
# Production (use the site built in hugo step in .drone.yml)
# =============================================================================

FROM webserver-prep as production

COPY site/public/ /app/


# =============================================================================
# Development Preparation: run sync-docs, po4a and hugo
# =============================================================================

FROM alpine:3 as dev-prep

# Dependencies
RUN apk --no-cache add bash perl-yaml-tiny po4a hugo

COPY . /app

WORKDIR /app/

# sync and translate docs (from their own po files)
RUN bash sync-docs.sh

# Run po4a for reuse-website po strings
RUN cd site/ && po4a po/po4a.conf

# Build hugo
RUN hugo -s site


# =============================================================================
# Production (use the site built in dev-prep)
# =============================================================================

FROM webserver-prep as development

COPY --from=dev-prep /app/site/public/ /app/
