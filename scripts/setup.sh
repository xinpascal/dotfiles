#!/bin/sh

dotdirs="config fonts icons themes vnc mozilla"

for dir in $dotdirs; do
	mkdir -p ~/.$dir
	cp -rf $dir/* ~/.$dir/
done

dotfiles=".Xclients"
cp -rf $dotfiles ~/
