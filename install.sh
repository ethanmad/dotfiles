#!/bin/bash

for dir in `cat stow-list.txt`; do
    stow $dir
done
