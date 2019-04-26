#!/bin/bash
# SPDX-Copyright: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This script synchronises all markdown directories from the reuse-docs
# submodule into the site directory.

cd $(dirname $0)

rm -fr site/content/practices
cp -r reuse-docs/practices site/content/practices
