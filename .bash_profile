# ~/.bash_profile: executed by bash(1) for login shells.

if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
	source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi

# export LC_ALL="C" breaks gnome-terminal among others
alias ls="LC_COLLATE=C ls -hal --color"
alias ping="ping -nO"

umask 002
PS1='[\h]$ '

alias ps="ps -ax"
# alias ls="ls -hal --color"
alias df="df -h"
alias du="du -ah"

export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH="$HOME/.local/lib"

alias tmux="tmux -u -2"

function golive() {
clear
git add .
git commit -a -m "$1"
git push origin master
}

# get current branch in git repo
function parse_git_branch() {
BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
if [ ! "${BRANCH}" == "" ]
then
	STAT=`parse_git_dirty`
	echo "[${BRANCH}${STAT}]"
else
	echo ""
fi
}

# get current status of git repo
function parse_git_dirty {
status=`git status 2>&1 | tee`
dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
bits=''
if [ "${renamed}" == "0" ]; then
	bits=">${bits}"
fi
if [ "${ahead}" == "0" ]; then
	bits="*${bits}"
fi
if [ "${newfile}" == "0" ]; then
	bits="+${bits}"
fi
if [ "${untracked}" == "0" ]; then
	bits="?${bits}"
fi
if [ "${deleted}" == "0" ]; then
	bits="x${bits}"
fi
if [ "${dirty}" == "0" ]; then
	bits="!${bits}"
fi
if [ ! "${bits}" == "" ]; then
	echo " ${bits}"
else
	echo ""
fi
}

export PS1="\u@\h:\W\`parse_git_branch\` "

