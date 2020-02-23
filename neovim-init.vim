call plug#begin('~/.config/nvim/plugged')

Plug 'sheerun/vim-polyglot' " syntax highligthing
Plug 'itchyny/lightline.vim' " powerline
Plug 'tpope/vim-fugitive' " git integration
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
" colorschemes
Plug 'flrnprz/plastic.vim'
Plug 'sainnhe/edge'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ayu-theme/ayu-vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'Yggdroot/indentLine'

call plug#end()

" ctrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'


set mouse=a
set noshowmode
set showcmd
set enc=utf-8
set fileformat=unix
set scrolloff=10
set sidescrolloff=3
set nocompatible
filetype off
set number
set ignorecase
set smartcase
set hlsearch
set cursorline

:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

syntax on

" all the tabbing stuff
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

" Indent/Unindent in block
vnoremap <silent><S-TAB> <gv
vnoremap <silent><TAB> >gv

" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber


" Theme
set termguicolors
set background=dark
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

"   hello world
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'


let g:lightline = {
	\ 'active': {
	\ 	'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'FugitiveHead'
	\ },
	\ }
