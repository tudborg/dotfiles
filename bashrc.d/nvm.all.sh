if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    # this is probably not the right way
    # to source this. Should probably be
    # located in some way, before sourced.
    # oh well. Let ubuntu-me figure it out.
    source "/usr/local/opt/nvm/nvm.sh"
fi
