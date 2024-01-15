return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- require("lsp.setup")
        require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
        })
        require("mason-lspconfig").setup({
            ensure_installed={ 
                'sqlls',
                'typst_lsp',
                'rust_analyzer',
                'eslint',
                "html",
                "lua_ls",
                "clangd",
                "cmake",
            }
        })
    end
  },
}
