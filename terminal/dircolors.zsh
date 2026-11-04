# Colors/GNU ls
dircolors_args=(-b)
if [[ -r "$HOME/.dircolors-solarized/dircolors.256dark" ]]; then
	dircolors_args+=("$HOME/.dircolors-solarized/dircolors.256dark")
fi
if command -v dircolors >/dev/null 2>&1; then
	eval "$(dircolors "${dircolors_args[@]}")"
elif command -v gdircolors >/dev/null 2>&1; then
	eval "$(gdircolors "${dircolors_args[@]}")"
fi
unset dircolors_args

# Grep highlight color
export GREP_COLOR='1;31'