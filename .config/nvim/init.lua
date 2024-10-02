require("config.leader")
require("config.commands")
require("config.options")
require("config.keymaps")
require("config.lazy")

vim.cmd[[colorscheme nightfox]]

require("barbar").setup()
require('lualine').setup()
require('gitsigns').setup()
