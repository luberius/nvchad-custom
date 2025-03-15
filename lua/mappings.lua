require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
map("n", "<leader>o",
  function()
    if vim.bo.filetype == "NvimTree" then
      vim.cmd.wincmd "p"
    else
      vim.cmd.NvimTreeFocus()
    end
  end
, { desc = "Toggle Explorer Focus" })
map("n", "gr",
  function()
    require("telescope.builtin").lsp_references()
  end
, { desc = "LSP references" })
map("n", "gd",
  function()
    require("telescope.builtin").lsp_definitions()
  end
, { desc = "LSP references" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
