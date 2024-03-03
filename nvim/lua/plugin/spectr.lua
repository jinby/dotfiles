
return {
    'nvim-pack/nvim-spectre',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require('spectre').setup({
            mapping = {
                ['send_to_qf'] = {
                        map = "q",
                        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                        desc = "send all items to quickfix"
                },
                ['run_current_replace'] = {
                    map = "r",
                    cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
                    desc = "replace current line"
                },
                ['run_replace'] = {
                    map = "R",
                    cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                    desc = "replace all"
                },
            }
        })
    end
}
