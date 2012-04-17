#!/bin/bash
# Configuration {{{

# Don't wait for job termination notification
set -o notify
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredup

# }}}

# Enable bash completion

if [ "$PS1" -a -f /etc/bash_completion ]; then

    . /etc/bash_completion

fi

# Custom Shell {{{

# Green 113
# Red 173
# Blue 81
# Yellow 186
# Light Green 194
# Light Blue 195

function EXT_COLOR () { echo -ne "\e[38;5;$1m"; }
function CLOSE_COLOR () { echo -ne '\e[m'; }
PS1=' `EXT_COLOR 81`\]\u@\h`CLOSE_COLOR`\] `EXT_COLOR 195`\]$PWD >`CLOSE_COLOR`\]`EXT_COLOR 173`\]$(__git_ps1 " (%s)")`CLOSE_COLOR`\]\n '
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
echo -e "\e[38;5;194m$(date +%A\ %d\ %B\ %Y\ -\ %H:%M)\e[m"
# }}}

# Environment {{{

export PATH=$PATH
export EDITOR=emacs
export DISPLAY=localhost:0.0 # Necessary to make gitk working

#  }}}

# =========== Programs ==========

alias serendipity='/cygdrive/c/cygwin/bin/run.exe -p /usr/X11R6/bin /cygdrive/c/emacs24/src/emacs-24.0.94.1 -q -l /cygdrive/c/Users/rafaelgp/AppData/Roaming/.emacs.el -display 127.0.0.1:0.0'

# =========== Commands ==========

alias cl='clear'
alias ll='ls -la'
alias eb='serendipity ${HOME}/.bashrc' # Like in 'edit bash' 
alias sb='source ${HOME}/.bashrc' # Like in 'source bash'

# =========== Directories ==========

export G='/cygdrive/g'
alias g='cd /cygdrive/g'
export C='/cygdrive/c'
alias c='cd /cygdrive/c'
alias vt='cd /cygdrive/g/virtual_tours'
alias jobs='cd /cygdrive/g/jobs'

# =========== Misc ==========

alias missinglinks='grep -i "File does not exist" /var/log/apache3/error.log | grep "Mar\ 30" | grep -v "robots.txt" | cut -d \  -f13- | sort | uniq'
alias sh1='ssh rafaelgp@75.98.171.177'


# ========= Git ==========

source /cygdrive/c/cygwin/usr/share/stgit/completion/stgit-completion.bash

alias ga='git add'
# View local and remote braches
alias gb='git branch -a -v'
#alias gb='git branch'
alias gc='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
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

function gc {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}
