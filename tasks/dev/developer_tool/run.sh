#!/bin/bash
TASK_HOME=$(dirname "$0")

brew bundle --file "$TASK_HOME"/Brewfile --no-lock
