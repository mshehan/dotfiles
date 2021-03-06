

function install() {
  rm -r ~/.vim
  rm -r ~/.bash_profile
  rm -r ~/.config
  rm -r ~/.vimrc
  
  ln -s ~/dotfiles/.vim ~/.vim
  ln -s ~/dotfiles/.bash_profile ~/.bash_profile
  ln -s ~/dotfiles/.config ~/.config
  ln -s ~/dotfiles/.vimrc ~/.vimrc
  
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

install; 
