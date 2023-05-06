# https://starship.rs
if command -v starship >/dev/null; then
    DOTFILES_DISABLE_PROMPT_COMMAND=1
    eval "$(starship init bash)"
    eval "$(starship completions bash)"
fi
