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

ngrep() {
	/usr/bin/grep --exclude "package*.json" --exclude-dir "*node_modules*" "$@"
}

HISTSIZE=10000
SAVEHIST=10000

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified

bindkey -e

# User specific aliases and functions
alias ls="ls -G"
alias ll="ls -Gl"
alias la="ls -Ga"
alias dnsclear="sudo killall -HUP mDNSResponder"
alias hist="history"
alias find="gfind"

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

unsetopt AUTO_REMOVE_SLASH

unsetopt automenu
setopt bashautolist
