#!/usr/bin/env bash

set -e

HOW_DIR="$HOME/.how"

cd $HOW_DIR

start() {
    query=$1

    fzf --reverse \
        --preview='bat --color "always" {}' \
        --preview-window=right:70%:wrap \
        --query="$query" \
        --bind='ctrl-y:execute(cat {} | yank -l)+abort'
}

new() {
    [ -z "$1" ] && echo "Usage: ? new <path>" && exit 1
    file="$HOW_DIR/$1"
    mkdir -p "${file%/*}"
    $EDITOR $file.md
    [ -e $file.md ] && git add $file.md && git commit -m "Add $file.md"
}

edit() {
    file=$(start $@)
    $EDITOR $file
    git diff $file && git add $file && git commit -m "Edit $file"
}

remove() {
    file=$(start $@)
    rm "$file"
    [ ! -e $file ] && git add $file && git commit -m "Remove $file"
}

list() {
    file=$(start $@)
    $EDITOR "$file"
}

if [[ "$1" =~ ^(new|edit|remove)$ ]]; then
    command=$1
    shift
    $command $@
else
    list $@
fi


