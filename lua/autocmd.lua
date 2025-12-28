local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})

-- templ format
local function format_templ(bufnr, filename)
  local cmd = "templ fmt " .. vim.fn.shellescape(filename)
  vim.fn.jobstart(cmd, {
    on_exit = function()
      if vim.api.nvim_get_current_buf() == bufnr then
        vim.cmd "e!"
      end
    end,
  })
end

local function format_php(bufnr, filename)
  local config_dir = vim.fn.stdpath "config"

  local cmd = {
    "php",
    config_dir .. "/lua/custom/bin/phpcbf.phar",
    "--standard=PSR12",
    filename,
  }

  vim.notify(table.concat(cmd, " "))

  vim.fn.jobstart(cmd, {
    on_exit = function()
      if vim.api.nvim_get_current_buf() == bufnr then
        vim.cmd "e!"
      end
    end,
  })
end

-- Combined format function
local function format_java()
  require("jdtls").organize_imports()
  vim.lsp.buf.format { async = false }
end

local function format_file()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.bo.filetype
  if filetype == "templ" then
    format_templ(bufnr, filename)
  elseif filetype == "php" then
    format_php(bufnr, filename)
  elseif filetype == "java" then
    format_java()
  end
end

autocmd("BufWritePre", {
  group = "__formatter__",
  pattern = { "*.templ", "*.php", "*.java" },
  callback = format_file,
})
