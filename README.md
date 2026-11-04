# mrjavaguy dotfiles

Your dotfiles are how you personalize your system. These are mine.

based on https://github.com/DanielThomas/oh-your-dotfiles?tab=readme-ov-file

## Install

Run this:

initial setup
```sh
git clone https://github.com/haacked/dotfiles.git ~/.dotfiles
dotfiles_install
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

`script/bootstrap` links dotfiles and runs dependency installation on macOS and
Linux. To run only dependency installation, use `bash script/install`.
On Linux with apt, this installs packages listed in topic `install.apt` files
before running `install.sh` scripts. Package lists accept whitespace-separated
names, blank lines, and `#` comments. Apt operations require sudo.

`bin/dot` also runs dependency installation, from any working directory.
Topic installers run with Bash and stop on failure. The asdf installer downloads
the pinned prebuilt binary into `~/.local/bin` when asdf is not on PATH, then
installs plugins and tools from `asdf/tool-versions.symlink`. Zsh startup adds
`~/.local/bin` and the asdf shims directory to PATH.

On apt-based Linux systems, `asdf/install.apt` supplies the compiler and
development libraries required to build Python. Azure CLI is installed separately
using Microsoft's official apt setup script on Linux, or Homebrew on macOS.
It is no longer version-pinned or installed through asdf. Existing asdf Azure CLI
installations are left untouched; if an old `az` shim shadows the system binary,
remove the old plugin with `asdf plugin remove azure-cli` after migration.

The Atuin installer reuses an existing binary or runs the upstream setup script,
then verifies `atuin --version`. Its standalone install directory,
`~/.atuin/bin`, is added to PATH during installation and Zsh startup.

Bootstrap also links `zsh/zshrc.symlink` to `~/.zshrc`. Zsh startup sources
topic `path.zsh` files first, then Oh My Zsh settings and plugin lists, other
topic `.zsh` files, and finally `completion.zsh` files. Without Oh My Zsh,
the loader initializes zsh completion directly. To try it in an existing zsh
session before linking, run `source ~/.dotfiles/zsh/zshrc.symlink`.
