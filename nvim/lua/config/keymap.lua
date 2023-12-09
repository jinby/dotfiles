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
	{ from = "<A-j>", to = ":BufferLineCyclePrev<CR>", mode=""},
	{ from = "<A-k>", to = ":BufferLineCycleNext<CR>", mode=""},
	{ from = "<A-h>", to = ":tabp<CR>", mode=""},
	{ from = "<A-l>", to = ":tabn<CR>", mode=""},
	{ from = "tt", to = ":NvimTreeToggle<CR>", mode=""},

}

local option = {
	noremap = true,
	silent = true
}

for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, mapping.option or option)
end
