require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
map("n", "<leader>o",
  function()
    if vim.bo.filetype == "NvimTree" or vim.bo.filetype == "qf" then
      vim.cmd.wincmd "p"
    else
      vim.cmd.NvimTreeFocus()
    end
  end
, { desc = "Toggle Explorer Focus" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP references" })
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP definitions" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
