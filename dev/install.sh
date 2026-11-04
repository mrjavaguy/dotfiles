export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
if [ ! -r "$ZSH/oh-my-zsh.sh" ]; then
	if [ -d "$ZSH" ]; then
		temp_dir=$(mktemp -d)
		trap 'rm -rf "$temp_dir"' EXIT
		git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$temp_dir/oh-my-zsh" || exit 1
		cp -Rn "$temp_dir/oh-my-zsh/." "$ZSH/" || exit 1
	else
		git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$ZSH" || exit 1
	fi
fi

export ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
theme_dir="$ZSH_CUSTOM/themes/powerlevel10k"
if [ ! -r "$theme_dir/powerlevel10k.zsh-theme" ]; then
	mkdir -p "$ZSH_CUSTOM/themes"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$theme_dir" || exit 1
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null

export TARGET_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git -C "$TARGET_DIR" pull || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$TARGET_DIR"
export TARGET_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git -C "$TARGET_DIR" pull || git clone https://github.com/zsh-users/zsh-autosuggestions.git "$TARGET_DIR"

