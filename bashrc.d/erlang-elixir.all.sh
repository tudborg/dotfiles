if command -v erl >/dev/null || command -v iex >/dev/null; then
    export ERL_AFLAGS="-kernel shell_history enabled"
    path_append "/Users/tbug/.mix/escripts"
fi
