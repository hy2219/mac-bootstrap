#!/bin/bash
TASK_HOME=$(dirname "$0")
source "$UTILS_DIR"/print.sh

brew bundle --file "$TASK_HOME"/Brewfile --no-lock

cp -i "$TASK_HOME"/predefined_profiles.json "$HOME"/Library/Application\ Support/iTerm2/DynamicProfiles/predefined_profiles.json

print "> Set profile in iTerm2:\n\n1. Open iTerm2\n2. Press cmd + ,\n3. Click 'Profiles' tab\n4. Select newly added profile"
