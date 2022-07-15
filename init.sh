#!/bin/sh

host=$(cat /etc/hostname)

pwd=$(pwd)

dir() {
    ln -sf $pwd/$1 $2
}

files() {
    for file in $(ls $1); do
        ln -sf $pwd/$1/$file $2/$file
    done;
}

dotfiles() {
    for file in $(ls $1); do
        ln -sf $pwd/$1/$file ~/.$file
    done;
}

