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

alias serendipity='/cygdrive/c/cygwin/bin/run.exe -p /usr/X11R6/bin /cygdrive/c/emacs24/src/emacs-24.0.94.1 -q -l /cygdrive/c/Users/rafaelgp/AppData/Roaming/.emacs.el &'

# =========== Commands ==========

alias cl='clear'
alias ll='ls -la'
alias eb='serendipity ${HOME}/.bashrc' # Like in 'edit bash'
alias sb='source ${HOME}/.bashrc' # Like in 'source bash'

# =========== Directories ==========

alias emd='cd ${HOME}/.emacs.d/' # EMacs Directory
export G='/cygdrive/g'
alias g='cd /cygdrive/g'
export C='/cygdrive/c'
alias c='cd /cygdrive/c'
alias vt='cd /cygdrive/g/virtual_tours'
alias jbs='cd /cygdrive/g/jobs'
alias vttemp='cd /cygdrive/g/virtual_tours/.archives/vt_template/'
alias new_scroll='cd /cygdrive/g/virtual_tours/.archives/new_croll/'

# =========== Jobs ==========

alias addoctor='cd /cygdrive/g/websites/addoctor/'
alias fergus='cd /cygdrive/g/virtual_tours/mintra/st_fergus/'
alias fire='cd /cygdrive/g/virtual_tours/elearning/fire_safety/'
alias mta='cd /cygdrive/g/virtual_tours/mta/'
alias optima='cd /cygdrive/g/virtual_tours/mintra/optima/'
alias rush='cd /cygdrive/g/virtual_tours/.creare/rush/'
alias stoke='cd /cygdrive/g/virtual_tours/stoke_park/'
alias stevenage='cd /cygdrive/g/virtual_tours/stevenage_bioscience/'
alias awareness='cd /cygdrive/g/virtual_tours/natas/awareness/'

# =========== misc ==========

alias missinglinks='grep -i "File does not exist" /var/log/apache3/error.log | grep "Mar\ 30" | grep -v "robots.txt" | cut -d \  -f13- | sort | uniq'
alias sh1='ssh rafaelgp@75.98.171.177'
function elc {
    emacs -batch -f batch-byte-compile $1
}
alias exifer="/cygdrive/g/virtual_tours/.archives/scripts/exifer.sh"
# Create a new virtual tour directory
alias newvt='/cygdrive/g/virtual_tours/.archives/scripts/newvt.sh'

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