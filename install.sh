#!/bin/bash

for dir in `cat install-list.txt`; do
    stow $dir
done
