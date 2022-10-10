#!/usr/bin/env bash

set -e

tmp=$(mktemp)
rm "$tmp"

vim "$tmp"

if [ -f "$tmp" ]; then
    cat "$tmp" | pbcopy
    rm "$tmp"
fi
