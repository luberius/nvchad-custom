local M = {}
M.luberius = {
  n = {
    ["<leader>o"] = {
      function()
        if vim.bo.filetype == "NvimTree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.NvimTreeFocus()
        end
      end,
      "Toggle Explorer Focus"
    },
    ["gr"] = {
      function()
        require('telescope.builtin').lsp_references()
      end,
      "LSP references",
    },
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Open LazyGit" },
  },
}
return M
