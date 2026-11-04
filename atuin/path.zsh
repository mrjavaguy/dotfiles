export PATH="$HOME/.atuin/bin:$PATH"

# Keep Linuxbrew installations available when the standalone binary is absent.
if ! (( $+commands[atuin] )) && [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
