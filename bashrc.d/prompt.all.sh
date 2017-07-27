# PS1 comming up:
#a wrapper function to keep colors from polluting global space
function __prompt_command () {
    local LASTEXIT="$?"
    PS1=""
 
    local RESET="\[\033[0m\]" #reset
    local BOLD="\[\033[1m\]" #bold
    local DIM="\[\033[2m\]" #dim
    local UNDERLINE="\[\033[4m\]" #underline

    local DEFAULT="\[\033[39m\]"
    local RED="\[\033[91m\]"
    local GREEN="\[\033[32m\]"
    local YELLOW="\[\033[93m\]"
    local BLUE="\[\033[34m\]"
    local MAGENTA="\[\033[95m\]"
    local CYAN="\[\033[96m\]"
    local WHITE="\[\033[97m\]"
    local GREY="\[\033[90m\]"
    # * == unstages
    # + == staged changes
    export GIT_PS1_SHOWDIRTYSTATE="1"
    # $ next to branch named if stashed state
    export GIT_PS1_SHOWSTASHSTATE="1"
    # % next to branch name of untracked files
    export GIT_PS1_SHOWUNTRACKEDFILES="1"
    # will show state compared to upstream
    # < you are behind upstream
    # > you are ahead of upstream
    # <> you have diverged from upstream
    # = matches upstream
    export GIT_PS1_SHOWUPSTREAM="auto"


    local r="$RESET"       # reset sequence
    local p="$BOLD$GREEN"  # primary color sequence
    local s="$DIM$GREEN"   # secondary color sequence
    local f="$GREY"        # framing color (usually grey)
    local e="$RED"         # error sequence

    # exit status in dimmed parens and error color number
    if [ $LASTEXIT != 0 ]; then
        local status="$r$f($r$e${LASTEXIT}$r$f)$r "
    else
        local status="$r$f(0)$r "
    fi

    # virtualenv support
    if [[ "$VIRTUAL_ENV" != "" ]]; then
        local venv=" $r$f($s${VIRTUAL_ENV##*/}$r$f)$r"
    else
        local venv=""
    fi

    case "$TERM" in
    xterm*|rxvt*)
        # color
        ;;
    *)
        # no color
        ;;
    esac

    local gitline=''
    if type -t __git_ps1 > /dev/null; then
        gitline="\$(__git_ps1 \" $r$f($s%s$r$f)\")"
    fi

    export PS1="$r$f[\t] \u@\h $r$p\w$r${gitline}$r\n${status}$r$s\$${venv}$r$s>$r "
    export PS2="$r$s |${r} "


}
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs