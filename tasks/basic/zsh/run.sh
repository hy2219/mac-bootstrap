#!/bin/bash
TASK_HOME=$(dirname "$0")
source "$UTILS_DIR"/clone_git.sh
source "$UTILS_DIR"/print.sh

brew bundle --file "$TASK_HOME"/Brewfile --no-lock

# Install oh-my-zsh
if [[ -z $(zsh --version) ]] ; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Add oh-my-zsh plugins
clone_git https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions zsh-autosuggestions
clone_git https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting zsh-syntax-highlighting
sed -i "" "s/plugins=(git)/plugins=(\n\tgit\n\tzsh-autosuggestions\n\tzsh-syntax-highlighting\n)/g" "$HOME"/.zshrc

# Install Powerlevel10k theme
clone_git https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k powerlevel10k
sed -i "" "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" "$HOME"/.zshrc

print "> Check if theme and plugins are set correctly in .zshrc"
