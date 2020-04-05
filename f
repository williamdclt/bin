#!/usr/bin/env zsh
set -eo pipefail

source ~/dev/forgit/forgit.plugin.zsh

usage() { echo "Usage: forgit [add] [diff]" 1>&2; exit 1; }

FORGIT_ADD_FZF_OPTS="--bind 'ctrl-p:execute[echo {} | fzf --preview \"git diff \{}\"]'"

subcommand=$1
shift
case "${subcommand}" in
    add)
        forgit::add $@
        ;;
    log)
        forgit::log $@
        ;;
    diff)
        forgit::diff $@
        ;;
    reset)
        forgit::reset::head $@
        ;;
    checkout)
        forgit::checkout::restore $@
        ;;
    co)
        forgit::checkout::restore $@
        ;;
    *)
        usage
        ;;
esac
