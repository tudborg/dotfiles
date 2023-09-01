if [[ -d "$HOME/.cargo/bin" ]]; then
   path_prepend "$HOME/.cargo/bin"
fi

if command -v sccache >/dev/null; then
    # if sccache is available, set it as the RUSTC_WRAPPER
    # so that we can cache compile artifacts.
    export RUSTC_WRAPPER=sccache
fi

if command -v rustup >/dev/null; then
    RUSTUP_COMPLETION_FILE="$BREW_PREFIX/etc/bash_completion.d/rustup"
    CARGO_COMPLETION_FILE="$BREW_PREFIX/etc/bash_completion.d/cargo"
    
    if ! [[ -f "$RUSTUP_COMPLETION_FILE" ]]; then
        rustup completions bash rustup > $RUSTUP_COMPLETION_FILE
    fi
    if ! [[ -f "$CARGO_COMPLETION_FILE" ]]; then
        rustup completions bash cargo > $CARGO_COMPLETION_FILE
    fi
fi