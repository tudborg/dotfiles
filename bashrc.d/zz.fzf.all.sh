if command -v fzf > /dev/null; then
  FZF_PREFIX=/usr/local/opt/fzf
  # Auto-completion
  # ---------------
  if [[ -f "${FZF_PREFIX}/shell/completion.bash" ]]; then
    source "${FZF_PREFIX}/shell/completion.bash"
  fi

  # Key bindings
  # ------------
  if [[ -f "${FZF_PREFIX}/shell/key-bindings.bash" ]]; then
    source "${FZF_PREFIX}/shell/key-bindings.bash"
  fi

  # If we have bat installed, use bat as default preview fzf
  if command -v bat >/dev/null; then
    export FZF_DEFAULT_OPTS="--preview='bat --style=changes,numbers -r 0:\$FZF_PREVIEW_LINES -f {+}'"
  fi

fi