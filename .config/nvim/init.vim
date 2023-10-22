set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" set a map leader for more key combos
let mapleader = ' '
let maplocalleader=","

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
set laststatus=3
set winbar=%=%t\ %m\ [b%n]
set backspace=indent,eol,start
set ignorecase
set magic
set autoindent " automatically set indent of new line
set conceallevel=2 " Hide concealed items
"set concealcursor=n " Do not expand concealed values in normal mode
" Folding with treesitter
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"set nofoldenable                     " Disable folding at startup.


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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-neorg/neorg' | Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'rebelot/kanagawa.nvim'
Plug 'vimwiki/vimwiki'
Plug 'voldikss/vim-floaterm'
call plug#end()

colorscheme kanagawa
"colorscheme gruvbox


" More useful mappings to make my life easier
" Reload the vimrc
nnoremap <leader>vr :source ~/.config/nvim/init.vim<CR> 
nnoremap <leader>evr :e ~/.config/nvim/init.vim<CR> 

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
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" Recenter after moving up and down with zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
"
"Now for Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files theme=dropdown<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>f/<cmd>Telescope current_buffer_fuzzy_find<cr>
" Neorg bindings
" takes you to the default workspace
nnoremap <leader>nw <cmd>Neorg workspace<cr> 
nnoremap <leader>ni <cmd>Neorg index<cr> 
nnoremap <leader>nc :e ~/.config/nvim/lua/neorgconfig.lua<CR> 
inoremap <localleader>\ <M-CR>
nnoremap <leader>np <cmd>Neorg workspace proj<cr>
nnoremap <leader>nr <cmd>Neorg workspace res<cr>
nnoremap <leader>na <cmd>Neorg workspace area<cr>
nnoremap <leader>nm <cmd>Neorg inject-metadata<cr>gg
nnoremap <leader>ng <cmd>Neorg generate-workspace-summary<cr>
" 
" vimwiki bindings
nnoremap <leader>wva :e ~/wiki/area/index.md<CR>
nnoremap <leader>wvp :e ~/wiki/proj/index.md<CR>
nnoremap <leader>wvr :e ~/wiki/res/index.md<CR>
"nnoremap <leader>wvt :VimwikiTable 

" When in Insert Mode, be able to use C-l to jump one character
" to the right and skip past a closing " or ) or } 
inoremap <C-L> <C-\><C-O><Esc><Right>

" Add the open/close curly braces and start typing in the middle line. Yes!
inoremap <C-F> {<CR><CR>}<UP><TAB>

" These are for the terminal
tnoremap ˙ <C-\><C-N><C-w>h
tnoremap ∆ <C-\><C-N><C-w>j
tnoremap ˚ <C-\><C-N><C-w>k
tnoremap ¬ <C-\><C-N><C-w>l


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

"Load up my  cool AutoRun command
lua require('autosave') 

"Load up my tree-sitter config
lua require('treesitterconfig') 

" Load up my vim-neorg config settings 
lua require('neorgconfig')

" At the bottom of your init.vim, keep all configs on one line
lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}  

" Set some highlighting to get it working with Neorg
hi TSUnderline gui=underline
hi TSStrong gui=bold
hi TSEmphasis gui=italic

" Configure vimwiki
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': 'md'},
            \ {'path': '~/wiki/res',  'name': 'res', 'syntax': 'markdown', 'ext': 'md'},
            \ {'path': '~/wiki/proj', 'name': 'proj',  'syntax': 'markdown', 'ext': 'md'},
            \ {'path': '~/wiki/area', 'name': 'area',  'syntax': 'markdown', 'ext': 'md'},
            \ {'path': '~/wiki/arch', 'name': 'arch',  'syntax': 'markdown', 'ext': 'md'}]

" get the .md extension added to the links to wiki files
let g:vimwiki_markdown_link_ext = 1

let g:floaterm_keymap_toggle = '<F12>'

