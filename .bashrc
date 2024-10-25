# .bashrc

# Source global definitions

export HISTSIZE=1000
export LESS='-R'
alias ll='ls -lha'
alias rm='rm -rf'

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
