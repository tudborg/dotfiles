if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi
if [[ -d /usr/local/opt/coreutils/libexec/gnubin ]]; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi
if [[ -d /usr/local/opt/coreutils/libexec/gnuman ]]; then
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi
