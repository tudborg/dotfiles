if command -v fzf > /dev/null; then
  FZF_PREFIX=/usr/local/opt/fzf
  # Auto-completion
  # ---------------
  source "${FZF_PREFIX}/shell/completion.bash"

  # Key bindings
  # ------------
  source "${FZF_PREFIX}/shell/key-bindings.bash"
fi