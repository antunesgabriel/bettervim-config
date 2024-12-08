local plugins = require("better-vim.config.plugins")
local lsps = require("better-vim.config.lsps")
local formatters = require("better-vim.config.formatters")
local mappings = require("better-vim.config.mappings")
local noise = require("better-vim.config.noise")
local nvim_tree = require("better-vim.config.nvim_tree")
local theme = require("better-vim.config.theme")
local flags = require("better-vim.config.flags")

return {
  plugins = plugins,
  unload_plugins = {},
  lsps = lsps,
  formatters = formatters,
  treesitter = {},
  gitsigns = {},
  noice = {},
  theme = theme,
  flags = flags,
  mappings = mappings,
  lualine = {
    options = {},
    sections = {},
  },
  telescope = {},
  nvim_tree = nvim_tree,
  noise = noise,
  whichkey = {},
  dashboard = {
    header = {},
  },
  hooks = {
    after_setup = function()
      require("better-vim.config.hooks")
    end,
  },
}
