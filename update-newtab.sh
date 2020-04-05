#!/usr/bin/env bash

set -exo pipefail

tmp_dir=$(mktemp -d)
# The HTML for the new tab page
newtab_src=/Users/william/Downloads/Page\ d\'accueil\ -\ start.me.html

# The path to Firefox's built-in new tab page within omni.ja
# To find it: unzip omni.ja then grep on 'id="root"'
newtab_dest="chrome/browser/res/activity-stream/prerendered/activity-stream.html"

# Where to find the omni.ja
# To find it: grep on some HTML of the buitin newtab page
omni_filename="omni.ja"
omni_dir="/Applications/Firefox.app/Contents/Resources/browser"

cd "$omni_dir"
# Unzip the buitin newtab file to update
unzip "$omni_filename" "$newtab_dest" -d "$tmp_dir" || true
cd "$tmp_dir"
# Replace the builtin newtab with our own
cp "$newtab_src" "$newtab_dest"
# Re-zip the newtab page
zip --update "$omni_dir/$omni_filename" "$newtab_dest"
rm -r "$tmp_dir"

