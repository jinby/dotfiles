return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter").setup(
            {
                ensure_installed = {"html", "css", "vim", "lua", "javascript", "typescript", "tsx", "cpp", "go"},
                highlight= {
                    enable = true,
                }
            }
            )
        end
    }
}
