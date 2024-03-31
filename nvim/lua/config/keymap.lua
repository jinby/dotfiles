
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('i', 'jk', '<ESC>', opts)
map('n', 'K', '5k', opts)
map('n', 'J', '5j', opts)
map('n', 'tt', ':Neotree toggle<CR>', opts)

map('n', '<C-h>', '<ESC><C-w>h', opts)
map('n', '<C-j>', '<ESC><C-w>j', opts)
map('n', '<C-k>', '<ESC><C-w>k', opts)
map('n', '<C-l>', '<ESC><C-w>l', opts)

map('i', '<C-h>', '<ESC>i', opts)
map('i', '<C-j>', '<ESC>ja', opts)
map('i', '<C-k>', '<ESC>ka', opts)
map('i', '<C-l>', '<ESC>la', opts)

map('n', '<A-C-j>', ':tabp<CR>', opts)
map('n', '<A-C-k>', ':tabp<CR>', opts)
-- Move to previous/next
map('n', '<A-j>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-k>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 2<CR>', opts)
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


-- switch between source and header
map('n', '<A-o>', '<Cmd>SwitchSourceAndHeader<CR>', opts)
-- generate the function definition or static variable definition in source
map('n', '<leader>cf', '<Cmd>ImplementInSource<CR>', opts)
-- generate the function definition or static variable definition in source in visual mode
map('v', '<leader>cf', '<Cmd>lua require("cppassist").ImplementInSourceInVisualMode<CR>', opts)
-- generate the function definition or static variable definition in header
map('n', '<leader>cv', '<Cmd>ImplementOutOfClass<CR>', opts)
-- goto the header file
map('n', '<leader>gh', '<Cmd>GotoHeaderFile<CR>', opts)



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


vim.keymap.set('n', '<leader>ss', '<cmd>lua require("spectre").open()<CR>', {
    desc = "Open Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})


vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

vim.api.nvim_set_keymap('n', '<leader>if', [[<cmd>lua require("cpptool").create_func_def()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<A-Up>', [[<cmd>lua require('cpptool').move_lines("up")<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<A-Down>', [[<cmd>lua require('cpptool').move_lines("down")<CR>]], {noremap = true, silent = true})


require("luasnip.loaders.from_vscode").lazy_load()

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
