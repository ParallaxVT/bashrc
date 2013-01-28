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
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -lA'                             # all but . and ..

# Directory navigation
alias cd=cd_func
alias cdd='. $win_home/bin/find_and_enter.sh'

alias sb='. $HOME/.bashrc'

alias go=go_func $1
alias dk='cd $desk_dir'
alias wk='cd $work_dir'
alias wkp='cd /e'
alias wbck='cd /f'

alias newvt="bash $win_home/bin/vt/newvt.sh"
alias elearning="bash $work_dir/virtual_tours/.archives/bin/elearning/elearning.sh"

# ========================================
# Cygwin
# ========================================

alias chrome='$rootdir/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe &'
alias emacs='$rootdir/c/emacs-24.2/bin/runemacs.exe &'
alias halt='shutdown -p -f'
