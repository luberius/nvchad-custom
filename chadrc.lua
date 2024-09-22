---@type ChadrcConfig
local M = {}
M.ui = { theme = "monochrome", theme_toggle = { "gruvbox_light", "monochrome" }, transparency = true }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
