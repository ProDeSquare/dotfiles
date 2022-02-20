-- leader key
vim.g.mapleader = " "

-- plugins
require("user/plugins")

-- options
vim.opt.cursorline = true
vim.opt.backup = false
vim.opt.cmdheight = 2
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.numberwidth = 6
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.fileencoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.statusline = " %f%=%y %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}] %l,%c %p%% "

-- keymaps
local keymap = function(mode, key, result)
    vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        { noremap = true, silent = true }
    )
end

keymap("n", "<leader>w", ":w!<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<Tab>", ">>_", opts)
keymap("n", "<S-Tab>", "<<_", opts)

keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "p", '"_dP', opts)

--[[
-- Plug Config
--]]

-- treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = { enable = true, additional_vim_regex_highlighting = true },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = { enable = true, enable_autocmd = false },
})

-- comments
require("Comment").setup()

-- nvim tree
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    view = {
        mappings = {
            list = {
                { key = { "l", "<CR>", "o" }, action = "edit" },
                { key = "h", action = "close_node" },
                { key = "v", action = "vsplit" },
            },
        },
    },
})

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- autopairs
require("nvim-autopairs").setup{}

-- true zen
require("true-zen").setup()

keymap("n", "<leader>f", ":TZAtaraxis l20 r20 t3 b3<CR>", opts)
