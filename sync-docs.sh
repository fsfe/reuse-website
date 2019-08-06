#!/bin/bash
# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This script synchronises all markdown directories from the reuse-docs
# submodule into the site directory.

cd $(dirname $0)

for f in faq.md spec.md tutorial.md; do
  rm -f site/content/"$f"
  cp reuse-docs/"$f" site/content/"$f"
done
