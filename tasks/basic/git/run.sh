#!/bin/bash
TASK_HOME=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$UTILS_DIR"/selectable_install.sh

read -erp "[Git] Enter username: " name
read -erp "[Git] Enter email: " email

cp -i "$TASK_HOME"/.gitconfig "$HOME"/.gitconfig

sed -i "" "s|___NAME___|$name|g" "$HOME"/.gitconfig
sed -i "" "s|___EMAIL___|$email|g" "$HOME"/.gitconfig
sed -i "" "s|___HOME___|"$HOME"|g" "$HOME"/.gitconfig

install_selectable_options "$TASK_HOME"

read -erp "Install git-duet and portal[y/n]: " is_install_duet
if [[ $is_install_duet == "y" ]]; then
    sh "$TASK_HOME"/duet/run.sh;
fi
