#!/bin/bash

[ `uname -s` != "Darwin" ] && echo "Cannot run on non-macosx system." && exit

function tab () {
    local cmd=""
    local cdto="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        cdto=`cd "$1"; pwd`
        args="${@:2}"
    fi

    if [ -n "$args" ]; then
        cmd="$args"
    fi

    osascript -i <<EOF
        tell application "iTerm"
            tell current window
                create tab with default profile
                tell the current session
                    write text "cd \"$cdto\"; $cmd; sleep 37 ;
                                cd rcrs-adf-sample; sh launch.sh -all"
                end tell
            end tell
        end tell
EOF
}

tab
