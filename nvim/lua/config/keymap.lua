vim.g.mapleader = " "
vim.g.maplocalleader = " "

local mappings = {
	{ from = "jk", to = "<ESC>", mode = "i" },
	{ from = "K", to = "5k", mode=""},
	{ from = "J", to = "5j", mode=""},
	{ from = "tt", to = ":NvimTreeToggle<CR>", mode=""},
	{ from = "<C-h>", to = "<ESC><C-w>h", mode=""},
	{ from = "<C-j>", to = "<ESC><C-w>j", mode=""},
	{ from = "<C-k>", to = "<ESC><C-w>k", mode=""},
	{ from = "<C-l>", to = "<ESC><C-w>l", mode=""},
	{ from = "<A-h>", to = ":BufferLineCyclePrev<CR>", mode=""},
	{ from = "<A-l>", to = ":BufferLineCycleNext<CR>", mode=""},
	{ from = "<A-j>", to = ":tabp<CR>", mode=""},
	{ from = "<A-k>", to = ":tabn<CR>", mode=""},
	{ from = "<A-k>", to = ":FSHere<CR>", mode=""},
}

local option = {
	noremap = true,
	silent = true
}

for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, mapping.option or option)
end



local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
