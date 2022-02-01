#!/bin/bash

# Setup Directories
HOME_DIR=$(pwd)/$(dirname "$0")
printf "Working on: %s\n\n" "$HOME_DIR"
sudo chmod -R 777 "$HOME_DIR"

TASKS_DIR=$HOME_DIR/tasks
UTILS_DIR=$HOME_DIR/utils
export UTILS_DIR

# Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.
if [[ -z $(xcode-select -p) ]] ; then
  xcode-select --install
fi
softwareupdate --all --install --force

# Install Homebrew
if [[ -z $(which brew) ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Setup Brew
brew bundle --file "$HOME_DIR"/Brewfile --no-lock

# Run tasks
source "$UTILS_DIR"/run_set.sh
run_taskset basic
run_taskset dev
run_taskset etc
sh "$TASKS_DIR"/aws/run.sh
