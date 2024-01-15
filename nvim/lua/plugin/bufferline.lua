return {
    {
        "akinsho/bufferline.nvim",
        dependencies= { "moll/vim-bbye" },
        config = function()
            require("bufferline").setup({
                options = {
                    -- 关闭 Tab 的命令
                    close_command = "Bdelete! %d",
                    right_mouse_command = "Bdelete! %d",
                }
            })
        end
    }
}
