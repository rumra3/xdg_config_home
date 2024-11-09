#!/usr/bin/env bash

for dir in * ; do
    if [ -d "$dir" ]; then
        echo "$PWD/$dir"
        ln -s $PWD/$dir $HOME/.config/$dir
    fi
done

ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.gitconfig $HOME/.gitconfig
