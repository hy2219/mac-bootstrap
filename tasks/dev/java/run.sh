#!/bin/bash
TASK_HOME=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

brew bundle --file "$TASK_HOME"/Brewfile --no-lock
