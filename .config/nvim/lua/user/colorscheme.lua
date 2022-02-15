-- setting the colorscheme
vim.cmd [[
try
    colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]

-- -- setting background transparency
-- require("transparent").setup({
--   enable = true, -- boolean: enable transparent
-- })
