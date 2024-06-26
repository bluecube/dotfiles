# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# If this is top level shell, over ssh and not in tmux, start a new tmux session
# In this case the rest of the bashrc is unimportant, because tmux will run new bash with new bashrc inside.
if [ "$SHLVL" = 1 -a -n "$SSH_CONNECTION" -a -z "$TMUX" ] ; then
    if hash tmux 2>/dev/null ; then
        exec tmux new-session -s "$USER" -A
    fi
fi

export HISTCONTROL=ignoredups:ignorespace

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# I like terminal prompt in gentoo, mostly.

function __git_ps1
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -z "$b" ]; then return ; fi

    printf " (%s)" "${b##refs/heads/}";
}

if [[ ${EUID} == 0 ]] ; then
    USER_COLOR='\[\e[01;31m\]' # Green
else
    USER_COLOR='\[\e[01;32m\]' # Red
fi

if [[ -n "$SSH_CONNECTION" ]] ; then
    HOST_STYLE='\[\e[7m\]' # Inverse
fi

MAIN_COLOR='\e[01;34m\]'

PS1='\[\e]2;\u@\h \w$(__git_ps1)\a\]'$USER_COLOR'\u@'$HOST_STYLE'\h\[\e[00m'$MAIN_COLOR' \w$(__git_ps1) \$ \[\e[00m\]'

alias ls='ls --color=auto'
eval "$(zoxide init bash)"

function b {
    status=$?
    echo -en '\a'
    return $status
}

function tmux_env {
    eval "$(tmux show-env "$1")"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
