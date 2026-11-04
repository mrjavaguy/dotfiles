#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
. "$script_dir/path.zsh"

if ! command -v asdf >/dev/null 2>&1; then
    version=0.20.2
    case "$(uname -s)" in
        Linux) os=linux ;;
        Darwin) os=darwin ;;
        *) echo "Unsupported OS for asdf: $(uname -s)" >&2; exit 1 ;;
    esac
    case "$(uname -m)" in
        x86_64|amd64) arch=amd64 ;;
        aarch64|arm64) arch=arm64 ;;
        *) echo "Unsupported architecture for asdf: $(uname -m)" >&2; exit 1 ;;
    esac
    tmp_dir="$(mktemp -d)"
    trap 'rm -rf "$tmp_dir"' EXIT
    curl -fSL "https://github.com/asdf-vm/asdf/releases/download/v${version}/asdf-v${version}-${os}-${arch}.tar.gz" \
        -o "$tmp_dir/asdf.tar.gz"
    tar -xzf "$tmp_dir/asdf.tar.gz" -C "$tmp_dir" asdf
    mkdir -p "$HOME/.local/bin"
    install -m 755 "$tmp_dir/asdf" "$HOME/.local/bin/asdf"
fi

bash "$script_dir/plugins.sh"
cd "$script_dir"
ASDF_TOOL_VERSIONS_FILENAME=tool-versions.symlink asdf install
