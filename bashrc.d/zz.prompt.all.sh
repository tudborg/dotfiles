if [[ -z "$DOTFILES_DISABLE_PROMPT_COMMAND" ]]; then

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
    # __fix_stdout_nonblock_bug
    # Turns out this was too expensive for my liking, so I'm commenting it out.
    # I can always call __fix_stdout_nonblock_bug if I need it.

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
    # You can further control
    # behaviour by setting GIT_PS1_SHOWUPSTREAM to a space-separated list
    # of values:
    #
    #     verbose       show number of commits ahead/behind (+/-) upstream
    #     name          if verbose, then also show the upstream abbrev name
    #     legacy        don't use the '--count' option available in recent
    #                   versions of git-rev-list
    #     git           always compare HEAD to @{upstream}
    #     svn           always compare HEAD to your SVN upstream


    local r="$RESET"       # reset sequence
    local p="$MAGENTA"  # primary color sequence
    local s="$GREY"   # secondary color sequence
    local f="$GREY"        # framing color (usually grey)
    local e="$RED"         # error sequence

    # exit status in dimmed parens and error color number
    if [ $LASTEXIT != 0 ]; then
        local status="$r$f($r$e${LASTEXIT}$r$f)$r "
    else
        local status=""
    fi

    local versionline=''
    local mise_exclude="usage"
    local versions
    versions="$(mise current | grep -vE "$mise_exclude")"
    if [[ $? -eq 0 ]]; then
        versionline="${r}${s}[versions: ${versions//$'\n'/, }]"
    fi

    local gitline=''
    if type -t __git_ps1 > /dev/null; then
        gitline="\$(__git_ps1 \" ${r}${f}[${s}%.50s${r}${f}]\")"
    fi

    if [[ -z "$COLUMNS" || "$COLUMNS" -ge 110 ]]; then
        export PS1="${r}${p}\w${r}${gitline}${versionline}\n${f}${status}${r}${s}\$${r}${s}>${r} "
        export PS2="${r}  ${status}${s}\$>${r} "
    else
        # special case, terminal is less than 100 columns wide:
        export PS1="${r}${f}╭─ ${r}${p}\w${r}${f}\n├ ${gitline}${r}${f}\n╰─${status}${r}${s}\$${r}${s}>${r} "
        export PS2="${r}  ${status}${s}\$>${r} "
    fi
}

if ! [[ "${PROMPT_COMMAND:-}" =~ __prompt_command ]]; then
  PROMPT_COMMAND="__prompt_command${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi

fi
