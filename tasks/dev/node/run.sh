#!/bin/bash
TASK_HOME=$(dirname "$0")
source "$UTILS_DIR"/selectable_install.sh

brew bundle --file "$TASK_HOME"/Brewfile --no-lock

mkdir -p "$HOME"/.nvm
printf "%s\n%s\n%s\n" "export NVM_DIR=\"$HOME/.nvm\"" "[ -s \"/usr/local/opt/nvm/nvm.sh\" ] && \. \"/usr/local/opt/nvm/nvm.sh\"" "[ -s \"/usr/local/opt/nvm/etc/bash_completion.d/nvm\" ] && \. \"/usr/local/opt/nvm/etc/bash_completion.d/nvm\"" >> "$HOME"/.zshrc
