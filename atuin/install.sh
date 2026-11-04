#!/usr/bin/env bash
set -euo pipefail

export PATH="$HOME/.atuin/bin:$PATH"

if ! command -v atuin >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh -s -- --non-interactive
fi

atuin --version
