-- packer
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {}
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "numToStr/Comment.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "windwp/nvim-autopairs"
    use "folke/zen-mode.nvim"

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    use "nvimtools/none-ls.nvim"
    use "nvimtools/none-ls-extras.nvim"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use {
        "L3MON4D3/LuaSnip",
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        }
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {{ "nvim-lua/plenary.nvim" }}
    }
    use "nvim-telescope/telescope-ui-select.nvim"
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }

    use "MarineDark/marine-dark.nvim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
