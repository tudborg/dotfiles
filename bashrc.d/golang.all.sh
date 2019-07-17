export GOPATH="$HOME/src/go"
if [[ -d "$GOPATH" ]]; then
  path_append "$GOPATH/bin"
fi
