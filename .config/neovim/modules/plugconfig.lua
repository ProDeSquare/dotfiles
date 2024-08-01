-- telescope
local status_ok, telescope = pcall(require, "telescope")
if status_ok then
	telescope.setup({
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	})

	require("telescope").load_extension("ui-select")
end

-- treesitter
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if status_ok then
	treesitter.setup({
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	})
end

-- comments
local status_ok, comment = pcall(require, "Comment")
if status_ok then
	comment.setup({})
end

-- autopairs
local status_ok, autopairs = pcall(require, "nvim-autopairs")
if status_ok then
	autopairs.setup({})
end

-- zen mode
local status_ok, true_zen = pcall(require, "true-zen")
if status_ok then
	true_zen.setup({
		modes = {
			ataraxis = {
				callbacks = {
					open_pre = function()
						--
					end,
				},
			},
		},
	})
end

-- neotree
local status_ok, neotree = pcall(require, "neo-tree")
if status_ok then
	neotree.setup({
		close_if_last_window = true,
		window = {
			position = "right",
			width = 34,
			mappings = {
				["l"] = "open",
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_hidden = false,
			},
		},
	})
end

-- LSP Stuff with mason
local status_ok, mason = pcall(require, "mason")
if status_ok then
	mason.setup({})
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if status_ok then
	mason_lspconfig.setup({
		ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "clangd", "asm_lsp" },
	})
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if status_ok then
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
	})
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
	})
	lspconfig.tsserver.setup({
		capabilities = capabilities,
	})
	lspconfig.clangd.setup({
		capabilities = capabilities,
	})
	lspconfig.asm_lsp.setup({
		capabilities = capabilities,
	})

	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
end

-- null ls
local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.asmfmt,
			require("none-ls.diagnostics.eslint_d"),
		},
	})

	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end

-- completion
local status_ok, cmp = pcall(require, "cmp")
if status_ok then
	require("luasnip.loaders.from_vscode").lazy_load()
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
		}),
	})
end

-- colorscheme
local status_ok, marine_dark = pcall(require, "marine-dark")
if status_ok then
	marine_dark.setup({})
end

-- transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
