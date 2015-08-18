" Current .vimrc file path
let s:path = resolve(expand('<sfile>:p'))
" .colemak-vimrc file path
let colemakvim = substitute(s:path,".vimrc",".colemak-vimrc","")
" Current dir
let currentdir = substitute(s:path,".vimrc","","")
":echom currentdir
exec 'source '.colemakvim
syntax on

" Bundle config start
set nocompatible
filetype off
exec 'set rtp+='.currentdir.'.vim'
exec 'set rtp+='.currentdir.'.vim/bundle/Vundle.vim'
":echom &rtp
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" All of plugins must added here (before call vundle#end())
Bundle 'chase/vim-ansible-yaml'
call vundle#end()
filetype plugin indent on
" Bundle config end
