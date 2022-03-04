-- leader key
vim.g.mapleader = " "

-- options
vim.opt.title = true
vim.opt.exrc = true
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
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.statusline = " %f%=%y %{&fileencoding}[%{&fileformat}] %l,%c %p%% "

-- keymaps
local keymap = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
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

keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<CR>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

keymap("n", "<leader>f", ":TZAtaraxis l30 r30 t5 b5<CR>", opts)

-- plugins
require("user/plugins")

--[[
-- Plug Config
--]]

-- telescope
local status_ok, telescope = pcall(require, "telescope")
if status_ok then
    telescope.setup {}
end

-- treesitter
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if status_ok then
    treesitter.setup {
        ensure_installed = "maintained",
        highlight = { enable = true, additional_vim_regex_highlighting = true },
        indent = { enable = true, disable = { "yaml" } },
        context_commentstring = { enable = true, enable_autocmd = false },
    }
end

-- comments
local status_ok, comment = pcall(require, "Comment")
if status_ok then
    comment.setup {}
end

-- nvim tree
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if status_ok then
    nvim_tree.setup {
        view = {
            mappings = {
                list = {
                    { key = { "l", "<CR>", "o" }, action = "edit" },
                    { key = "h", action = "close_node" },
                    { key = "v", action = "vsplit" },
                },
            },
        },
    }
end

-- autopairs
local status_ok, autopairs = pcall(require, "nvim-autopairs")
if status_ok then
    autopairs.setup {}
end

-- zen mode
local status_ok, true_zen = pcall(require, "true-zen")
if status_ok then
    true_zen.setup {
        ui = {
            bottom = { cursorline = false }
        }
    }
end

-- completion
local status_ok, cmp = pcall(require, "cmp")
if status_ok then
    local status_luasnip, luasnip = pcall(require, "luasnip")
    if status_luasnip then
        cmp.setup {
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                ["<C-e>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ["<CR>"] = cmp.mapping.confirm { select = true },
            },
        }
    end
end
