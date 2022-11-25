set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" set a map leader for more key combos
let mapleader = ' '


set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
" set colorcolumn=80
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set cmdheight=2
set laststatus=2
set backspace=indent,eol,start
set ignorecase
set magic
set autoindent " automatically set indent of new line


" Install a plugin manager vim-plug

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator' 
Plug 'nvie/vim-flake8'
Plug 'psf/black'
Plug 'vim-syntastic/syntastic'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

colorscheme gruvbox


" More useful mappings to make my life easier
" Reload the vimrc
nnoremap <leader>vr :source ~/.config/nvim/init.vim<CR> 

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :wincmd q<CR>
nnoremap <leader>f :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> vv <C-w>v
nnoremap <leader>b :buffers<CR>
nnoremap <leader>pi :PlugInstall<CR>
"
"Now for Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files theme=dropdown<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>f/<cmd>Telescope current_buffer_fuzzy_find<cr>
" When in Insert Mode, be able to use C-l to jump one character
" to the right and skip past a closing " or ) or } 
inoremap <C-L> <C-\><C-O><Esc><Right>

" Add the open/close curly braces and start typing in the middle line. Yes!
inoremap <C-F> {<CR><CR>}<UP><TAB>

 " Setup indentation to be happy with Python files
 "
 au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Set Flake8 to F3
autocmd FileType python map <buffer> <F3> :call flake8#Flake8()<CR> 

" Automatically run Black on python files on save
autocmd BufWritePre *.py execute ':Black'

"Load up my LSP client/server information
lua require('mylspconfig') 

"Load up my  cool GoAutoRun command
lua require('autosave') 




