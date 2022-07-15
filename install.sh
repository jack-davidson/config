#!/bin/sh

host=$(cat /etc/hostname)

pwd=$(pwd)

dir() {
    ln -sf $pwd/$1 $2
    echo "dir $pwd/$1 -> $2"
}

files() {
    for file in $(ls $1); do
        ln -sf $pwd/$1/$file $2/$file
        echo "files $pwd/$1/$file -> $2/$file"
    done;
}

dotfiles() {
    for file in $(ls $1); do
        ln -sf $pwd/$1/$file $2$file
        echo "dotfiles $pwd/$1/$file -> $2$file"
    done;
}

dir     qutebrowser     ~/.config
dir     alacritty       ~/.config
dir     kitty           ~/.config
dir     fontconfig      ~/.config
dir     nvim            ~/.config
dir     zathura         ~/.config
dir     dunst           ~/.config
dir     spotifyd        ~/.config
dir     spotify-tui     ~/.config
dir     picom           ~/.config
dir     mpd:host        ~/.config
dir     ncmpcpp         ~/.config
dir     wezterm         ~/.config

dotfiles   xinit:$host     ~/.
dotfiles   alsa:$host      ~/.

files   xdg             ~/.config

files   tmux    ~/.
files   zsh     ~/.
