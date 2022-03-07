#!/bin/bash

# Setup Directories
HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
printf "Working on: %s\n\n" "$HOME_DIR"
UTILS_DIR=$HOME_DIR/utils

# Override then remove personal data
cd ~ || exit
source "$UTILS_DIR"/random.sh

RED='\033[0;31m'
NC='\033[0m'
echo "$RED"
read -erp "[Warning] This will remove .gitconfig, all files in .ssh and .aws. Continue? (y/n [n])" input_continue
echo "$NC"

if [[ $input_continue != "y" ]] && [[ $input_continue != "Y" ]] ; then
  exit
fi

"get_random_string" > .gitconfig

for file in .aws
do
  "get_random_string" > file
done

for file in .ssh
do
  "get_random_string" > file
done

sudo rm -rf .gitconfig .aws .ssh
