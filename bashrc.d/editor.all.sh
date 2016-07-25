if which subl >/dev/null; then
    export EDITOR="subl --wait"
elif which vim >/dev/null; then
    export EDITOR="vim"
fi
