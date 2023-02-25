# if we have rtx available, use that.
# otherwise asdf if we have it.
if command -v rtx >/dev/null; then
  # activate rtx
   eval "$(rtx activate bash)"
   # enable rtx completions
   eval "$(rtx complete -s bash)"
   # initial hook-env call (because PROMPT_COMMAND hasn't run yet)
   # this is necesary to enable later calls that check for globally available
   # tools like erlang, python etc.
   eval "$(rtx hook-env -s bash)"
elif [[ -d $HOME/.asdf ]]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi