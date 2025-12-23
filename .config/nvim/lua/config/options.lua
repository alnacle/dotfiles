local o = vim.opt

-- editor
o.ignorecase = true
o.breakindent = true

-- disable some stuff
o.backup = false
o.swapfile = false
o.modeline = false
o.writebackup = false

-- General Editing Stuff
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.copyindent = true
o.smartindent = false
o.wrap = false 
o.linebreak=true
o.textwidth = 0
o.hidden = true
o.ttyfast = true
o.lazyredraw = true
o.gdefault = true
o.autochdir = false 
o.smartcase = true
o.modifiable = true

-- Encoding
o.encoding = utf8
o.fileencoding=utf8
o.bomb = false

-- Searching
o.hlsearch = true 
o.incsearch = true
o.showmatch = true

-- Look & Feel Options
o.syntax = "on"
o.termguicolors = true
o.background = "dark" 
o.sidescrolloff = 8 
o.scrolloff = 8 
o.numberwidth = 4
o.equalalways = true

o.cursorline = true
o.title = true
o.ruler = true
o.number  = true
o.showcmd = true
o.showmode = true
o.laststatus = 2
o.visualbell = false 
o.signcolumn = 'yes'
o.updatetime = 250
o.clipboard = "unnamedplus"
o.conceallevel = 0  -- so that `` is visible in markdown files
o.cmdheight = 1 -- more space in the neovim command line for displaying messages

o.foldenable = false
o.viewoptions=folds,options,cursor,unix,slash

-- Window splitting
o.splitbelow = true
o.splitright = true

-- Autocomplete
o.wildmenu = true
o.wildignorecase = true
o.wildmode = "longest,full,full"
o.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"

-- Invisible characters
o.list = true 
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions
o.inccommand = 'split'

-- Persistent undos
o.undofile = true

o.virtualedit=onemore
o.history=1000

-- allow gf to search files in subfolders
o.path:append("**")

-- avoid split file name with dots
o.isfname:remove("=") 

