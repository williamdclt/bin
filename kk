#!/usr/bin/env bash

set -eo pipefail

source $HOME/bin/colors || true

[ -z "$AWS_PROFILE" ] && echo "${RED}No environment set${NC}" && exit 1

env=$(echo $AWS_PROFILE | sed 's/birdie-//')

prompt="$env> "
fzf_cmd="fzf --preview-window hidden --height 50 --prompt $prompt"

pick_namespace() {
    kubectl get namespaces \
        -o custom-columns=NAME:.metadata.name \
        | tail -n +2 \
        | $fzf_cmd
}

pick_pod() {
    namespace="$1"
    kubectl get pods -n "$namespace" \
        | tail -n +2 \
        | $fzf_cmd -n 1 \
            --preview "kubectl describe pod \$(echo {} | ~/bin/col 1) -n $namespace" \
        | ~/bin/col 1
}

namespace=$(pick_namespace)
pod=$(pick_pod "$namespace")

kubectl exec -it "$pod" -n "$namespace" -- sh

