#/bin/sh

( \
cd ~/ \
&& ln -s dotfiles/.gitconfig \
&& ln -s dotfiles/.tmux.conf \
&& ln -s dotfiles/.vimrc \
&& ln -s dotfiles/.zprofile \
&& ln -s dotfiles/.zsh \
&& ln -s dotfiles/.zshrc \
)
