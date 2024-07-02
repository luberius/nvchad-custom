---@type ChadrcConfig
local M = {}
M.ui = { theme = "everforest_light", theme_toggle = { "monochrome", "everforest_light" }, transparency = true }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
