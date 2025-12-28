return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "gopls", "templ", "html", "biome", "ts_ls", "jdtls" },
        },
      },
      {
        "mhartington/formatter.nvim",
        config = function()
          require "configs.formatter"
        end,
      },
    },
  },
  config = function()
    require "configs.lspconfig"
  end,
}
