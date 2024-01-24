vim.wo.wrap = false
vim.wo.relativenumber = true
vim.filetype.add { extension = { templ = "templ" } }

require "custom.autocmd"
