#homebrew completions
if command -v brew > /dev/null; then
    BREW_PREFIX="$(brew --prefix)"
    # brew exists, check for bash completions
    if [[ -f "${BREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        # bash-completion@2
        . "${BREW_PREFIX}/etc/profile.d/bash_completion.sh"
    elif [[ -f "${BREW_PREFIX}/etc/bash_completion" ]]; then
        # bash-completion
        . "${BREW_PREFIX}/etc/bash_completion"
    fi
fi