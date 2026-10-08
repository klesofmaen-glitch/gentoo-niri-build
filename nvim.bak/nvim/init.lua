-- Основные настройки
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.mouse = 'a'
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

-- Установка менеджера плагинов Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- Плагины
require("lazy").setup({
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 }, -- Тема
  { "nvim-tree/nvim-web-devicons", lazy = false },            -- Иконки
  { "nvim-lualine/lualine.nvim", config = function() require('lualine').setup { options = { theme = 'tokyonight' } } end },
  { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" }, 
    config = function() vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>') end },
  { "akinsho/bufferline.nvim", version = "*", config = function() 
    require("bufferline").setup{} 
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
  end },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
      require("nvim-treesitter.configs").setup({ ensure_installed = { "lua", "javascript", "python" }, highlight = { enable = true } })
    end },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }, 
    config = function() 
      local b = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', b.find_files, {})
      vim.keymap.set('n', '<leader>fg', b.live_grep, {})
    end }
})

-- Цвета
vim.cmd[[colorscheme tokyonight]]
local custom_bg = "#151b26"
local groups = { "Normal", "NormalFloat", "NormalNC", "NeoTreeNormal", "NeoTreeNormalNC", "SignColumn", "StatusLine" }
for _, g in ipairs(groups) do vim.api.nvim_set_hl(0, g, { bg = custom_bg }) end
