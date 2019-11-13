#!/bin/bash

# Stow packages
for package in `cat package-list.txt`; do
    stow $package
done
echo "Packages stowed."

# Set shell to fish if it's something else.
if [ "$SHELL" != '/bin/fish' ]; then
    chsh -s /bin/fish
fi

echo "Installation done."
