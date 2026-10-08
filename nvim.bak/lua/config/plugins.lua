local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
{
  "folke/tokyonight.nvim",
  config = function()
    vim.cmd("colorscheme tokyonight-night")
  end
},
{
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-tree").setup()
  end
},
{
  "nvim-telescope/telescope.nvim",
  dependencies = "nvim-lua/plenary.nvim"
},
{
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({ options = { theme = "tokyonight" } })
  end
},
"neovim/nvim-lspconfig",
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip"
  }
},
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate"
}
})
