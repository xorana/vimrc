#!/bin/sh

install() {
	cd ~/vimrc
	
	git submodule init
	git submodule update
	
	cd ~

	if [[ -f ~/.vimrc ]]; then
		mv ~/.vimrc ~/.vimrc_old
		echo "changed ~/.vimrc to ~/.vimrc_old"
	fi

	if [[ -d ~/.vim ]]; then
		mv ~/.vim ~/.vim_old
		echo "changed ~/.vim to ~/.vim_old"
	fi

	echo "linking ~/vimrc/vimrc to ~/.vimrc"
	ln -s ~/vimrc/vimrc ~/.vimrc

	echo "linking ~/vimrc/vim to ~/.vim"
	ln -s ~/vimrc/vim ~/.vim

	echo "creating ~/.vim/.tmp and ~/.vim/.undo"
	mkdir -p ~/.vim/.tmp
	mkdir -p ~/.vim/.undo

	echo "xorana's vimrc installed!"
}

install
