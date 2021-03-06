#!/bin/bash
TASK_HOME=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$UTILS_DIR"/print.sh

mkdir -p "$HOME"/.ssh
touch "$HOME"/.ssh/config

if grep "Host *" "$HOME"/.ssh/config ; then
  print "> Base ssh configuration already exists...Skipping..."
else
  cat "$TASK_HOME"/config >> "$HOME"/.ssh/config
fi

if grep "github" "$HOME"/.ssh/config ; then
  print "> Github ssh configuration already exists...Skipping..."
else
  cat "$TASK_HOME"/config-git >> "$HOME"/.ssh/config
fi

print "> SSH configuration has been updated\n> Please check .ssh/config manually"
