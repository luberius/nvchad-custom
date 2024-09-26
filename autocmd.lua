local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})

-- Get npm global root directory
local npm_root = vim.fn.system("npm root -g"):gsub("\n", "")
local prettier_php_plugin = npm_root .. "/@prettier/plugin-php/src/index.mjs"

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
  local html_cmd = {
    "prettier",
    "--write",
    "--parser=html",
    filename,
  }

  local cmd = {
    "prettier",
    "--write",
    "--parser=php",
    "--plugin=" .. prettier_php_plugin,
    filename,
  }

  vim.fn.jobstart(html_cmd, {
    on_exit = function()
      vim.fn.jobstart(cmd, {
        on_exit = function()
          if vim.api.nvim_get_current_buf() == bufnr then
            vim.cmd "e!"
          end
        end,
      })
    end,
  })
end

-- Combined format function
local function format_file()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.bo.filetype
  if filetype == "templ" then
    format_templ(bufnr, filename)
  elseif filetype == "php" then
    format_php(bufnr, filename)
  else
    vim.lsp.buf.format()
  end
end

-- Single autocommand for both Templ and PHP files
autocmd("BufWritePre", {
  group = "__formatter__",
  pattern = { "*.templ", "*.php" },
  callback = format_file,
})
