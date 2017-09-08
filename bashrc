# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

source_bash_plugins () {
    local _source="${BASH_SOURCE[0]}"
    while [ -h "$_source" ]; do
        local dir="$( cd -P "$( dirname "$_source" )" && pwd )"
        _source="$(readlink "$_source")"
        [[ $_source != /* ]] && _source="$dir/$_source"
    done
    dir="$( cd -P "$( dirname "$_source" )" && pwd )"

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

    for file in $(printf '%s\n' $dir/bashrc.d/*.{all,$platform}.sh|sort); do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
}

source_bash_plugins
