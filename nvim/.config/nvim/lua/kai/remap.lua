vim.g.mapleader = " "
vim.keymap.set("n", "<leader>dir", vim.cmd.Oil)

vim.keymap.set("n",  "<leader>vr", ":source ~/.config/nvim/init.lua<CR>") 
vim.keymap.set("n",  "<leader>evr", ":e ~/.config/nvim/init.lua<CR>") 

vim.keymap.set("n",  "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n",  "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n",  "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n",  "<leader>l", ":wincmd l<CR>")
vim.keymap.set("n",  "<leader>q", ":wincmd q<CR>")
vim.keymap.set("n",  "<leader>f", ":wincmd v<bar> :Oil <bar> :vertical resize 30<CR>")
vim.keymap.set("n",  "<leader>=", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n",  "<leader>-", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n",  "vv", "<C-w>v", { silent = true })
vim.keymap.set("n",  "<leader>rn", "lua vim.lsp.buf.rename()<CR>")
-- Recenter after moving up and down with zz
vim.keymap.set("n",  "<C-d>", " <C-d>zz")
vim.keymap.set("n",  "<C-u>", " <C-u>zz")
vim.keymap.set("n",  "n" , "nzzzv")
vim.keymap.set("n",  "N" , "Nzzzv")
--
-- create a new terminal buffer in a vertical split
vim.keymap.set("n",  "<leader>ter" , ":vsplit term://fish<CR>i")

-- When in Insert Mode, be able to use C-l to jump one character
-- to the right and skip past a closing " or ) or } 
vim.keymap.set("i",  "<C-L>", "<C-\\><C-O><Esc><Right>")

-- Add the open/close curly braces and start typing in the middle line. Yes!
vim.keymap.set("i",  "<C-F>", " {<CR><CR>}<UP><TAB>")


