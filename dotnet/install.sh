#!/bin/sh
#
# .NET SDK
#
# Uses Microsoft's signed .pkg on macOS and dotnet-install.sh on Linux.

set -e

case "$(uname -s)" in
  Linux)
    dotnet_dir="$HOME/.dotnet"
    if [ -x "$dotnet_dir/dotnet" ] && [ -n "$("$dotnet_dir/dotnet" --list-sdks)" ]; then
      echo "-> .NET SDK already installed at $dotnet_dir"
      exit 0
    fi

    tmp_dir="$(mktemp -d)"
    trap 'rm -rf "$tmp_dir"' EXIT
    curl -fSL https://dot.net/v1/dotnet-install.sh -o "$tmp_dir/dotnet-install.sh"
    echo "-> Installing .NET LTS SDK into $dotnet_dir"
    bash "$tmp_dir/dotnet-install.sh" --channel LTS --install-dir "$dotnet_dir"
    echo "-> .NET SDK installed"
    exit 0
    ;;
  Darwin) ;;
  *) echo "-> Unsupported OS for .NET install: $(uname -s)" ; exit 0 ;;
esac

# Already installed? The .pkg drops the SDK under /usr/local/share/dotnet.
if [ -x /usr/local/share/dotnet/dotnet ]; then
  echo "-> .NET SDK already installed at /usr/local/share/dotnet"
  exit 0
fi

arch="$(uname -m)"
case "$arch" in
  arm64) pkg_arch="osx-arm64" ;;
  x86_64) pkg_arch="osx-x64" ;;
  *) echo "-> Unsupported architecture for .NET install: $arch" ; exit 0 ;;
esac

# aka.ms redirects to the latest LTS SDK .pkg for this architecture.
pkg_url="https://aka.ms/dotnet/LTS/dotnet-sdk-${pkg_arch}.pkg"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT
pkg_path="$tmp_dir/dotnet-sdk.pkg"

echo "-> Downloading .NET LTS SDK ($pkg_arch)…"
curl -fSL "$pkg_url" -o "$pkg_path"

echo "-> Installing .NET SDK (requires sudo)…"
sudo installer -pkg "$pkg_path" -target /

echo "-> .NET SDK installed"