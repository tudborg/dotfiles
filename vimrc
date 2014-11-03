" Vundle begin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin defs
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
" Vundle end

"
" Plugin Configs
"

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" vim-gitgutter
let g:gitgutter_realtime = 1 "maybe disable if git hangs
let g:gitgutter_eager=1
let g:gitgutter_sign_column_always=1

" all the tabbing stuff
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

vnoremap <silent><S-TAB> <gv
vnoremap <silent><TAB> >gv



" Misc
set mouse=a
set number
set showcmd
set enc=utf-8
set fileformat=unix
set showmatch
set scrolloff=5
set sidescrolloff=3
set laststatus=2
"set statusline=
"set statusline+=%2*%-3.3n%0*
"set statusline+=%f\ " file name
set wildmode=list:longest
    set wildmenu


let mapleader = ","


nmap <leader>w :w!<cr>
nmap <leader>f :normal gg=G<cr>


" Enable syntax highlighting
syntax on
" set colorscheme
set t_Co=256
colorscheme Tomorrow-Night-Eighties

