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

# add python's user base bin to path
if command -v python3 >/dev/null; then
    path_append "$(python3 -c 'import site;print(site.USER_BASE)')/bin"
fi
if command -v python2 >/dev/null; then
    path_append "$(python2 -c 'import site;print(site.USER_BASE)')/bin"
fi
