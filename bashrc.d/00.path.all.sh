# various bin paths in $HOME
path_prepend () {
    if ! [[ "$PATH" = *"$1"* ]]; then
        export PATH="$1:$PATH"
    fi
    return 0
}
path_append () {
    if ! [[ "$PATH" = *"$1"* ]]; then
        export PATH="$PATH:$1"
    fi
    return 0
}

