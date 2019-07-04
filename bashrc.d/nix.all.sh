if [[ -d $HOME/.nix-profile ]]; then
    source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# will make bash-completion happy when installed via nix
export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

# bash completions from nix:
if [[ -d $HOME/.nix-profile/share/bash-completion ]]; then
    source $HOME/.nix-profile/share/bash-completion/bash_completion
fi

# git bash completions from git package
if [[ -d $HOME/.nix-profile/share/git/contrib/completion ]]; then
    source $HOME/.nix-profile/share/git/contrib/completion/git-completion.bash
fi
