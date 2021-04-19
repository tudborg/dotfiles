
# care about nvm, only if .nvm folder exists
if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    nvm () {
    echo 'lazy loading nvm...' >&2
        unset -f nvm
        # this works on my arch machines with the nvm package installed
        if [[ -f "/usr/share/nvm/init-nvm.sh" ]]; then
            source /usr/share/nvm/init-nvm.sh
        # this works on my mac with nvm installed through brew
        elif [[ -f "/usr/local/opt/nvm/nvm.sh" ]]; then
            source "/usr/local/opt/nvm/nvm.sh"
    else
        echo "nvm doesn't seen to be present." >&2
        return 1
        fi
        nvm "$@"
    }
fi
