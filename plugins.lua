local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        {
          "williamboman/mason-lspconfig.nvim",
          opts = {
            ensure_installed = { "tsserver", "gopls", "templ", "html" },
          },
        },
        {
          "mhartington/formatter.nvim",
          config = function()
            require "custom.configs.formatter"
          end,
        },
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },
  {
    "ziglang/zig.vim",
  },
}
return plugins
