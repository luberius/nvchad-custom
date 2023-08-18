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
      desc = "Toggle Explorer Focus",
    }
  }
}
return M
