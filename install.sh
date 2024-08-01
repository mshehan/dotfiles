
function install_brew_if_needed() {
  if ! command -v brew >& /dev/null
  then 
    echo "brew not found. starting download..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew bundle install --file=~/dotfiles/Brewfile
  else
    echo "brew found. skipping brewfile install"
  fi
}

function link_dot_file_to_main_dir() {
  local main_dir=~/$1
  local dotfile_dir=~/dotfiles/$1

  if [ -d $main_dir ] || [ -f $main_dir ]
  then 
    echo "removing ${1}"
    rm -r $main_dir
  fi

  if [ ! -d $dotfile_dir ] || [ ! -f $dotfile_dir ]
  then 
    echo "creating soft link from ${dotfile_dir} to ${main_dir}"
    ln -s $dotfile_dir $main_dir
  fi 
}

function link_config_files() {
  link_dot_file_to_main_dir .bash_profile
  link_dot_file_to_main_dir .config
  link_dot_file_to_main_dir .git
  link_dot_file_to_main_dir .gitignore
  link_dot_file_to_main_dir .oh-my-zsh
  link_dot_file_to_main_dir .vim
  link_dot_file_to_main_dir .vimrc
  link_dot_file_to_main_dir .zsh_functions
  link_dot_file_to_main_dir .zshrc
  link_dot_file_to_main_dir gitconfig
}

function main() {
  install_brew_if_needed;
  link_config_files;
}

main;

