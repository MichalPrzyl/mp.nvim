return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")  
      lspconfig.pyright.setup {}
    end,

    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    }
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {'williamboman/mason-lspconfig.nvim',

    config = function()
      local lsp_zero = require('lsp-zero')
      handlers = {
        lsp_zero.default_setup,
      }
    end
  },
  
  -- LSP Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    }
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {'L3MON4D3/LuaSnip'}
    },
  },
}
