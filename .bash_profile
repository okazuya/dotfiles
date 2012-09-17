# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH

MANPATH=/opt/local/man:$MANPATH

export EDITOR=/usr/bin/vim

