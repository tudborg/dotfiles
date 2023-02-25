if command -v nvim >/dev/null; then
    alias vim=nvim
fi
if command -v pgcli >/dev/null; then
    alias pg=pgcli
fi
if command -v bat >/dev/null; then
    alias cat="bat"
fi

alias v=vim
alias week="date +%GW%V" # 2020W42, same week number as ugenr.dk
alias cal="cal -Nw3sDK"