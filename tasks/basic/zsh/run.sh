#!/bin/bash
TASK_HOME=$(dirname "$0")
source "$UTILS_DIR"/clone_git.sh
source "$UTILS_DIR"/print.sh

sudo chmod -R 755 "$HOME"/.oh-my-zsh
brew bundle --file "$TASK_HOME"/Brewfile --no-lock

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Add oh-my-zsh plugins
clone_git https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions zsh-autosuggestions
clone_git https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting zsh-syntax-highlighting
sed -i "" "s/plugins=(git)/plugins=(\n\tgit\n\tzsh-autosuggestions\n\tzsh-syntax-highlighting\n)/g" "$HOME"/.zshrc

# Install Powerlevel10k theme
clone_git https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k powerlevel10k
sed -i "" "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" "$HOME"/.zshrc
sed -i "" "/source ~\/.p10k.zsh/d" "$HOME"/.zshrc
echo "source ~/.p10k.zsh" >> "$HOME"/.zshrc

# Set oh-my-zsh directory permissions to 755
sudo chmod -R 755 "$HOME"/.oh-my-zsh

print "> Check if theme and plugins are set correctly in .zshrc"
