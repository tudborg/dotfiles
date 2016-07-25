if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

if ! which -s realpath; then
    # hacky realpath shim
    realpath() {
        [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
    }
fi

if [[ -d ~/bin/ ]]; then
    export PATH="$(realpath ~/bin):$PATH"
fi
if [[ -d ~/.bin/ ]]; then
    export PATH="$(realpath ~/.bin):$PATH"
fi
if [[ -d ~/.local/bin/ ]]; then
    export PATH="$(realpath ~/.local/bin):$PATH"
fi