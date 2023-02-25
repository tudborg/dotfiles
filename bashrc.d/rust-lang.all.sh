if command -v sccache >/dev/null; then
    # if sccache is available, set it as the RUSTC_WRAPPER
    # so that we can cache compile artifacts.
    export RUSTC_WRAPPER=sccache
fi
