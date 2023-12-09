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
                'bufls',
                'svls',
                'rust_analyzer',
                'eslint',
                "html",
                "js_ls",
                "lua_ls",
                "clangd",
                "cmake",
            }
        })
    end
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup()
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
  }
}
