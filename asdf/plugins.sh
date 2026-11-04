#!/usr/bin/env bash
set -euo pipefail

plugins=(
  nodejs
  kubectl
  flux2
  age
  awscli
  golang
  python
  helm
  jq
  k9s
  kubectx
  krew
  tmux
  github-cli
)

installed_plugins="$(asdf plugin list)"
for plugin in "${plugins[@]}"; do
  if ! grep -Fxq "$plugin" <<< "$installed_plugins"; then
    asdf plugin add "$plugin"
  fi
done