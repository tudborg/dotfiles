# PS1 comming up:
#a wrapper function to keep colors from polluting global space
function __prompt_command () {
    local LASTEXIT="$?"
    PS1=""
 
    local RESET="\[\033[0m\]" #reset
    local BOLD="\[\033[1m\]" #bold
    local DIM="\[\033[2m\]" #dim
    local UNDERLINE="\[\033[4m\]" #underline
    #took the colors _i_ think are nice and defined as vars
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


    local r="$RESET"  # reset sequence
    local p="$GREEN"  # primary color sequence
    local d="$GREY"   # dim sequence

    local i="$DIM$WHITE"   # info sequence
    local e="$RED"    # error sequence

    # exit status in dimmed parens and error color number
    if [ $LASTEXIT != 0 ]; then
        local status="${r}${d}(${e}${LASTEXIT}${r}${d})${r} "
    else
        local status=""
    fi

    # virtualenv support
    if [[ "$VIRTUAL_ENV" != "" ]]; then
        local venv=" ${r}${d}(${p}${VIRTUAL_ENV##*/}${r}${d})${r}"
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
        gitline="\$(__git_ps1 \"${d}(${i}%s${r}${d})\")"
    fi

    export PS1="${r}${d}[\t] \u@\h ${p}\w ${gitline}\n${status}${p}\$${venv}${p}>${r} "
    export PS2="${r}${p} |${r} "


}
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs