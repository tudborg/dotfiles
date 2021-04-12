if ! command -v asdf >/dev/null; then
  # when asdf is installed don't do this ruby stuff because asdf will
  # most likely be managing this.

  if command -v ruby >/dev/null && command -v gem >/dev/null; then
      if [[ -f /tmp/ruby_gem_home ]]; then
          export GEM_HOME="$(cat /tmp/ruby_gem_home)"
      else
          # move GEM_HOME into home dir. Global install is messy.
          export GEM_HOME="$(ruby -r rubygems -e 'puts Gem.user_dir')"
          echo "$GEM_HOME" > /tmp/ruby_gem_home
      fi
      # prepend, because osx has some native ruby stuff that we cant really touch
      path_prepend "$GEM_HOME/bin"
  fi

fi