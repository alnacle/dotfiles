return {
  'romgrk/barbar.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  init = function() 
    vim.g.barbar_auto_setup = false
  end,
  opts =  {
    animation = false,
    tabpages = true,
    focus_on_close = 'left',
  }
}
