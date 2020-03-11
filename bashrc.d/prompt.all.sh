function __fix_stdout_nonblock_bug () {
    # some tool somewhere keeps messing up my stdout.
    # It's most likely a nodejs tool, at least I've seen nodejs do this multiple times,
    # however something somewhere in my pipeline does it incosistently but often
    # enough that it is so annoying that I want to make sure it doesn't happen.
    # Hence this hack.
    # This python snippet "fixes" the issue, unsetting NONBLOCK mode if it is already set.
    # Might be worth compiling a tiny C program to do it but this seems Good Enough for now.
    if command -v python >/dev/null; then
        python -c 'import os,sys,fcntl; flags = fcntl.fcntl(sys.stdout, fcntl.F_GETFL); fcntl.fcntl(sys.stdout, fcntl.F_SETFL, flags&~os.O_NONBLOCK);'
    else
        return 1
    fi
}

function __prompt_command () {
    local LASTEXIT="$?"

    # Fix a super annoying bug I keep seeing but can't figure out how to correct.
    # some nodejs tool somewhere leaves stdout in nonblock mode which messes up
    # other tools. So fix it ON EACH PROMPT!
    __fix_stdout_nonblock_bug

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
    local p="$BOLD$CYAN"  # primary color sequence
    local s="$DIM$CYAN"   # secondary color sequence
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
        local venv="$r$f(venv:$s${VIRTUAL_ENV##*/}$r$f)$r"
    else
        local venv=""
    fi

    if [[ "$AWS_PROFILE" != "" ]]; then
        local awsenv="$r$f(aws:$s${AWS_PROFILE}$r$f)$r"
    else
        local awsenv=""
    fi

    local gitline=''
    if type -t __git_ps1 > /dev/null; then
        gitline="\$(__git_ps1 \" $r$f[$s%s$r$f]\")"
    fi

    local k8sline=''
    if type -t kubectl > /dev/null; then
        k8sline=" $r$f[k8s=$s\$(kubectl config current-context)$f]"
    fi
    export PS1="${r}${f}╭─(\t) \u@\h $r$p\w$r${gitline}${k8sline}$r \n${f}╰─${status}$r${s}\$${venv}${awsenv}$r$s>$r "
    export PS2="${r}  ${status}${s}\$${venv}${awsenv}>${r} "
}

if ! type -t __git_ps1 > /dev/null; then
    if [[ -f /usr/share/git/git-prompt.sh ]]; then
        . /usr/share/git/git-prompt.sh
    elif [[ -f $HOME/.nix-profile/share/git/contrib/completion/git-prompt.sh ]]; then
        . $HOME/.nix-profile/share/git/contrib/completion/git-prompt.sh
    fi
fi

export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs
