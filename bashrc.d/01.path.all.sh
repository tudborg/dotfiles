if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

if [[ -d ~/bin/ ]]; then
    export PATH="$HOME/bin:$PATH"
fi
if [[ -d ~/.bin/ ]]; then
    export PATH="$HOME/.bin:$PATH"
fi
if [[ -d ~/.local/bin/ ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
if [[ -d ~/.cargo/bin/ ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
