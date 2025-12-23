require("config")
require("config.lazy")

vim.cmd([[colorscheme sonokai]])

require("barbar").setup()
require("lualine").setup()
require("gitsigns").setup()

require("mason").setup()
