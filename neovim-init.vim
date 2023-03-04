call plug#begin('~/.config/nvim/plugged')

Plug 'sheerun/vim-polyglot' " syntax highligthing
Plug 'itchyny/lightline.vim' " powerline
Plug 'tpope/vim-fugitive' " git integration
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plug 'christoomey/vim-tmux-navigator' " navigate vim splits/tmux panes seamlessly
Plug 'nvim-tree/nvim-tree.lua'
" colorscheme, themes etc
Plug 'nvim-tree/nvim-web-devicons'
Plug 'flrnprz/plastic.vim'
Plug 'sainnhe/edge'
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

" Highlight colors in their color
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

" folding
let g:markdown_folding=1
highlight Folded term=standout ctermfg=14 ctermbg=0
nnoremap <space> za
vnoremap <space> za
set foldlevel=99


let g:lightline = {
	\ 'active': {
	\ 	'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'FugitiveHead'
	\ },
	\ }

noremap <silent> <C-Left> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-Down> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-Up> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-Down> :<C-U>TmuxNavigateRight<cr>

lua <<EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup()

local function open_nvim_tree(data)
    require("nvim-tree.api").tree.toggle({focus = false, find_file = true, update_root = true})
end

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
EOF

