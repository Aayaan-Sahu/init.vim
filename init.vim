set nocompatible
set nu
syntax enable
set bg=dark
set encoding=utf-8
set pyxversion=3
set cursorline
set tabstop=4
set shiftwidth=4
set nobackup
set mouse=a
set updatetime=100

set splitbelow
set splitright

filetype plugin on
set guifont=FiraCode\ Nerd\ Font:h13.5

" NERDTree config
	let g:NERDTreeMinimalUI=1
	let g:NERDTreeWinPos="right"
	let g:NERDTreeDirArrowExpandable=""
	let g:NERDTreeDirArrowCollapsible=""
	let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol=''

" Floaterm
	let g:floaterm_keymap_toggle = '<F1>'
	let g:floaterm_keymap_next   = '<F2>'
	let g:floaterm_keymap_prev   = '<F3>'
	let g:floaterm_keymap_new    = '<F4>'
	let g:floaterm_gitcommit='floaterm'
	let g:floaterm_autoinsert=1
	let g:floaterm_width=0.8
	let g:floaterm_height=0.8
	let g:floaterm_wintitle=0
	let g:floaterm_autoclose=1

" Remapping
	" Leader shortcuts
	let mapleader =" "
	nnoremap <leader>ff :FZF<CR>
	nnoremap <leader>fg :Rg<CR>
	nnoremap <leader>tn :tabnext<CR>
	nnoremap <leader>tp :tabprev<CR>
	nnoremap <leader>bn :bnext<CR>
	nnoremap <leader>bp :bprev<CR>
	nnoremap <leader>ll :set nu!<CR>
	nnoremap <leader>nn :NERDTreeToggle<CR>
	" Other
	nnoremap <C-H> <C-W><C-H>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-J> <C-W><C-J>
	nnoremap // :noh <CR>

call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', { 'do' : { -> coc#util#install() } }
	Plug 'glacambre/nvim-lsp'
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'junegunn/vim-easy-align'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'jiangmiao/auto-pairs'
	Plug 'scrooloose/nerdcommenter'
	Plug 'vim-syntastic/syntastic'
	Plug 'airblade/vim-gitgutter'
	Plug 'arcticicestudio/nord-vim'
	Plug 'drewtempelmeyer/palenight.vim' " colorscheme
	Plug 'voldikss/vim-floaterm'
	Plug 'sakshamgupta05/vim-todo-highlight'
	Plug 'mhinz/vim-startify'
	Plug 'morhetz/gruvbox'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
	Plug 'davidhalter/jedi-vim'
	Plug 'JuliaEditorSupport/julia-vim'
	Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
	Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'hoob3rt/lualine.nvim'
	Plug 'tommcdo/vim-exchange'

call plug#end()

let g:default_julia_version = '1.0'

let g:gitgutter_max_signs = -1
let g:gitgutter_grep=''

lua << EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "cpp", "java", "javascript", "python" },
	highlight = {
	enable = true,
	additional_vim_regex_highlighting = true,
	},
}
EOF

" language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
\       server.runlinter = true;
\       run(server);
\   ']
\ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Colorscheme
colorscheme palenight

" Coc config
source $HOME/.config/nvim/plug-config/coc-config.vim

" Lualine
lua require('lualine-config')
