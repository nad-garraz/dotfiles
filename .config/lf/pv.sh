#!/usr/bin/env bash

case "$1" in
	*.png) sxiv "$1";;
	*.jpg) sxiv "$1";;
	*.jpeg) sxiv -t "$1";;
	*.pdf) zathura "$1";;
	*) highlight -O ansi "$1" || cat "$1";;
esac
