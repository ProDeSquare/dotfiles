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
