require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
map("n", "<leader>o", function()
  if vim.bo.filetype == "NvimTree" or vim.bo.filetype == "qf" then
    vim.cmd.wincmd "p"
  else
    vim.cmd.NvimTreeFocus()
  end
end, { desc = "Toggle Explorer Focus" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP references" })
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP definitions" })
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP floating diagnostic" })
map("n", "<leader>rh", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("n", "<leader>ph", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
