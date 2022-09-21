#!/bin/bash
TASK_HOME=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$UTILS_DIR"/print.sh

brew bundle --file=./Brewfile

print "> Done installing duet dependencies"

users=()
user_emails=()

while : 
do
  read -erp "Signature (enter empty string to stop): " signature
  if [[ -z "$signature" ]]; then break; fi

  read -erp "Name (enter empty string to stop): " name
  if [[ -z "$name" ]]; then break; fi

  users+=("$signature: $name")

  read -erp "Email (optional): " email
  if [[ -z "$email" ]]
  then
        echo "No Email for $name"
  else
        user_emails+=("$signature: $email")
  fi
done

settings_string='authors:'

for current_user in "${users[@]}"
do
  settings_string+="\n  $current_user"
done

settings_string+="\nemail_addresses:"
for current_email in "${user_emails[@]}"
do
  settings_string+="\n  $current_email"
done

touch ~/.git-authors
echo "$settings_string\n" > ~/.git-authors

print $settings_string

echo "Use the following commands:
  - commit: git duet-commit -v
  - revert: git duet-revert -v
  - merge: git duet-merge -v
  - rebase: git rebase -i --exec 'git duet-commit --amend'
"

print "> Done setting up duet"
