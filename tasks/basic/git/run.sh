#!/bin/bash
TASK_HOME=$(dirname "$0")

read -erp "[Git] Enter username: " name
read -erp "[Git] Enter email: " email

cp -i "$TASK_HOME"/.gitconfig "$HOME"/.gitconfig

sed -i "" "s|___NAME___|$name|g" "$HOME"/.gitconfig
sed -i "" "s|___EMAIL___|$email|g" "$HOME"/.gitconfig
sed -i "" "s|___HOME___|"$HOME"|g" "$HOME"/.gitconfig

brew bundle --file "$TASK_HOME"/Brewfile --no-lock
