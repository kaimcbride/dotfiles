vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.guicursor = ""

vim.opt.hlsearch = false 
vim.opt.incsearch = true
-- vim.opt.hidden = true
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50
-- vim.opt.signcolumn = "yes"
vim.opt.completeopt = {"menuone" , "noinsert" , "noselect"}
vim.opt.ignorecase = true
vim.opt.autoindent = true

-- send to the clipboard
vim.opt.clipboard:append { "unnamedplus" }

-- no statusbar separators
-- vim.opt.laststatus = 3

vim.opt.spelllang = "en_us"
vim.opt.spell = true

