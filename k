#!/usr/bin/env bash

set -eo pipefail
 
source $HOME/bin/colors || true

. ~/bin/with-aws-sso

if [ "$AWS_PROFILE" = "production" ]; then
    echo "${RED}═══ [$AWS_PROFILE] ═══${NC}"
else
    echo "${YELLOW}═══ [$AWS_PROFILE] ═══${NC}"
fi

if [[ -z "$@" ]]; then
    echo "pass"
elif [ "$1" = "shell" -o "$1" = "sh" ]; then
    shift
    k-shell "$@"
else
    kubectl "$@"
fi

