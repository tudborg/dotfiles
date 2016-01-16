if [[ -d ~/bin/ ]]; then
    export PATH="$(realpath ~/bin):$PATH"
fi
if [[ -d ~/.bin/ ]]; then
    export PATH="$(realpath ~/.bin):$PATH"
fi
if [[ -d ~/.local/bin/ ]]; then
    export PATH="$(realpath ~/.local/bin):$PATH"
fi