ethanmad dotfiles
=================

My personal set of dotfiles for various programs I use.
Managed with [GNU Stow](https://www.gnu.org/software/stow/).


Installation
------------

Back up your files and clear your home directory of files that will be provided by the installation. 
Stow will abort all operations if the files to be symlinked already exist in the home directory.

``` bash
$ git clone https://github.com/ethanmad/dotfiles.git
$ cd dotfiles
$ ./install.sh
```

To customize installation, remove unwanted packages from `package-list.txt`.
Edit `git/.gitconfig` and replace the `[user]` section with accurate information.

That's all!

Dependencies
-----------

  - i3
  - i3blocks
  - inconsolata
  - termite
  - neovim
  - git
  - x
  - zsh
