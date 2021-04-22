# #!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_BACKUP_DIR="$HOME/.dotfiles_backup"

# create .dotfiles_backup in homedir
cd $HOME
mkdir -p .dotfiles_backup
# echo "Created /.dotfiles_backup for backup of any existing dotfiles in home directory."

list_subdirs() {
  ls -Ap | egrep "/$"
}

list_files() {
  ls -Ap | grep -v /
}

cd $DOTFILES_DIR

dotfiles=$(list_files)
if [ ! "$dotfiles" = '' ]; then
  for dotfile in $dotfiles; do
    linkfile=$HOME/$dotfile
    if [ -f $linkfile ]; then
      mv $linkfile $DOTFILES_BACKUP_DIR
    fi
    if [ $dotfile != "setup.sh" ]; then
      ln -sfnv $(pwd)/$dotfile $linkfile
    fi
  done
fi

function recursive_link {
  dotfile_subdirs=$(list_subdirs)
  if [ ! "$dotfile_subdirs" = '' ]; then
    for dotfile_subdir in $dotfile_subdirs; do
      cd $dotfile_subdir
      linkdir=$HOME/$1$dotfile_subdir
      if [ ! -d $linkdir ]; then
        was=$(pwd)
        cd $HOME
        mkdir -p $linkdir
        cd $was
      fi
      dotfiles=$(list_files)
      if [ ! "$dotfiles" = '' ]; then
        for dotfile in $dotfiles; do
          linkfile=$linkdir$dotfile
          if [ -f $linkfile ]; then
            mv $linkfile $DOTFILES_BACKUP_DIR
          fi
          ln -sfnv $(pwd)/$dotfile $linkfile
        done
        recursive_link $1$dotfile_subdir
        cd ..
      else
        recursive_link $1$dotfile_subdir
      fi
    done
  fi
}

recursive_link

cd $HOME
