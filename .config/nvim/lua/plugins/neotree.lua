return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "rachartier/tiny-devicons-auto-colors.nvim",
    "MunifTanjim/nui.nvim",
  },
  source_selector = {
    winbar = false,
    statusline = false,
  },
  opts = {
    window = {
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
        ["<Esc>"] = "close_window",
      },
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
    },
  },
  cmd = "Neotree",
}
