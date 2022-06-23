if command -v fzf > /dev/null; then
  export DOTFILES_FZF_DIRECTORY="$DOTFILES_DIRECTORY/fzf"

  # if the configuration directory exists:
  if [[ -d $DOTFILES_FZF_DIRECTORY ]]; then
    if [[ -f "${DOTFILES_FZF_DIRECTORY}/completion.bash" ]]; then
      source "${DOTFILES_FZF_DIRECTORY}/completion.bash"
    fi
    if [[ -f "${DOTFILES_FZF_DIRECTORY}/key-bindings.bash" ]]; then
      source "${DOTFILES_FZF_DIRECTORY}/key-bindings.bash"
    fi
  fi

  # If we have bat installed, use bat as default preview fzf
  if command -v bat >/dev/null; then
    export FZF_DEFAULT_OPTS="--preview='bat --style=changes,numbers -r 0:\$FZF_PREVIEW_LINES -f {+}'"
  fi
fi