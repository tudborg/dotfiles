# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

source_bash_plugins () {
	local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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

	for file in $dir/bashrc.d/*.all.sh; do
	    [ -f "$file" ] && source "$file" 
	done
	for file in $dir/bashrc.d/*.$platform.sh; do
		[ -f "$file" ] && source "$file"
	done
	
}

source_bash_plugins
