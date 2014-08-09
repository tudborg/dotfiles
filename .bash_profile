

#dynamically connect to an edge.etilbudsavis.dk node and call the indexer tool
function apitools {
    local addr="$(curl -s edge.etilbudsavis.dk | awk '/    Internal ip   :/{print $4}')"
    etassh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "${addr}" "cd /var/app/current/tools; $@"
}
function cheesetool {
    apitools ./index "$@"
}


 
#ls power-user!
alias ls='ls -G'
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'


#fake slow network
alias slowNetwork='sudo ipfw pipe 1 config bw 350kbit/s plr 0.05 delay 500ms && sudo ipfw add pipe 1 dst-port http'
alias flushNetwork='sudo ipfw flush'


export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

alias sublwait="subl -w"
export EDITOR="sublwait"


#export docker host addr
export DOCKER_HOST=tcp://localdocker:4243

#git completion if available
GIT_COMPLETION_FILE="/usr/local/Cellar/git/2.0.4/etc/bash_completion.d/git-completion.bash"
GIT_PROMPT_FILE="/usr/local/Cellar/git/2.0.4/etc/bash_completion.d/git-prompt.sh"
[ -f "$GIT_COMPLETION_FILE" ] && source "$GIT_COMPLETION_FILE"
[ -f "$GIT_PROMPT_FILE" ] && source "$GIT_PROMPT_FILE"

#aws completion
complete -C aws_completer aws

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
        local STATUS="${R}${GREY}(${RED}${EXIT}${R}${GREY})${R} "      # Add red if exit code non 0
    else
        local STATUS=""
    fi
 
    #make that damn PS1
    #split in lines to easy readability
    export PS1="${debian_chroot:+($debian_chroot)}\
${R}${GREY}[\t] ${BLUE}\w \
\$(__git_ps1 \"${GREY}(${DEFAULT}%s${GREY})\")\n${STATUS}${BLUE}\$>${R} "
    export PS2="${R}${BLUE}||${R} "
}
 
 
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs

if [ -f ~/.secret_profile ]; then
    source ~/.secret_profile
fi






