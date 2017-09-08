#homebrew completions
if command -v brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion ]; then
    # hack to load completions but show prompt faster
    function _load_brew_bash_completion {
        unset -f _load_brew_bash_completion
        . $(brew --prefix)/etc/bash_completion
    }
    trap '_load_brew_bash_completion; trap USR1' USR1
fi
