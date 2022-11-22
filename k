#!/usr/bin/env bash

set -eo pipefail
 
source $HOME/bin/colors || true

. ~/bin/with-aws-sso

echo "${YELLOW}═══ [$AWS_PROFILE] ═══${NC}"
kubectl "$@"

