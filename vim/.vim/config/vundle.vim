""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'KevinGoodsell/vim-csexact'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/seoul256.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
" Plugin 'gerw/vim-latex-suite'
" Plugin 'ervandew/supertab'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'vimwiki'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/syntastic'
Plugin 'sirver/ultisnips'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'

call vundle#end()            " required

filetype plugin indent on    " required
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

