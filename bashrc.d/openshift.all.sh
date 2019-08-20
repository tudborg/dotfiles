if command -v oc >/dev/null; then
  # lazy-load completions for oc
  __fake_oc_completer () {
    complete -r oc
    unset -f __fake_oc_completer
    source <(oc completion bash)
    __start_oc "$@"
  }
  complete -F __fake_oc_completer oc
fi
