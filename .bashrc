#!/bin/bash

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# ========================================
# Environment variables
# ========================================

rgp_dir="/media/c/Users/rafaelgp"
desk_dir="$rpg_dir/Desktop"
work_dir="$rgp_dir/work"
win_home="/media/c/Users/rafaelgp/AppData/Roaming"

export PATH=${PATH}:${HOME}/bin:$work_dir/virtual_tours/.archives/bin/newvt:$work_dir/virtual_tours/.archives/bin/elearning
export EDITOR=emacs
export TERM='xterm-256color'

# ========================================
# Shell Options
# ========================================

# Don't wait for job termination notification
set -o notify
#
# Don't use ^D to exit
set -o ignoreeof
#
# Use case-insensitive filename globbing
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
#shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -q -s cdspell

# Make sure display get updated when terminal window get resized
shopt -q -s checkwinsize

# Turn on the extended pattern matching features
shopt -s extglob

# Append rather than overwrite history on exit
shopt -s histappend

# Make multi-line commandsline in history
shopt -q -s cmdhist

# ========================================
# Completion options
# ========================================

# These completion tuning parameters change the default behavior of bash_completion:

# Turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# ========================================
# history Options
# ========================================

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# ========================================
# Aliases
# ========================================

# Live in a different file
if [ -f "$win_home/.bash_aliases" ]; then
    source "$win_home/.bash_aliases"
fi

# ========================================
# Functions
# ========================================

# Live in a different file
if [ -f "$win_home/.bash_functions" ]; then
    source "$win_home/.bash_functions"
fi

# ========================================
# Umask
# ========================================

umask 002      # 666 (rw-rw-rw-) is the default. Substract 002 = 664

# ========================================
# Custom comand prompt
# ========================================

function EXT_COLOR () { echo -ne "\e[38;5;$1m"; }
function CLOSE_COLOR () { echo -ne '\e[m'; }

# echo -e "\e[38;5;194m$(date +%A\ %d\ %B\ %Y\ -\ %H:%M)\e[m"
PS1=' `EXT_COLOR 81`\u@\h`CLOSE_COLOR` `EXT_COLOR 159`$PWD >`CLOSE_COLOR``EXT_COLOR 173`$('__git_ps1' " (%s)")`CLOSE_COLOR`\n '

# ========================================
# MinGW - Msys
# ========================================

if [ $(uname -o) = "Msys" ]; then
    if [ -f /c/MinGW/msys/1.0/etc/git-prompt.sh ]; then
        source /c/MinGW/msys/1.0/etc/git-prompt.sh
    fi
    if [ -f /c/MinGW/msys/1.0/etc/git-completion.bash ]; then
        source /MinGW/msys/1.0/etc/git-completion.bash
    fi
    if [ -f /c/MinGW/msys/1.0/etc/bash_completion ]; then
        source  /c/MinGW/msys/1.0/etc/bash_completion
    fi
fi
