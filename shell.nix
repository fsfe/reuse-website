# SPDX-FileCopyrightText: 2025 Free Software Foundation Europe <https://fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # we assume the repo is cloned so git is available
  # we assume awk is present
  buildInputs = with pkgs; [
    drone-cli # signing
  ];
  shellHook = ''
  # DRONE
  export DRONE_SERVER=https://drone.fsfe.org
  export DRONE_TOKEN

  DRONE_FILE=drone_token.txt
  if [[ -r $DRONE_FILE ]]; then
     DRONE_TOKEN=$(cat $DRONE_FILE)
  else
     echo "Insert your drone token (found at $DRONE_SERVER/account)"
     read -r -p "Token: " DRONE_TOKEN
     echo -n $DRONE_TOKEN > $DRONE_FILE
  fi
  unset DRONE_FILE

  REPO_NAME="$(git remote get-url origin | awk -F "[:.]" '{printf $4}')"
  alias save="drone sign --save $REPO_NAME && printf 'Hash saved!' && git add .drone.yml"

  echo "You are working on $REPO_NAME repository."
  echo "Use the \"save\" alias to drone sign and git commit your drone.yml changes."
  '';
}
