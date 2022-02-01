#!/bin/bash

cleanup () {
    FILE_DIR=$1
    rm -f "$FILE_DIR"/Brewfile.tmp
}

get_user_selected_options () {
    FILE_DIR=$1
    oifs=$IFS
    IFS=$'\n' read -d '' -r -a rawOptions <<< "$(grep -v "^tap" "$FILE_DIR"/Brewfile)"
    IFS=$oifs

    choice () {
        local choice=$1
        if [[ ${selected[choice]} ]]
        then
            selected[choice]=
        else
            selected[choice]=+
        fi
    }

    PS3='Please enter your choice: '
    while :
    do
        clear
        for i in "${!rawOptions[@]}"; do
            baseOptions[$i]="${selected[$i]}${rawOptions[$i]}"
        done
        baseOptions[${#rawOptions[@]}]="Select All"
        baseOptions[${#rawOptions[@]}+1]="Select None"
        baseOptions[${#rawOptions[@]}+2]="Done"

        select opt in "${baseOptions[@]}"
        do
            for i in "${!baseOptions[@]}"
            do
                case $opt in
                    "${baseOptions[$i]}")
                        choice "${i-1}"
                        break 2;;
                    "Select All")
                        selected=("${rawOptions[@]/*/+}")
                        break 2;;
                    "Select None")
                        selected=("${rawOptions[@]/*/}")
                        break 2;;
                    "Done")
                        break 3;;
                    *)
                esac
            done
        done
    done

    for opt in "${!selected[@]}"
    do
        if [[ ${selected[opt]} == "+" ]]
        then
            echo "${rawOptions[$opt]}" >> "$FILE_DIR"/Brewfile.tmp
        fi
    done
}

prepare_brewfile () {
    FILE_DIR=$1
    grep -hr "^tap" "$FILE_DIR"/Brewfile > "$FILE_DIR"/Brewfile.tmp
}

install_selectable_options () {
    FILE_DIR=$1
    trap 'cleanup $FILE_DIR' EXIT

    prepare_brewfile "$FILE_DIR"
    get_user_selected_options "$FILE_DIR"
    brew bundle --file "$FILE_DIR"/Brewfile.tmp --no-lock
    cleanup "$FILE_DIR"
}
