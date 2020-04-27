#!/bin/bash
# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This script synchronises all markdown directories from the reuse-docs
# submodule into the site directory.

basedir=$(cd `dirname $0`; pwd)

cd $basedir/reuse-docs
po4a po/po4a.conf

for f in faq.md spec.md tutorial.md; do
  rm -f $basedir/site/content/"$f"
  cp $basedir/reuse-docs/"$f" $basedir/site/content/"$f"
  for tf in $basedir/reuse-docs/*/"$f"; do
      test -e $tf || continue
      locale=$(basename $(dirname $tf))
      localedir=$basedir/site/content/$locale
      test -d $localedir || mkdir $localedir
      rm -f $basedir/site/content/$locale/"$tf"
      cp "$tf" $basedir/site/content/$locale/"$f"
  done
done
