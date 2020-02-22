
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


call plug#begin('~/.config/nvim/plugged')

Plug 'sheerun/vim-polyglot' " syntax highligthing
Plug 'itchyny/lightline.vim' " powerline
Plug 'tpope/vim-fugitive' " git integration
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
" colorschemes
Plug 'flrnprz/plastic.vim'
Plug 'sainnhe/edge'
Plug 'christoomey/vim-tmux-navigator'

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


set background=dark
syntax on
colorscheme plastic

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


let g:lightline = {
	\ 'colorscheme': 'edge',
	\ 'active': {
	\ 	'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'FugitiveHead'
	\ },
	\ }
