-- Start configuring Lazy Package manager
-- Call up with :Lazy
-- Add new packages as tables to the setup() function below
--
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({

	-- Telescope of course
	{
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.8',
	lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        require('telescope').setup{
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            },
            extensions = {
                fzf = {}
            }
        }

        require('telescope').load_extension('fzf')

    end
    },

    -- kanagawa color scheme
    {
	'rebelot/kanagawa.nvim', 
	priority = 1000,
	lazy = false
    },

    -- treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    -- vim fugitive for Git 
    {
	'tpope/vim-fugitive',
	lazy = false
    }, 

	--- Uncomment these if you want to manage LSP servers from neovim
	-- {'williamboman/mason.nvim'},
	-- {'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'}, 


	{'ThePrimeagen/harpoon'}, 
    
    {
        'vimwiki/vimwiki',
        init = function()
        vim.g.vimwiki_list = {
            {
                path = '/Users/kmcbride/wiki',
                syntax = 'markdown',
                ext = '.md',
            },
            {
                path = '/Users/kmcbride/wiki/projects',
                name = 'projects',
                syntax = 'markdown',
                ext = '.md',
            },
            {
                path = '/Users/kmcbride/wiki/area',
                name = 'area',
                syntax = 'markdown',
                ext = '.md',
            },
            {
                path = '/Users/kmcbride/wiki/res',
                name = 'res',
                syntax = 'markdown',
                ext = '.md',
            },
            {
                path = '/Users/kmcbride/wiki/archive',
                name = 'archive',
                syntax = 'markdown',
                ext = '.md',
            },
        }
    end
    },

    {'voldikss/vim-floaterm'},
    {'nvim-lualine/lualine.nvim'},

    --- Oil for better folder editing / filesystem editing
    {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
   dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}

    })

