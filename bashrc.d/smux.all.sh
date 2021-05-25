# ssh+tmux=smux
# ssh in to remote host and attach to existing session or create a new one.

if command -v ssh >/dev/null; then
  smux () {
    if [[ "$#" -eq 0 ]]; then
      echo -e "SSH to <destination> and attach to a tmux session.\nAny argument is passed to ssh.\n\nusage: smux <destination> [...ssh opts]" >&2
      return 1
    fi
    ssh -t ${@} -- "tmux new-session -ADs0"
  }
  _smux() 
  {
      local cur opts
      COMPREPLY=()
      cur="${COMP_WORDS[COMP_CWORD]}"
      opts=$(
        awk '/^host/ && $2 !~ /\*/ {print $2}' ~/.ssh/config &&
        awk '!/\[/{split($1, a, ",");for(i in a){print a[i]}}' ~/.ssh/known_hosts | sort -u
      )
      COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
      return 0
  }
  complete -F _smux smux
fi
