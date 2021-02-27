# .zshrc

# Source global definitions
if [ -f /etc/zshrc ]; then
  . /etc/zshrc
fi

fg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}

HISTSIZE=10000
SAVEHIST=10000

# User specific aliases and functions
alias ll="ls -l"
alias la="ls -a"

# git-completion
###################################################################################################
# $ ll .zsh/
# _git -> /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.zsh
# git-completion.bash -> /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
###################################################################################################
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# git-prompt
. /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f:%F{blue}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '
