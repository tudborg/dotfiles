if command -v ruby >/dev/null && command -v gem >/dev/null; then
    # move GEM_HOME into home dir. Global install is messy.
    export GEM_HOME="$(ruby -r rubygems -e 'puts Gem.user_dir')"
    # prepend, because osx has some native ruby stuff that we cant really touch
    path_prepend "$GEM_HOME/bin"
fi
