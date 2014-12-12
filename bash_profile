


function edge_addr {
    local addr="$(curl -s edge.etilbudsavis.dk | awk '/    Internal ip   :/{print $4}')"
    echo $addr
}
#dynamically connect to an edge.etilbudsavis.dk node and call the indexer tool
function apitools {
    local addr=$(edge_addr)
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



#editor is sublime with wait flag
export EDITOR="vim"

#Throw awesome stuff on path
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

#export docker host addr
export DOCKER_HOST=tcp://localdocker:4243

#git completion if available
GIT_COMPLETION_FILE="/usr/local/Cellar/git/2.0.4/etc/bash_completion.d/git-completion.bash"
GIT_PROMPT_FILE="/usr/local/Cellar/git/2.0.4/etc/bash_completion.d/git-prompt.sh"
[ -f "$GIT_COMPLETION_FILE" ] && source "$GIT_COMPLETION_FILE"
[ -f "$GIT_PROMPT_FILE" ] && source "$GIT_PROMPT_FILE"

#aws completion
complete -C aws_completer aws

source ~/src/dotfiles/prompt.sh
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs

if [ -f ~/.secret_profile ]; then
    source ~/.secret_profile
fi






