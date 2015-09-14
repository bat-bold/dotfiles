" Current .vimrc file path
let s:path = resolve(expand('<sfile>:p'))
" .colemak-vimrc file path
let colemakvim = substitute(s:path,".vimrc",".colemak-vimrc","")
" Current dir
let currentdir = substitute(s:path,".vimrc","","")
" :echom currentdir
exec 'source '.colemakvim
syntax on

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
