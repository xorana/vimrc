#!/bin/sh

die() {
	warn "$1"
	exit 1
}

install() {
	cd ~
	git clone git@github.com:xorana/vimrc.git
	cd vimrc

	git submodule init
	git submodule update

	cd ~
	ln -s ~/vimrc/vimrc ~/.vimrc
	ln -s ~/vimrc/vim ~/.vim

	echo "xorana's vimrc installed!"
}

install
