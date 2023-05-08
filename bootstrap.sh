#!/usr/bin/env bash
set -euo pipefail

##
## Brew packages to install
##
BREW_PACKAGES=()
# absolute barebones packages:
BREW_PACKAGES+=(bash git tmux)
# must-haves:
BREW_PACKAGES+=(htop)
# nice-to-haves:
BREW_PACKAGES+=(fzf exa bat)
# prompt:
BREW_PACKAGES+=(starship)

# utilities:
BREW_PACKAGES+=(bash-completion)
BREW_PACKAGES+=(sccache)
BREW_PACKAGES+=("ripgrep")

# need rtx later down in the bootstrap script, install via brew:
BREW_PACKAGES+=(jdxcode/tap/rtx)

##
## Bootstrap!
##

function log { echo "BOOTSTRAP - $(date -u +"%Y-%m-%dT%H:%M:%SZ"):: $@" >&2; }
function fail { log "$@"; exit 1; }

# install homebrew if not present
if ! [[ -d /opt/homebrew ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

command -v brew >/dev/null || fail "missing brew"

BREW_ALREADY_INSTALLED="$(brew list -1)"
for package in "${BREW_PACKAGES[@]}"; do
	# greedy front trim package, taking only anything after the last whitespace, then trim that taking only last after "/"
	package_no_flags="${package##*" "}"
	package_name="${package_no_flags##*"/"}"
	if echo "$BREW_ALREADY_INSTALLED" | grep -- "$package_name" >/dev/null; then
		log "brew already installed $package"
	else
		log "brew install $package"
		brew install --display-times $package
	fi
done
