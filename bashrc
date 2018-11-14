#!/bin/sh

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s cdspell
shopt -s nocaseglob
shopt -s nocasematch


# COLORS
BLACK="\[\033[0;30m\]"
BBLACK="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
BRED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
BGREEN="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
BYELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BBLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
BPURPLE="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
BCYAN="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
BWHITE="\[\033[1;37m\]"


# FUNCTION DEFS
function cleanpyc { find ${@:-'.'} -name '*.pyc' -exec rm -f {} \;;}
function cleanstore { find ${@:-'.'} -name '.DS_Store' -exec rm -rf {} \;;}
function findpy() { find ${@:-'.'} -name '*.py' ;}
function findpyc() { find ${@:-'.'} -name '*.pyc' ;}
function grepy() { grep -Rn $1 * ;}
function sshadd() { ssh-add -t 7200 ~/.ssh/id_rsa;}


# ALIASES
alias c='clear'
alias cleanall='cleanpyc;cleanstore'
alias h='history'
alias hg='history | grep'
alias ht='history | tail -20'
alias ls='gls -FGa --color'
alias ll='gls -l --color'
alias la='gls -a --color'
alias lc='c; ll'
alias lca='c; ll -a'
alias mv="mv -v"
alias qdu="sudo du -sh * | pyp"
alias vic='vi ~/.profile; source ~/.profile'

# GPG
alias gpgrestart="gpg-agent --daemon"


# COMPLETE
complete -A user -X "_*" mail
complete -A export printenv
complete -A export env
complete -A command which
complete -A command alias


# SET UP COLOR PROMPT
export PS1="${RED}\T ${BRED}\u${RED}@\h:${GREEN}\w ${YELLOW}$ "


# http://signal0.com/2012/07/19/keeping_bash_history_forever.html
HISTIGNORE="hnote*:jrnl *:gpg *:pass *"
# Used to put notes in a history file
function hnote {
    echo "## NOTE [`date`]: $*" >> $HOME/.history/bash_history-`date +%Y%m%d`
}

# used to keep my history forever
PROMPT_COMMAND="[ -d $HOME/.history ] || mkdir -p $HOME/.history; echo : [\$(date)] $$ $USER \$OLDPWD\; \$(history 1 | sed -E 's/^[[:space:]]+[0-9]*[[:space:]]+//g') >> $HOME/.history/bash_history-\`date +%Y%m%d\`"
