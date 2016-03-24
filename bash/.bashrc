#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# source git-prompt
source /usr/share/git/completion/git-prompt.sh
color_LINS="\[$(tput setaf 2)\]"
color_BARS="\[$(tput setaf 2)\]"
color_ATSG="\[$(tput setaf 2)\]"
color_USER="\[$(tput setaf 7)\]"
color_HOST="\[$(tput setaf 7)\]"
color_BNCH="\[$(tput setaf 1)\]"
color_PROM="\[$(tput setaf 2)\]"
color_CDIR="\[$(tput setaf 7)\]"
color_NOCL="\[$(tput sgr0)\]"
export PS1="${color_LINS}┌─${color_BARS}[${color_USER}\u${color_ATSG}@${color_HOST}\h${color_BARS}]${color_LINS}──${color_BARS}[${color_CDIR}\w${color_BARS}]\n${color_LINS}└──${color_BNCH}\$(__git_ps1 '(%s)${color_LINS}──')${color_PROM}>>${color_NOCL} "

# use vim as manpager
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' - \""
