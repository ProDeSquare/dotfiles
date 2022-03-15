-- leader key
vim.g.mapleader = " "

-- options
local options = {
    title = true,
    exrc = true,
    cursorline = true,
    backup = false,
    hlsearch = false,
    incsearch = true,
    mouse = "a",
    number = true,
    relativenumber = true,
    scrolloff = 8,
    sidescrolloff = 8,
    numberwidth = 6,
    wrap = false,
    swapfile = false,
    fileencoding = "utf-8",
    clipboard = "unnamedplus",
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    smartindent = true,
    splitright = true,
    splitbelow = true,
    completeopt = { "menuone", "noselect" },
    laststatus = 0,
    ruler = false,
    showmode = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- keymaps
local keymap = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

keymap("n", "<leader>w", ":w!<CR>")

keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<Tab>", ">>_")
keymap("n", "<S-Tab>", "<<_")

keymap("n", "<S-h>", ":bnext<CR>")
keymap("n", "<S-l>", ":bprevious<CR>")

keymap("n", "S", ":%s//g<Left><Left>")

keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>")
keymap("n", "<C-t>", "<cmd>Telescope live_grep<CR>")

keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

keymap("n", "<leader>f", ":TZAtaraxis l15 r15<CR>")

keymap("v", "<Tab>", ">gv")
keymap("v", "<S-Tab>", "<gv")
keymap("v", "p", '"_dP')

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- autocmds
vim.cmd[[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
    augroup END

    autocmd BufWritePre * let currPos = getpos(".")
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre *.[ch] %s/\%$/\r/e
    autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

    command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
]]

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
