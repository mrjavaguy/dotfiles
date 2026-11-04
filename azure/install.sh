#!/usr/bin/env bash
set -euo pipefail

case "$(uname -s)" in
    Linux)
        if ! command -v apt-get >/dev/null 2>&1; then
            echo "Azure CLI installation requires apt on Linux." >&2
            exit 1
        fi
        if ! dpkg-query -W -f='${Status}' azure-cli 2>/dev/null | grep -Fxq 'install ok installed'; then
            tmp_dir="$(mktemp -d)"
            trap 'rm -rf "$tmp_dir"' EXIT
            curl --proto '=https' --tlsv1.2 -fSL https://aka.ms/InstallAzureCLIDeb \
                -o "$tmp_dir/install.sh"
            sudo bash "$tmp_dir/install.sh" -y
        fi
        /usr/bin/az --version
        ;;
    Darwin)
        if ! command -v brew >/dev/null 2>&1; then
            echo "Azure CLI installation requires Homebrew on macOS." >&2
            exit 1
        fi
        if ! brew list --versions azure-cli >/dev/null 2>&1; then
            brew install azure-cli
        fi
        "$(brew --prefix)/bin/az" --version
        ;;
    *)
        echo "Unsupported OS for Azure CLI: $(uname -s)" >&2
        exit 1
        ;;
esac
