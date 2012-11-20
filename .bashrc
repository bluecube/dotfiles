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

if [[ $(uname) -eq 'z400' ]] ;
	# I don't have admin rights on z400 and always connect remotely ...
	REMOTE_LOGIN=yes
fi


export HISTCONTROL=ignoredups:ignorespace

# I like terminal prompt in gentoo, mostly.

if [[ ${EUID} == 0 ]] ; then
	COLOR='\[\e[01;31m\]' # Green
else
	COLOR='\[\e[01;32m\]' # Red
fi

if [[ $REMOTE_LOGIN = yes ]] ; then 
	# The variable REMOTE_LOGIN is set in .ssh/environment, and
	# it needs to be enabled in sshd_config (PermitUserEnvironment)
	HOST_STYLE='\[\e[7m\]' # Inverse
fi

PS1='\[\e]2;\u@\h \w\a\]'$COLOR'\u@'$HOST_STYLE'\h\[\e[00m\e[01;34m\] \w \$ \[\e[00m\]'
