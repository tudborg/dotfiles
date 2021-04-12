export GOPATH="$HOME/src/go"
if [[ -d "$GOPATH/bin" ]]; then
  path_append "$GOPATH/bin"
fi
