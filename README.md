ethanmad dotfiles
=================

My personal set of dotfiles for various programs I use. Managed with [GNU Stow](https://www.gnu.org/software/stow/). After installing stow and cloning the repository, `cd` into the directory, then run `stow.sh` (edit `stow-list.txt` if you don't use all the included programs).

Feel free to fork and use for yourself, just make sure to edit `git/.gitconfig` with your own user information.


Installation
------------

```
$ git clone https://github.com/ethanmad/dotfiles.git
$ cd dotfiles
$ ./install.sh
```

To customize installation, edit `install-list.txt` and remove program names you don't want.

That's all!
