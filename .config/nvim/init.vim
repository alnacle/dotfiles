
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" UI
Plug 'scrooloose/nerdtree'             " file browser
Plug 'ap/vim-buftabline'               " tabline buffer list
Plug 'itchyny/lightline.vim'           " light statusline
Plug 'qpkorr/vim-bufkill'              " delete a buffer without closing window 
Plug 'morhetz/gruvbox'                 " gruvbox theme
Plug 'Yggdroot/indentLine'             " vertical lines at indentation level

" General coding plugins
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                " fuzzy search through the files

" Git
Plug 'airblade/vim-gitgutter'          " show git diff in the gutter
Plug 'tpope/vim-fugitive'              " so awesome, it should be illegal

" Web Development
Plug 'leafgarland/typescript-vim'       " Typescript syntax
Plug 'peitalin/vim-jsx-typescript'      " TSX support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

filetype plugin indent on

" Master key
let g:mapleader = ','

" disable some stuff
set nobackup
set noswapfile
set nomodeline
set nowritebackup

" General Editing Stuff
set tabstop=4       " Use 4 spaces ident style
set softtabstop=4   " How many columns uses when hitting Tab
set shiftwidth=4    " Reindenting to 4 spaces
set expandtab       " Produce the appropriate number of spaces
set autoindent      " Automatically set the indent of a new line
set copyindent      " Copy (exact) indention from the previous line.
set nosmartindent   " Does not the right thing
set nowrap          " Don't wrap text
set linebreak       " Wrap at word
set textwidth=0     " Don't automatically wrap lines.
set hidden          " Hide buffers instead of closing them
set ttyfast         " Improves redrawing for newer computers.
set lazyredraw      " Don't redraw during macros
set colorcolumn=+1  " Show the 81st column
set gdefault        " Use 'g' flag by default with :s/foo/bar/.
set noautochdir     " working directory same as current file
set smartcase       " case-insensitive if lowercase, otherwise case-sensitive

" Encoding
set encoding=utf8
set fileencoding=utf-8
set nobomb

" a showmatch will wait half a second or until a character is typed
set cpoptions-=m

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log

" Autocomplete commands
set wildmenu
set wildchar=<Tab>
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,*.pyc,*.aux,*.bbl,*.blg,.git,.svn,.hg
set wildignore+=*/build_/*,*/coverage/*,*/dist/*,*/public/*
set wildignore+=*.log,*.jpg,*.png,*.svg,*.pdf
set whichwrap=b,s,h,l,<,>,[,]

" Completion
set complete-=i,t
set completeopt=menu,menuone,preview,noselect,noinsert
set omnifunc=syntaxcomplete#Complete

" Searching
set hlsearch          " highlight search
set incsearch         " Incremental search, search as you type
set showmatch         " Highlights the matching braces,brackets,parens

" Look & Feel Options
syntax on             " Syntax highlighting
set termguicolors
set sidescrolloff=2   " scrollbars
set scrolloff=3       " when scrolling, keep cursor 3 lines away from screen border
set numberwidth=4     " whanges how wide the column containing line numbers will be.
set equalalways       " multiple windows, when created, are equal in size
set splitbelow        " make the new window appear below the current window
set splitright        " make the new window appear on the right
set cursorline        " cursor highlights
set title             " show title in console
set ruler             " show ruler
set number            " Show line numbers
set showcmd           " show current command on ruler
set showmode          " show current mode on ruler
set laststatus=2      " always show the status line
set novisualbell      " Turn off bell
set foldmethod=indent " fold group of lines with the same indent
set foldlevel=1       " fold one level
set updatetime=250    " Update sign column every quarter second
set background=dark
set mouse=
set t_ut=
set visualbell t_vb=
set clipboard+=unnamed "copy to the system clipboard

" Invisible characters
set listchars=trail:.,tab:>-,eol:$
set listchars+=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nolist

set backspace=indent,eol,start
set matchpairs+=<:>
set nofoldenable " Turn off folding

set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000

" Persistent undos
set undofile
set undodir=~/.vim/dirs/undos

if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
endif

" Some plugin seems to search for something at startup. Avoid it.
silent! nohlsearch
set guioptions=

" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1

" Coc 
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" NERDTree
let NERDTreeShowHidden   = 1  " Show hidden files
let g:NERDShutUp         = 1  " Silent mode
let g:NERDTreeMinimalUI  = 1  " Minimal UI
let g:NERDTreeIgnore     = ['\.pyc$', '\.pyo$', '\.o$', '\.so$']

" Color scheme
colorscheme gruvbox
if &diff
    colorscheme gruvbox
    set diffopt+=iwhite
endif

" Filetypes
au Filetype html setlocal ts=2 sts=2 sw=2 expandtab
au Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
au Filetype sh setlocal ts=2 sts=2 sw=2 noexpandtab
au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
au FileType make setlocal ts=2 sts=0 sw=8 noexpandtab
au FileType sh setl noexpandtab
au FileType vim setlocal ts=4 sts=4 sw=4 expandtab
au FileType python setlocal ts=4 sts=4 sw=4 expandtab
au FileType markdown setlocal spell spelllang=en conceallevel=0
au FileType gitcommit setlocal spell spelllang=en textwidth=80
au FileType json setlocal expandtab sw=2 sts=2 ts=2 foldmethod=syntax 
au FileType json syntax match Comment +\/\/.\+$+

au BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
au BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" (re)mapping keys
nmap <tab>   :bn<cr>
nmap <s-tab> :bp<cr>

nmap <leader>c  :<esc><c-w>q<cr>     " delete split
nmap <leader>e  <esc>:qall!<cr>      " close and exit
nmap <leader>de  :BD<cr>             " delete current buffer
nmap <leader>v  :vsp<cr>             " split buffer vertically
nmap <leader>h  :sp<cr>              " split buffer horizontally
nmap <leader>i  :set list!<cr>       " show special characters
nmap <CR>  gf                        " open the current file under cursor

nmap f :Files<CR>
nmap s :Ag<CR>
nmap t :NERDTreeToggle<CR> 
nmap ! :nohlsearch<cr>
nmap W <C-W>w

" Avoid useless ex Mode
nmap Q <nop>

nmap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Ag: exclude filename from search
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Files: use ag instead of the default find command
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --literal --path-to-ignore ~/.agignore -g ""'
endif

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

