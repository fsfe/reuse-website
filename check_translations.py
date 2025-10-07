"""Check which i18n translation files contain all index_ strings from EN"""

# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

import json
import glob
import sys
import os

basedir = os.path.realpath(sys.argv[1])

# Load English strings in a dict
with open(f"{basedir}/en.json", encoding="UTF-8") as jsonfile:
    en = json.load(jsonfile)

# Clear status file
with open(f"{basedir}/.status", "w"):
    pass

# load all index strings
indexes = []
for k, v in en.items():
    if k.startswith("index_"):
        indexes.append(k)

# get all i18n string files
i18nfiles = glob.glob(f"{basedir}/*.json")

# Interate through translation files and check their completeness
for trans in i18nfiles:
    lang = os.path.splitext(os.path.basename(trans))[0]

    # skip English
    if lang == "en":
        continue

    else:
        # initialise key counter
        transstrings = 0

        # Load JSON file
        with open(trans, encoding="UTF-8") as jsonfile:
            trans = json.load(jsonfile)

        # Check for all important strings whether they exist in translation
        for key in indexes:
            if key in trans:
                transstrings += 1

        # Check if same amount of strings available
        if transstrings == len(indexes):
            with open(f"{basedir}/.status", "a") as statusfile:
                statusfile.write(f"{lang}\n")
        else:
            print(f'[WARN] Important keys for "{lang}" not complete!')
