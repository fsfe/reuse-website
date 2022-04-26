# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

FROM bitnami/apache:2.4

COPY site/public/ /app/

COPY reuse.software.conf /vhosts/

## Enable mod_expires module
RUN sed -i -r 's/#LoadModule expires_module/LoadModule expires_module/' /opt/bitnami/apache/conf/httpd.conf
