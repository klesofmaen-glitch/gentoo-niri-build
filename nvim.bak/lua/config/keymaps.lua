vim.g.mapleader = " "
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)
