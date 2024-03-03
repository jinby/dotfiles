return {
    {
        -- name = 'myvimplugin',
        dir = '~/myPlugin.nvim',
        dev = true,
        config = function()
            require("myPlugin").setup()
        end,
    }
}
