if [[ -d /opt/homebrew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if command -v brew > /dev/null; then
    BREW_PREFIX="$(brew --prefix)"
fi