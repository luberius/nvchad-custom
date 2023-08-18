local plugins = {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        {
          'williamboman/mason-lspconfig.nvim',
          opts = {
            ensure_installed = { 'tsserver' }
          }
        },
        {
          "jose-elias-alvarez/null-ls.nvim",
           config = function()
             require "custom.configs.null-ls"
           end,
        }
      }
    },
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
  }
}
return plugins
