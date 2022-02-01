#!/bin/bash
TASK_HOME=$(dirname "$0")

brew bundle --file "$TASK_HOME"/Brewfile --no-lock

# Setup nvm
mkdir -p "$HOME"/.nvm
COMMANDS=(
    "export NVM_DIR=\"$HOME/.nvm\""
    "[ -s \"/usr/local/opt/nvm/nvm.sh\" ] && . \"/usr/local/opt/nvm/nvm.sh\""
    "[ -s \"/usr/local/opt/nvm/etc/bash_completion.d/nvm\" ] && . \"/usr/local/opt/nvm/etc/bash_completion.d/nvm\""
)
for cmd in "${COMMANDS[@]}"
do
    sed -i "" /"${cmd//\//\\/}"/d "$HOME"/.zshrc
    echo "$cmd" >> "$HOME"/.zshrc
done
