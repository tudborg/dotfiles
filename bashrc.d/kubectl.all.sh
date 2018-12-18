if command -v kubectl >/dev/null; then
    complete -o default -F __start_kubectl k
    function k {
        local BLUE='\033[0;34m'
        local BOLD="\033[1m"
        local CLEAR='\033[0m'
        local context="$(awk '/^current-context:/{print $2}' ~/.kube/config)"
        printf "${BLUE}${BOLD}$context${CLEAR}\n" >&2
        kubectl "$@"
    }
fi
