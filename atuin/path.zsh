# atuin.zsh is sourced before zshrc runs `brew shellenv`, so make sure brew's bin is on PATH
if ! (( $+commands[atuin] )) && [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
