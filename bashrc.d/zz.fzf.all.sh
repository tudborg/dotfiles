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

  ## If we have bat installed, use bat as default preview fzf
  # if command -v bat >/dev/null; then
  #   export FZF_DEFAULT_OPTS="--preview='bat --style=changes,numbers -r 0:\$FZF_PREVIEW_LINES -f {+}'"
  # fi

  export FZF_CTRL_T_OPTS="
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

  export FZF_CTRL_R_OPTS="
    --preview 'echo {}' --preview-window up:3:hidden:wrap
    --bind 'ctrl-/:toggle-preview'
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --color header:italic
    --header 'Press CTRL-Y to copy command into clipboard'"

  if command -v eza > /dev/null; then
    export FZF_ALT_C_OPTS="--preview 'eza --tree -- {}'"
  elif command -v tree > /dev/null; then
    export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
  fi
fi