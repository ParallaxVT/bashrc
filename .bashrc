#!/bin/bash

# ========================================
# General
# ========================================

# Don't wait for job termination notification
set -o notify
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredup
# Enable bash completion
if [ "$PS1" -a -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# ========================================
# Custom Shell
# ========================================

# Green 113
# Red 173
# Blue 81
# Yellow 186
# Light Green 194
# Light Blue 195

function EXT_COLOR () { echo -ne "\e[38;5;$1m"; }

function CLOSE_COLOR () { echo -ne '\e[m'; }
echo -e "\e[38;5;194m$(date +%A\ %d\ %B\ %Y\ -\ %H:%M)\e[m"
PS1=' `EXT_COLOR 81`\]\u@\h`CLOSE_COLOR`\] `EXT_COLOR 195`\]$PWD >`CLOSE_COLOR`\]`EXT_COLOR 173`\]$(__git_ps1 " (%s)")`CLOSE_COLOR`\]\n '

# ========================================
# Environment
# ========================================

export PATH=$PATH
export EDITOR=emacs
export DISPLAY=localhost:0.0  # Necessary to make gitk working
export INPUTRC=$HOME/.inputrc # Necessary to customise keyboard
export TERM=cygwin
export C='/cygdrive/c'
export G='/cygdrive/g'
export E='/cygdrive/e'

# ========================================
# Alias
# ========================================

# Programs

alias chrome='$C/Users/rafaelgp/AppData/Local/Google/Chrome/Application/chrome.exe'
alias chrometest='$C/Users/rafaelgp/AppData/Local/Google/Chrome/Application/chrome.exe --allow-file-access-from-files'

# Commands

alias ls='ls --color'
alias cl='clear'
alias ll='ls -la'
alias lsd='ls -d -- */'
alias sb='source ${HOME}/.bashrc' # Like in 'source bash'
alias grep='grep --color=auto'

#  Directories

alias emd='cd ${HOME}/.emacs.d/' # EMacs Directory
alias c='cd $C'
alias g='cd $G'
alias e='cd $E'
alias jbs='cd $G/jobs'
alias vt='cd $G/virtual_tours'
alias life='cd $E'
alias vttemp='cd $G/virtual_tours/.archives/vt_template_8_0_15'
alias new_scroll='cd $G/virtual_tours/.archives/new_scroll/'
alias kr='cd $G/documents/software/virtual_tours/krpano/krpano-1.0.8-15/'
alias krt='cd $G/documents/software/virtual_tours/krpano/krpanotools-1.0.8.15/'

# ========================================
# Server
# ========================================

alias missinglinks='grep -i "File does not exist" /var/log/apache3/error.log | grep "Mar\ 30" | grep -v "robots.txt" | cut -d \  -f13- | sort | uniq'
alias sh1='ssh rafaelgp@75.98.171.177'

# ========================================
# Emacs
# ========================================

function elc {
    emacs -batch -f batch-byte-compile $1
}

# ========================================
# Git
# ========================================

source $C/cygwin/usr/share/stgit/completion/stgit-completion.bash

alias ga='git add'
alias gap='git add -p'
# View local and remote braches
alias gb='git branch -a -v'
#alias gb='git branch'
alias gc='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --pretty=format:"%h %ad | %s%d" --graph --date=short '
alias gll='git log --pretty=oneline'
alias gm='git commit -m'
alias gma='git commit -am'
alias gp='git push'
alias gpu='git pull'
alias gra='git remote add'
alias grr='git remote rm'
alias gs='git status'
# gc      => git checkout master
# gc bugs => git checkout bugs
# Remove deleted files form git
alias gr='${HOME}/bin/git_remove_after.sh'

function gc {
    if [ -z "$1" ]; then
        git checkout master
    else
        git checkout $1
    fi
}