if command -v kubectl >/dev/null; then
    function k {
        local BLUE='\033[0;34m'
        local BOLD="\033[1m"
        local CLEAR='\033[0m'
        local context="$(awk '/^current-context:/{print $2}' $HOME/.kube/config)"
        printf "${BLUE}${BOLD}$context${CLEAR}\n" >&2
        kubectl "$@"
    }
    if [[ -d $HOME/.kube ]] && [[ ! -f $HOME/.kube/completion.bash.inc ]]; then
        kubectl completion bash > $HOME/.kube/completion.bash.inc
    fi
    # if the kubectl completion is not loaded, load it:
    if ! command -v __start_kubectl >/dev/null; then
        source $HOME/.kube/completion.bash.inc
    fi
    if command -v __start_kubectl >/dev/null; then
        complete -o default -F __start_kubectl k
    fi
    if command -v kubectx >/dev/null; then
        alias kx="kubectx"
        _kx_contexts () {
            local curr_arg;
            curr_arg=${COMP_WORDS[COMP_CWORD]};
            COMPREPLY=($(compgen -W "- $(kubectl config get-contexts --output='name')" -- $curr_arg ))
        }
        complete -o default -F _kx_contexts kx
    fi
fi
