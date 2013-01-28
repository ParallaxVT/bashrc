#!/bin/bash

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# ========================================
# Environment variables
# ========================================

export PATH=${PATH}:${HOME}/bin
export EDITOR=emacs
export TERM='xterm-256color'

if [ $HOSTNAME = "RafaLaptop" ] || [ $HOSTNAME = "RafaelGP" ]; then
    desk_dir="$HOME/../../Desktop"
    win_home="$HOME"
    work_dir="$HOME/../../work"
else
    desk_dir="$HOME/Desktop"
    win_home="/media/sf_C_DRIVE/Users/rafaelgp/AppData/Roaming"
    work_dir="/media/sf_C_DRIVE/Users/rafaelgp/work"
fi

if [ $HOSTNAME = "RafaelGP" ]; then
    work_dir="/g"
fi

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
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

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

umask 002      # 664 (rw-rw-r--)

# ========================================
# Custom comand prompt
# ========================================

function EXT_COLOR () { echo -ne "\e[38;5;$1m"; }
function CLOSE_COLOR () { echo -ne '\e[m'; }

# echo -e "\e[38;5;194m$(date +%A\ %d\ %B\ %Y\ -\ %H:%M)\e[m"
PS1=' `EXT_COLOR 81`\u@\h`CLOSE_COLOR` `EXT_COLOR 159`$PWD >`CLOSE_COLOR``EXT_COLOR 173`$('__git_ps1' " (%s)")`CLOSE_COLOR`\n '

