if [[ -d $HOME/.nix-profile ]]; then
    source $HOME/.nix-profile/etc/profile.d/nix.sh

    export NIX_SEARCH_CACHE="$HOME/.cache/nix-search-cache"
    nix-search () {
      if ! [[ -e "$NIX_SEARCH_CACHE" ]]; then
        echo "nix-search cache is empty, populating..." >&2
        nix-search --update
      fi
      while (( "$#" )); do
        case "$1" in
          -h|--help)
            echo "nix-search - cache and search in nix package names." >&2
            echo "  search is done with 'grep -i'" >&2
            echo "usage:" >&2
            echo "  nix-search (-u|--update)  updates the nix-search cache" >&2
            echo "  nix-search <grep args>    searches the nix-search cache" >&2
            return 1
            ;;
          -u|--update)
            echo "nix-search updating cache..." >&2
            nix-env -qaP '*' > "$NIX_SEARCH_CACHE"
            local ret=$?
            echo "packages available for searching: $(cat "$NIX_SEARCH_CACHE" | wc -l)" >&2
            return $ret
            ;;
          --) # end argument parsing
            shift
            break
            ;;
          -*|--*=) # unsupported flags
            echo "Error: Unsupported flag $1" >&2
            return 1
            ;;
          *) # preserve positional arguments
            local params="$params $1"
            shift
            ;;
        esac
      done
      if [[ "$(stat -f %c "$NIX_SEARCH_CACHE")" -lt "$(( $(date +%s) - 86400 ))" ]]; then
        echo "nix-search cache needs updating, run nix-search -u" >&2
      fi
      grep -i "$params" "$NIX_SEARCH_CACHE"
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
