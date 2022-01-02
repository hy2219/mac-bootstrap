#!/bin/bash
TASK_HOME=$(dirname "$0")

read -erp "[AWS] Enter region: " region
read -erp "[AWS] Enter access key: " access_key
read -erp "[AWS] Enter secret access key: " secret_key

cp -ai "$TASK_HOME"/.aws "$HOME"

sed -i "" "s|___REGION___|$region|g" "$HOME"/.aws/config
sed -i "" "s|___ACCESS_KEY___|$access_key|g" "$HOME"/.aws/credentials
sed -i "" "s|___SECRET_KEY___|$secret_key|g" "$HOME"/.aws/credentials


brew bundle --file "$TASK_HOME"/Brewfile --no-lock
