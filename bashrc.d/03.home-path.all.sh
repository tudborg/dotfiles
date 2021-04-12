# home dir paths
if [[ -d $HOME/bin/ ]]; then
    path_prepend "$HOME/bin"
fi
if [[ -d $HOME/.bin/ ]]; then
    path_prepend "$HOME/.bin"
fi
if [[ -d $HOME/.local/bin/ ]]; then
    path_prepend "$HOME/.local/bin"
fi