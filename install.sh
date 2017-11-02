#!/bin/sh

install() {
	git submodule init
	git submodule update

	ln -s ~/vimrc/vimrc ~/.vimrc
	ln -s ~/vimrc/vim ~/.vim

	mkdir -p ~/.vim/.tmp
	mkdir -p ~/.vim/.undo

	echo "xorana's vimrc installed!"
}

install
