export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git)

export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#[[ $TERM != "screen" ]] && exec tmux
#if which tmux 2>&1 >/dev/null; then
  #if [ $TERM != "screen-256color" ] && [ $TERM != "screen" ]; then
    #tmux attach -t hack || tmux new -s hack; exit
  #fi
#fi

# general aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# program aliases
alias open="xdg-open"
alias emacs="emacs -nw"
alias emacs26="emacs26 -nw"
alias utop="rlwrap ocaml"
alias v="vim"
alias nv="nvim"
alias tmux="tmux -f ~/.config/tmux/tmux.conf"

# scripts
dotfilesChanges() { 
  config status | grep "modified" | grep -v "opam" 
}
se() { 
  du -a $HOME/* | awk '{ gsub (" ", "\\ ", $0); $1 = ""; print $0; }' | fzf | xargs -r xdg-open; 
}

pwdclip() { 
  pwd | awk '{gsub( " ","\\ " ); print}' | xclip -selection c 
}
cdclip() { 
  cd $(xclip -o) 
}

updateDebianPackages() {
  sudo dpkg-query -f '${binary:Package}\n' -W > .debian_packages
}
installDebianPackages() {
  sudo xargs -a .debian_packages apt install
}
