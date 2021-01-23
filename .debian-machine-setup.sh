#!/bin/bash

sudo apt install zsh git vim curl python3-neovim i3 i3-wm i3lock i3status rofi htop autoconf automake autotools-dev g++ g++-7 gcc gcc-7 gdb python3 python2.7

echo ".cfg" >> .gitignore
git clone --bare https://github.com/typesAreSpaces/archDotFiles.git $HOME/.cfg
mkdir -p .config-backup && \
  /usr/bin/git/ --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
  xargs -I{} mv {} .config-backup/{}
/usr/bin/git/ --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
/usr/bin/git/ --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/undodir
vim +PlugInstall +qa

chsh -s /bin/zsh
