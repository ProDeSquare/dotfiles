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
