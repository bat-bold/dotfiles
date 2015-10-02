" Current .vimrc file path
let s:path = resolve(expand('<sfile>:p'))
" .colemak-vimrc file path
let colemakvim = substitute(s:path,".vimrc",".colemak-vimrc","")
" .common-keybinding-vimrc file path
let commonvim = substitute(s:path,".vimrc",".common-keybinding-vimrc","")
" Current dir
let currentdir = substitute(s:path,".vimrc","","")
" :echom currentdir
exec 'source '.colemakvim
exec 'source '.commonvim
syntax on

set tabstop=2 	" The width of a TAB is set to 2
		" Still it is a \t. It is just that 
		" Vim will interpret it to be having 
		" a width of 4
set shiftwidth=2 	" Indents will have a width of 2
set softtabstop=2	" Sets the number of columns for a TAB
set expandtab		" Expand TABs to spaces

" Needs when using fish shell otherwise errors produced
set shell=/bin/bash

" Bundle config start
set nocompatible
filetype off
exec 'set rtp+='.currentdir.'.vim/bundle/Vundle.vim'
" :echom &rtp
call vundle#begin(currentdir.'.vim/bundle')
Plugin 'gmarik/Vundle.vim'
Plugin 'ekalinin/Dockerfile.vim'
Bundle 'chase/vim-ansible-yaml'
" All of plugins must added here (before call vundle#end())
call vundle#end()
filetype plugin indent on
" Bundle config end
