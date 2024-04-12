###########################
# ENVIRONMENTAL VARIABLES ##
###########################

export EDITOR="vim"

# Explicitly set locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Virtualenv Wrapper for Python
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    # Path to Virtual Environments
    export WORKON_HOME=${HOME}/.virtualenvs

    # Path to Python
    export VIRTUALENVWRAPPER_PYTHON=`which python`

    # pip should only run if there is a virtualenv currently activated
    export PIP_REQUIRE_VIRTUALENV=true

    # Cache pip-installed packages to avoid re-downloading
    export PIP_DOWNLOAD_CACHE=${HOME}/.pip/cache

    source /usr/local/bin/virtualenvwrapper.sh
fi


##############
# COLORIZING #
##############

# Prompt (as in Ubuntu) with current Git branch
PS1='\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;36m\]$(__git_ps1)\[\033[00m\]\$ '

# Terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


###########
# ALIASES #
###########

alias ls='ls --color=auto' # Comment this line on Mac OS X
alias ll='ls -lhaG'
alias mkdir='mkdir -p'
alias tmux='tmux attach || tmux new'
alias vlc='nice -n 20 /Applications/VLC.app/Contents/MacOS/VLC &'
alias vim='/usr/local/bin/vim'

# Colorized Scala REPL
alias scala='scala -Dscala.color'

# Run mtr under sudo
# alias mtr='PATH=/usr/local/sbin:$PATH sudo mtr' # Uncomment this line on Mac OS X

# List directories first
alias a='ls -la | grep "^d" && ls -la | grep -v "^d"'

# up one folder
alias ..='cd ..'

# grep with color and ignore case
alias grep='grep --color=auto'

# JSON prettifier (intended for usage in pipes)
alias pjson='python -m json.tool'

# refresh shell
alias reload='source ${HOME}/.bashrc'

# remove all .pyc files
alias rm_pyc='find . -name "*.pyc" -exec rm -rf {} \;'

# PDB session capture when running py.test
alias py.test='py.test --pdb --capture=no'

# Find and format all Dhall files
alias dhall_format="find . -name "*.dhall" -type f -exec sh -c 'dhall format < {} > {}.$$.tmp && mv {}.$$.tmp {}' \;"

###########
# HISTORY #
###########

# History size
HISTSIZE=100000

# When the shell exits, append to the history rather than overwrite it
shopt -s histappend

# Append command to the history
export PROMPT_COMMAND="history -a"

# Erase duplicate lines in the history and don't save commands starting with whitespace
export HISTCONTROL=erasedups:ignorespace

##################
# GIT COMPLETION #
##################

# Needs `brew install git bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
