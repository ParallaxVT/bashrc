#!/bin/bash

# Some example alias instructions
# They will be used instead of any instructions they may mask.
# For example, alias rm='rm -i' will mask the rm application.
# To override the alias instruction use a \ before.
# For example \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc
alias less='less -r'                           # raw control characters
alias whence='type -a'                         # where, of a sort
alias grep='grep --color=auto'                 # show differences in colour
alias egrep='egrep --color=auto'               # show differences in colour
alias fgrep='fgrep --color=auto'               # show differences in colour
alias cl='clear'
alias settitle=set_term_title $1
alias halt='sudo halt'

# Directory listings
alias ls='ls -h --color=tty'                  # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                               # long list
alias la='ls -lA'                              # all but . and ..

# Directory navigation
alias cd=cd_func
alias cdd='. $win_home/bin/find_and_enter.sh'

alias sb='. $win_home/.bashrc'

# Important directories
alias goto=go_func $1
alias rgp="cd $rgp_dir"                        # Rafaelgp
alias home="cd $win_home"                      # Home
alias dk="cd $rgp_dir/Desktop"                 # Desktop
alias dw="cd $rgp_dir/Downloads"               # Downloads
alias wk="cd $work_dir"                        # Work
alias emd="cd ${HOME}/.emacs.d"                # EMacs Directory
alias jb="cd $work_dir/jobs"                   # Jobs
alias vt="cd $work_dir/virtual_tours"          # virtual Tours
alias vttemp="$work_dir/virtual_tours/.archives/vt_template_8_0_15"
alias kr="$work_dir/documents/software/virtual_tours/krpano/krpano-1.0.8-15"
alias krt="$work_dir/documents/software/virtual_tours/krpano/krpanotools-1.0.8.15"

# Important jobs directories
alias bin="cd $work_dir/virtual_tours/.archives/bin/"
alias awa="cd $work_dir/virtual_tours/natas/awareness"
alias ictb="cd $work_dir/virtual_tours/citb/innovation_team_talk/"
# Scripts
alias newvt="bash $win_home/bin/vt/newvt.sh"
alias elearning="bash $work_dir/virtual_tours/.archives/bin/elearning/elearning.sh"
alias winscp="/media/c/Program\ Files\ \(x86\)/WinSCP/WinSCP.exe $1"

# ========================================
# Cygwin
# ========================================

if [ $(uname -o) = "Cygwin" ];then
    alias chrome='/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe &'
    alias emacs='/c/emacs-24.2/bin/runemacs.exe &'
    alias halt='shutdown -p -f'
fi

# ========================================
# Server
# ========================================

alias missinglinks='grep -i "File does not exist" /var/log/apache3/error.log | grep "Mar\ 30" | grep -v "robots.txt" | cut -d \  -f13- | sort | uniq'
alias tv='ssh 75.98.171.177'

# ========================================
# Emacs
# ========================================

# Byte compile specified file
alias elc='emacs -batch -f batch-byte-compile $1'

# ========================================
# Git
# ========================================

alias ga='git add'
alias gap='git add -p'
alias gb='git branch -a -v' # View local and remote braches
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
alias grc='git rm --cached'         # Stop tracking file
alias grrc='git rm -r --cached'     # Stop tracking directory

# Remove deleted files form git
alias gr='$win_home/bin/git_remove_after.sh'

# Use:
# gc => git checkout master
# gc test => git checkout test
alias gc='if [ -z "$1" ]; then git checkout master; else git checkout $1; fi'

