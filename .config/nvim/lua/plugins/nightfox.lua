return { 
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      options = {
        styles = {               -- Style to be applied to different syntax groups
          comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          keywords = "bold",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "bold",
          variables = "NONE",
        },
      },
    })
  end,


} 

