# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

dotfiles_directory () {
    local _source="${BASH_SOURCE[0]}"
    while [ -h "$_source" ]; do
        local dir="$( cd -P "$( dirname "$_source" )" && pwd )"
        _source="$(readlink "$_source")"
        [[ $_source != /* ]] && _source="$dir/$_source"
    done
    echo "$( cd -P "$( dirname "$_source" )" && pwd )"
}

dotfiles_platform () {
    local platform='unknown'
    local unamestr="$(uname)"
    local file
    if [[ "$unamestr" == 'Linux' ]]; then
        platform='linux'
    elif [[ "$unamestr" == 'FreeBSD' ]]; then
        platform='freebsd'
    else
        platform="${unamestr,,}"
    fi
    echo "$platform"
}

dotfiles_match () {
    for file in $(dotfiles_directory)/bashrc.d/*.{all,$(dotfiles_platform)}.sh; do
        if [[ -f "$file" && "$file" == *$1* ]]; then
            echo "$file"
        fi
    done | sort
}

dotfiles_source () {
    for file in $(dotfiles_match "$1"); do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
}

dotfiles_source
