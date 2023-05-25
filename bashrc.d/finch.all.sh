if command -v finch >/dev/null && [[ -d $BREW_PREFIX/etc/bash_completion.d ]]; then
    if ! [[ -f $BREW_PREFIX/etc/bash_completion.d/finch ]]; then
        echo "Writing finch bash completions" >&2
        finch completion bash > $BREW_PREFIX/etc/bash_completion.d/finch
    fi
fi
