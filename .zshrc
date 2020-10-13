export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git)

export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# general aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# program aliases
alias open="xdg-open"
alias emacs="emacs -nw"
alias emacs26="emacs26 -nw"
alias utop="rlwrap ocaml"
alias v="vim"

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

updateArchPackages() { 
  sudo pacman -Qqen > .arch_packages 
}
installArchPackages() { 
  sudo pacman -S --needed - < .arch_packages 
}
