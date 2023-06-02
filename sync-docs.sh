#!/bin/bash
# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
# SPDX-FileCopyrightText: 2020 Hans-Christoph Steiner <hans@eds.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This script synchronises all markdown directories from the reuse-docs
# submodule into the site directory.

basedir=$(cd "$(dirname "$0")" || exit; pwd)

cd "$basedir"/reuse-docs || exit

# Generate translations from .po files
po4a po/po4a.conf

# Only select relevant content files from reuse-docs
for f in faq.md spec.md tutorial.md; do
  # remove potentially existing files with the same name
  rm -f "$basedir"/site/content/"$f"
  # copy EN base files
  cp "$basedir"/reuse-docs/"$f" "$basedir"/site/content/en/"$f"
  # check for translated files in subfolders
  for tf in "$basedir"/reuse-docs/*/"$f"; do
      test -e "$tf" || continue
      # locale is the name of the directory (e.g. 'es')
      locale=$(basename "$(dirname "$tf")")
      localedir="$basedir"/site/content/"$locale"
      # create locale dir on website, and clean it
      test -d "$localedir" || mkdir "$localedir"
      rm -f "$basedir"/site/content/"$locale"/"$tf"
      # copy translated files to locale dir
      cp "$tf" "$basedir"/site/content/"$locale"/"$f"
  done
done

# Define variable
lint_schema_version="1.0.0"
lint_schema="$basedir"/reuse-docs/"$lint_schema_version"_lint_schema.json
# Copy this file to
cp "$lint_schema" "$basedir"/site/static/schemas

# Make permissions of newly generated folders the same as the already existing files
uidgid=$(stat -c '%u:%g' "$basedir")
chown -R "$uidgid" "$basedir"
