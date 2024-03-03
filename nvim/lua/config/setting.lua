local o = vim.opt
vim.notify = require("notify")
--line number
o.number = true

-- tab
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.cursorline = true
o.termguicolors = true

o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.termguicolors = true

-- " Example binding -- only works in a c/cpp file
-- autocmd! Filetype c,cpp map<buffer> <C-e> :Ouroboros<CR>
vim.cmd[[colorscheme tokyonight]]
