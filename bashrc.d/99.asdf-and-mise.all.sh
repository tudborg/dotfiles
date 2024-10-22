# if we have mise available, use that.
# otherwise asdf if we have it.
if command -v mise >/dev/null; then
  # activate mise
  eval "$(mise activate bash)"
  # enable mise completions
  eval "$(mise complete -s bash)"
  # initial hook-env call (because PROMPT_COMMAND hasn't run yet)
  # this is necesary to enable later calls that check for globally available
  # tools like erlang, python etc.
  eval "$(mise hook-env -s bash)"

  # usage is required for completions to work.
  # install it if it does not exist.
  # we can use mise to manage the installation.
  if ! command -v usage > /dev/null; then
    echo "installing mise/usage to enable completions for mise" >&2
    mise use -g usage
  fi

  alias asdf='(echo use mise instead >&2; exit 1;); #'
elif [[ -d $HOME/.asdf ]]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi
