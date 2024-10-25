# .bash_profile

# Get the aliases and functions

export HISTSIZE=1000
export LESS='-R'

alias ll='ls -lha'
alias rm='rm -rf'

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
