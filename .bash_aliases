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

# Important directories
alias go=go_func $1
alias dk='cd $desk_dir'         # Desktop
alias wk='cd $work_dir'         # Work
alias wkp='cd /e'               # Work Plus
alias wbck='cd /f'              # Windows backup
alias emd='cd ${HOME}/.emacs.d' # EMacs Directory
alias jb='cd /g/jobs'           # Jobs
alias vt='cd /g/virtualtours'   # virtual Tours
alias vttemp=' $work_dir/virtual_tours/.archives/vt_template_8_0_15'
alias kr='$work_dir/documents/software/virtual_tours/krpano/krpano-1.0.8-15'
alias krt='$work_dir/documents/software/virtual_tours/krpano/krpanotools-1.0.8.15'

# Scripts
alias newvt="bash $win_home/bin/vt/newvt.sh"
alias elearning="bash $work_dir/virtual_tours/.archives/bin/elearning/elearning.sh"

# ========================================
# Cygwin
# ========================================

alias chrome='/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe &'
alias emacs='/c/emacs-24.2/bin/runemacs.exe &'
alias halt='shutdown -p -f'

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

# Remove deleted files form git
alias gr='$win_home/bin/git_remove_after.sh'

# Use:
# gc => git checkout master
# gc test => git checkout test
alias gc='if [ -z "$1" ]; then git checkout master; else git checkout $1; fi'
