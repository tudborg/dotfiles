if command -v subl >/dev/null; then
    export EDITOR="subl --wait"
elif command -v vim >/dev/null; then
    export EDITOR="vim"
fi
