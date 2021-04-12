if command -v erl >/dev/null || command -v iex >/dev/null; then
    export ERL_AFLAGS="-kernel shell_history enabled"
    ESCRIPTS_PATH="/Users/tbug/.mix/escripts"
    if [[ -d "$ESCRIPTS_PATH" ]]; then
      path_append "$ESCRIPTS_PATH"
    fi
fi
