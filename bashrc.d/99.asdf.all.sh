if command -v asdf >/dev/null; then
  ASDF_COMPLETION_FILE="$BREW_PREFIX/etc/bash_completion.d/asdf"
    
  if ! [[ -f "$ASDF_COMPLETION_FILE" ]]; then
      asdf completion bash > $ASDF_COMPLETION_FILE
  fi

  . "$ASDF_COMPLETION_FILE"

  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi
