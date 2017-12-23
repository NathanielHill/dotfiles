# ~/.bashrc: executed by bash(1) for non-login shells.
export TERM=xterm-256color

alias ps="ps -ax"
alias ls="ls -hal --color"
alias df="df -h"
alias du="du -h"

source ~/.bash_profile


# added by Anaconda3 4.1.1 installer
export PATH="/home/nhill/Anaconda3/bin:$PATH"
cat /dev/null > ~/.bash_history && history -c && exit
