#!/usr/bin/env bash

for dir in * ; do
	if [ -d "$dir" ]; then
		echo "$PWD/$dir"
		sudo ln -s $PWD/$dir $HOME/.config/$dir
	fi
done
