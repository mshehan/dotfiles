#!/bin/zsh

RED='\033[0;31m'
GREEN='\033[0;32m'
RIGHT_ARROW="→"
RESET='\033[0m'

function install_vim_plugins {
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/dotfiles/home_dir
  vim +PluginInstall +qall
}

function install_brew_if_needed {
  if ! command -v brew >& /dev/null
  then 
    echo "brew not found. starting download..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "brew found. skipping brew install"
  fi
}

function install_oh_my_zsh_if_needed {
  if [ ! -d  $ZSH ] || [ ! -f $ZSH ]
  then 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
  else
    echo "oh-my-zsh already installed at ${ZSH}"
  fi 
}

function link_dot_file_to_main_dir {
  local main_dir=$HOME/${1##*/}
  local dotfile_dir=$1

  if [ ! -d $dotfile_dir ] || [ ! -f $dotfile_dir ]
  then 
    echo -e "${GREEN}creating soft link from${RESET}"
    printf "%-10s %s %-10s\n\n" "${dotfile_dir}" "${RIGHT_ARROW}" "${main_dir}"
    ln -sf $dotfile_dir $main_dir
  fi 
}

function remove_soft_links {
  local main_dir=$HOME/${1##*/}

  if [ -d $main_dir ] || [ -f $main_dir ]
  then 
    echo -e "${RED}removing${RESET} ${main_dir}"
    rm -r $main_dir
  fi
}

function link_config_files {
  setopt local_options extended_glob
  
  files=( $HOME/dotfiles/home_dir/(^(DS_Store)*|.^(DS_Store)*) )

  for file in ${files[@]} 
  do 
    remove_soft_links $file 
  done 

  for file in ${files[@]} 
  do 
    link_dot_file_to_main_dir $file 
  done 
}


function main() {
  install_brew_if_needed;
  link_config_files;
  source $HOME/.zshrc;
  brew bundle install;
  install_oh_my_zsh_if_needed;
  omz reload; 
  install_vim_plugins;
}

main;

