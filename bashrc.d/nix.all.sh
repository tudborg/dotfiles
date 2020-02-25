if [[ -d $HOME/.nix-profile ]]; then
    source $HOME/.nix-profile/etc/profile.d/nix.sh

    export NIX_SEARCH_CACHE="$HOME/.cache/nix-search-cache"
    nix-search () {
      if ! [[ -e "$NIX_SEARCH_CACHE" ]] || [[ "$(stat -f %c "$NIX_SEARCH_CACHE")" -lt "$(( $(date +%s) - 86400 ))" ]]; then
        echo "updating nix-search cache" >&2
        nix-env -qaP '*' > "$NIX_SEARCH_CACHE"
      fi
      grep -i "$*" "$NIX_SEARCH_CACHE"
    }

fi

# will make bash-completion happy when installed via nix
export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

# bash completions from nix:
if [[ -f $HOME/.nix-profile/share/bash-completion/bash_completion ]]; then
    source $HOME/.nix-profile/share/bash-completion/bash_completion
fi

# git bash completions from git package
if [[ -f $HOME/.nix-profile/share/git/contrib/completion/git-completion.bash ]]; then
    source $HOME/.nix-profile/share/git/contrib/completion/git-completion.bash
fi
