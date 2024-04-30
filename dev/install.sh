git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null

export TARGET_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git -C "$TARGET_DIR" pull || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$TARGET_DIR"
export TARGET_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git -C "$TARGET_DIR" pull || git clone https://github.com/zsh-users/zsh-autosuggestions.git "$TARGET_DIR"