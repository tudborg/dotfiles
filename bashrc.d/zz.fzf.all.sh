if command -v fzf > /dev/null; then
  FZF_PREFIX=/usr/local/opt/fzf
  # Auto-completion
  # ---------------
  source "${FZF_PREFIX}/shell/completion.bash"

  # Key bindings
  # ------------
  source "${FZF_PREFIX}/shell/key-bindings.bash"

  # If we have bat installed, use bat as default preview fzf
  if command -v bat >/dev/null; then
    export FZF_DEFAULT_OPTS="--preview='bat --style=changes,numbers -r 0:\$FZF_PREVIEW_LINES -f {+}'"
  fi

fi