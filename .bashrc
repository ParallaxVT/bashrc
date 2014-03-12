#!/bin/bash

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# ========================================
# Environment variables
# ========================================

rgp_dir="/media/c/Users/rafaelgp"
win_home="/media/c/Users/rafaelgp/AppData/Roaming"
work_dir="/media/e"

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
bind 'set completion-ignore-case on'
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
# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White
IEND='\e[m'
PS1="$IGreen \$PWD $IEND>$('__git_ps1' " $IYellow[$IEND$ICyan%s$IEND$IYellow]$IEND")\n "

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

# =========================================
# Appearance
# =========================================
# File Types:
# di = directory
# fi = file
# ln = symbolic link
# pi = fifo file
# so = socket file
# bd = block (buffered) special file
# cd = character (unbuffered) special file
# or = symbolic link pointing to a non-existent file (orphan)
# mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
# ex = file which is executable (ie. has 'x' set in permissions).
# Styles:
# 0   = default colour
# 1   = bold
# 4   = underlined
# 5   = flashing text
# 7   = reverse field
# 31  = red
# 32  = green
# 33  = orange
# 34  = blue
# 35  = purple
# 36  = cyan
# 37  = grey
# 40  = black background
# 41  = red background
# 42  = green background
# 43  = orange background
# 44  = blue background
# 45  = purple background
# 46  = cyan background
# 47  = grey background
# 90  = dark grey
# 91  = light red
# 92  = light green
# 93  = yellow
# 94  = light blue
# 95  = light purple
# 96  = turquoise
# 100 = dark grey background
# 101 = light red background
# 102 = light green background
# 103 = yellow background
# 104 = light blue background
# 105 = light purple background
# 106 = turquoise background
LS_COLORS='di=0;94:fi=0;36:ex=0;92:'
export LS_COLORS
