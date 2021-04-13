#!/usr/bin/env bash
main () {
  local context="$($HOME/bin/kubectl config current-context)"
  local style="fg=colour42,nobold"
  if [[ "$context" =~ "prod" ]]; then
    style="fg=red,bold"
  fi
  echo "#[${style}]⎈ ${context}#[fg=default]"
}
main