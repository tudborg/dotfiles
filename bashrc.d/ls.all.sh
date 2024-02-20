if command -v ls >/dev/null; then
    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
    fi

    if command -v eza >/dev/null; then
        alias l='eza'
    else
        alias l='ls -alFG'
    fi
fi
