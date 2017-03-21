if ! which realpath >/dev/null; then
    # hacky realpath shim
    realpath() {
        [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
    }
fi
# Add cargo bin to path
if [[ -d ~/.cargo/bin ]]; then
    export PATH="$(realpath ~/.cargo/bin):$PATH"
fi
