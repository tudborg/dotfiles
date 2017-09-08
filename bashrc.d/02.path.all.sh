# various bin paths in $HOME
if [[ -d $HOME/bin/ ]]; then
    export PATH="$HOME/bin:$PATH"
fi
if [[ -d $HOME/.bin/ ]]; then
    export PATH="$HOME/.bin:$PATH"
fi
if [[ -d $HOME/.local/bin/ ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# add python's user base bin to path
if command -v python3 >/dev/null; then
    PATH="$PATH:$(python3 -c 'import site;print(site.USER_BASE)')/bin"
fi
if command -v python2 >/dev/null; then
    PATH="$PATH:$(python2 -c 'import site;print(site.USER_BASE)')/bin"
fi
