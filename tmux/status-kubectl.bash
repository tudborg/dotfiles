#!/usr/bin/env bash
main () {
  local KUBECTL=/opt/homebrew/bin/kubectl
  if command -v "$KUBECTL" > /dev/null; then
    local current="$($KUBECTL config view --minify -o jsonpath='{.current-context} ns={..namespace}')"
    local style="fg=colour42,nobold"
    if [[ "$current" =~ "prod" ]]; then
      current="${current} ⚠ "
      style="fg=red,bold"
    fi
    echo "#[${style}]⎈ ${current}#[fg=default]"
  else
    echo ""
  fi
}
main
