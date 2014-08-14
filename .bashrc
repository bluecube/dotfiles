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

export HISTCONTROL=ignoredups:ignorespace

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

if [[ $REMOTE_LOGIN = yes ]] ; then
	# The variable REMOTE_LOGIN is set in .ssh/environment, and
	# it needs to be enabled in sshd_config (PermitUserEnvironment)
	HOST_STYLE='\[\e[7m\]' # Inverse
fi

MAIN_COLOR='\e[01;34m\]'

PS1='\[\e]2;\u@\h \w$(__git_ps1)\a\]'$USER_COLOR'\u@'$HOST_STYLE'\h\[\e[00m'$MAIN_COLOR' \w$(__git_ps1) \$ \[\e[00m\]'

alias ls='ls --color=auto'
