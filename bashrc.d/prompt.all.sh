# PS1 comming up:
#a wrapper function to keep colors from polluting global space
function __prompt_command () {
    local EXIT="$?"
    PS1=""
 
    local R="\[\033[0m\]" #reset
    local B="\[\033[1m\]" #bold
    local D="\[\033[2m\]" #dim
    local U="\[\033[4m\]" #underline
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
 
    if [ $EXIT != 0 ]; then
        local status="${R}${GREY}(${RED}${EXIT}${R}${GREY})${R} "      # Add red if exit code non 0
    else
        local status=""
    fi

    if [[ "$VIRTUAL_ENV" != "" ]]; then
        local venv=" ${R}${GREY}(${GREEN}${VIRTUAL_ENV##*/}${R}${GREY})${R}"
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
        gitline="\$(__git_ps1 \"${GREY}(${DEFAULT}${D}%s${GREY})\")"
    fi

    #make that damn PS1
    #split in lines to easy readability
    export PS1="${R}${GREY}[\t] ${BLUE}\w ${gitline}\n${status}${BLUE}\$${venv}${BLUE}>${R} "
    export PS2="${R}${BLUE}||${R} "


}
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs