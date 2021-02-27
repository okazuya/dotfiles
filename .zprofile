if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi

export PATH="$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH"

MANPATH=/opt/local/man:$MANPATH

export EDITOR=/usr/bin/vim

