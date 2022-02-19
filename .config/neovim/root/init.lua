-- options
local options = {
	ruler = true,
	number = true,
	relativenumber = true,
	hlsearch = false,
	hidden = true,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,
	wrap = false,
	backup = false,
	incsearch = false,
	scrolloff = 8,
	clipboard = "unnamedplus",
	mouse = "a",
	splitbelow = true,
	splitright = true,
	background = dark,
	numberwidth = 6,
	cmdheight = 2,
	cursorline = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>w", ":w!<CR>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "p", '"_dP', opts)

