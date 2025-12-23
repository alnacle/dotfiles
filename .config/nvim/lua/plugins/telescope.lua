return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    { "nvim-lua/plenary.nvim" },
  },
  cmd = "Telescope",
  opts = {
    pickers = {
      find_files = {
        theme = "ivy",
        previewer = true,
      },
      live_grep = {
        theme = "ivy",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
    defaults = {
      file_ignore_patterns = {
        "node_modules/",
        ".yarn/",
        ".git/",
        ".idea/",
        "%.jpg",
        "%.png",
        "%.gif",
        "%.webp",
        "%.svg",
        "%.pdf",
        "%.pyc",
        "%.zip",
      },
    },
  },
}
