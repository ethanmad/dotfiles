#!/bin/bash

# Stow packages
for package in `cat package-list.txt`; do
    stow $package
done
echo "Packages stowed."

# Install prezto
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Set shell to ZSH if it's something else.
if [ "$SHELL" != '/bin/zsh' ]; then
    chsh -s /bin/zsh 
fi

echo "Installation done."
