-- https://github.com/nvim-lualine/lualine.nvim
require('lualine').setup {
 sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = { 'filename'},
    lualine_x = {'filetype'}, 
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },   
      winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    }
}
