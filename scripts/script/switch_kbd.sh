#!/bin/sh

case $1 in
	normal)
		setxkbmap -model dellusbm -layout br -variant abnt2
	;;
	guards)
		setxkbmap -model dellusbm -layout br -variant dvorak
	;;
	*)
		echo "Unknown Keyboard"
	;;
esac
