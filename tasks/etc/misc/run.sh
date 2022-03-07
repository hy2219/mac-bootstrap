#!/bin/bash
TASK_HOME=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$UTILS_DIR"/selectable_install.sh

install_selectable_options "$TASK_HOME"
