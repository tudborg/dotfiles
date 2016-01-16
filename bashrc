# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
platform='unknown'
unamestr="$(uname)"
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
else
    platform="${unamestr,,}"
fi

for file in $dir/bashrc.d/*.all.sh; do
    source "$file" 
done
for file in $dir/bashrc.d/*.$platform.sh; do
    source "$file"
done