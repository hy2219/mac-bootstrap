#!/bin/bash
TASK_HOME=$(dirname "$0")
source "$UTILS_DIR"/selectable_install.sh

read -erp "[Git] Enter username: " name
read -erp "[Git] Enter email: " email

cp -i "$TASK_HOME"/.gitconfig "$HOME"/.gitconfig

sed -i "" "s|___NAME___|$name|g" "$HOME"/.gitconfig
sed -i "" "s|___EMAIL___|$email|g" "$HOME"/.gitconfig
sed -i "" "s|___HOME___|"$HOME"|g" "$HOME"/.gitconfig

install_selectable_options "$TASK_HOME"
