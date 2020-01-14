" Author: Alvaro Navarro <alnacle@gmail.com>

" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'             " file browser
Plug 'ap/vim-buftabline'               " tabline buffer list
Plug 'itchyny/lightline.vim'           " light statusline
Plug 'qpkorr/vim-bufkill'              " delete a buffer without closing window 
Plug 'milkypostman/vim-togglelist'     " toggle QuickFix list
Plug 'airblade/vim-gitgutter'          " show git diff in the gutter
Plug 'morhetz/gruvbox'                 " gruvbox theme
Plug 'fatih/vim-go'                    " golang support
Plug 'sheerun/vim-polyglot'            " collection of language packs

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

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
set noautochdir       " working directory same as current file
set clipboard+=unnamed  " copy and paste to the “global” buffer

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
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

" Searching
set hlsearch          " highlight search
set incsearch         " Incremental search, search as you type
set showmatch         " Highlights the matching braces|brackets|parens when the cursor is on a bracket.

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
set background=dark
set mouse=
set t_ut=
set visualbell t_vb=

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

" gitgutter
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1

" Update sign column every quarter second
set updatetime=250

" Golang
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0


au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
au FileType go nmap g :GoDef<cr>
au FileType go nmap m :GoTest -short<cr>
au filetype go inoremap <buffer> . .<C-x><C-o>

au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2
au FileType json syntax match Comment +\/\/.\+$+

au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

au Filetype html setlocal ts=2 sts=2 sw=2 expandtab
au Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
au Filetype sh setlocal ts=2 sts=2 sw=2 noexpandtab

" NERDTree
let g:NERDShutUp         = 1  " Silent mode
let g:NERDTreeMinimalUI  = 1  " Minimal UI
let g:NERDTreeIgnore     = ['\.pyc$', '\.pyo$', '\.o$', '\.so$']

" (re)mapping keys
nnoremap <tab>   :bn<cr>
nnoremap <s-tab> :bp<cr>

nnoremap <leader>c  :<esc><c-w>q<cr>     " delete split
nnoremap <leader>e  <esc>:qall!<cr>      " close and exit
nnoremap <leader>d  :BD<cr>              " delete current buffer
nnoremap <leader>v  :vsp<cr>             " split buffer vertically
nnoremap <leader>h  :sp<cr>              " split buffer horizontally
nnoremap <leader>i  :set list!<cr>       " show special characters
nnoremap <leader>!  :nohlsearch<cr>      " switch off the current search
nnoremap <leader>x  :ArgWrap<CR>         " wrap function arguments

nnoremap <CR>  gf           " open the current file under cursor with 'enter'
set pastetoggle=<leader>p       " switch on/off paste mode

nnoremap f :Files<CR>
nnoremap t :NERDTreeToggle<CR> 
nnoremap q :call ToggleQuickfixList()<CR>
nnoremap s :Ag<CR>
nnoremap W <C-W>w

" don't use arrowkeys
noremap <Up>     <NOP>
noremap <Down>   <NOP>
noremap <Left>   <NOP>
noremap <Right>  <NOP>

" really, just don't
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" apply color scheme
colorscheme gruvbox

" NERDTree on ctrl+n
let NERDTreeShowHidden=1

" Avoid useless ex Mode
nnoremap Q <nop>

" Some plugin seems to search for something at startup, so this fixes that.
silent! nohlsearch
set guioptions=

" make FZF respect gitignore if `ag` is installed
" you will obviously need to install `ag` for this to work
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

