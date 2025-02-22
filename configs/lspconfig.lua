local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "ts_ls", "templ", "gopls", "intelephense", "pylsp", "tailwindcss", "zls" }

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "html" then
    config.filetypes = { "html", "templ" }
  end

  lspconfig[lsp].setup(config)
end
