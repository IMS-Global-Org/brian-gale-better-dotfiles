set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


let mapleader="\,"

" Plugins
call plug#begin('~/.vim/plugged')
  " File searching
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/syntastic'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'jeetsukumaran/vim-buffergator'

  " JSX File Syntax
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'

  " Sytax
  Plug 'vim-ruby/vim-ruby'
  Plug 'rstacruz/vim-closer'
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdcommenter'
  Plug 'alvan/vim-closetag'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'sheerun/vim-polyglot'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/git-messenger.vim'
  Plug 'tveskag/nvim-blame-line'

  " Views
  Plug 'altercation/vim-colors-solarized'
  Plug 'itchyny/lightline.vim'

  " Text completion & Syntax Checking
  Plug 'w0rp/ale' " Linting
  Plug 'ervandew/supertab' " Tab completion
  Plug 'tpope/vim-endwise' " Ruby end tag completion
  Plug 'inkarkat/vim-spellcheck'
  Plug 'tpope/vim-surround'
  Plug 'mileszs/ack.vim'

  " VIM
  Plug 'guns/xterm-color-table.vim'
  Plug 'mhinz/vim-startify'
  Plug 'djoshea/vim-autoread'
  Plug 'ap/vim-buftabline'
  Plug 'mkitt/tabline.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

  " Collaborative Vim Sessions
  Plug 'jbyuki/instant.nvim'

  Plug 'inkarkat/vim-ingo-library'

  " Conquer of Completion (Coc)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
call plug#end()

"""""""""
"" VIM ""
"""""""""

" Load and source vimrc
nmap <leader>vv :e $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>
nmap <leader>pp :PlugInstall<CR>

" Color Scheme
let g:solarized_termcolors=256
set background=light
colorscheme solarized
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" Enable syntax highlighting
syntax on
set re=0
" set termguicolors

" Enable filetype detection pugin and indent
filetype plugin indent on

" Indentation
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent

" Shows the command
set showcmd

" Shows the page title
set title

" Display the number column by default
set number

" Toggle number column
nmap <leader>n :set invnumber<CR> 

" Automatcially reload a file that's been saved elsewhere
set autoread

" Supress message that a buffer hasn't been saved when changing
set hidden

" Searches
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

" Buffers
nnoremap <silent>; :Buffers<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>h :bn<CR>

" Use the system clipboard when using y and p
set clipboard+=unnamed

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Default width of the left column
set numberwidth=5

" Gutter Colors
hi LineNr ctermfg=245 ctermbg=254
hi CursorLineNr ctermfg=255 ctermbg=166

" Cursor line & column
set cursorline
"hi CursorLine ctermbg=235
"hi CursorColumn ctermbg=235

" Move lines with arrow keys
" nnoremap <down> :m .+1<CR>==
"tmux-neovim-solarized nnoremap <up> :m .-2<CR>==
" vnoremap <down> :m '>+1<CR>gv=gv
" vnoremap <up> :m '<-2<CR>gv=gv

" Make all files 2 space tab width
autocmd FileType * setlocal ts=2 sts=2 sw=2

" Hold onto undo history for everything
set noswapfile
set undodir=~/.vim/undodir
set undofile

" Split windows
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nnoremap <silent> <Leader>v :split<CR>
nnoremap <silent> <Leader>b :vsplit<CR>
nnoremap <silent> <Leader>q :close<CR>


"""""""""""""
"" PLUGINS ""
"""""""""""""

" Codi for code scratchpad
" nnoremap <Leader>irb :Codi ruby<CR>
" nnoremap <Leader>q :Codi!<CR>

" Indentline
" let g:indentLine_setColors = 0
" let g:indentLine_bgcolor_term = 233
" let g:indentLine_color_term = 236
" let g:indentLine_char = '|'
" let g:indentLine_setConceal = 0


" Sign Column
" let g:gitgutter_sign_column_always = 1
" set signcolumn=yes

" Instant - Collaborative Programming
let g:instant_username = "BrennickL"

"" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1

" Buffergator
let g:buffergator_suppress_keymaps = 1
nmap <leader>m :BuffergatorToggle<CR>

" GitGutter
nmap <silent> <leader>g :GitGutterToggle<CR>
let g:gitgutter_enabled = 0

" Git Messenger
let g:git_messenger_no_default_mappings=v:true
nmap <leader>gg <Plug>(git-messenger)

" NerdTree
let g:NERDTreeQuitOnOpen = 1
map <C-n> :NERDTreeToggle<CR>

" NerdCommenter
nnoremap <leader>cc NERDComToggleComment<CR>

" vim-jsx-pretty
let g:vim_jsx_pretty_template_tags = ['html', 'jsx', 'js']
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

" Closetag
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml,*.js,*jsx"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascript.js': 'jsxRegion',
    \ }

" Ale
map <leader>at :ALEToggle<CR>
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
      \ 'typescriptreact': ['eslint'],
      \ }
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ 'typescript': ['prettier', 'eslint'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'ruby': ['ruby'],
      \ }

" FZF
" let g:fzf_layout = { 'window': '10split' }
" Colors defined in .bashrc
" https://github.com/junegunn/fzf/wiki/Color-schemes
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <leader>f :Ag<CR>
let g:fzf_layout = { 'down': '~60%' }

" Vim Fugitive
nnoremap <silent> <Leader>gb :Gblame<CR>
" Vim Nvim-Blame-Line
nmap <silent> <leader>b :ToggleBlameLine<CR>

" XTerm Color Table
nmap <silent> <Leader>ct :XtermColorTable<CR>

" TMUX
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Spelling
set spell
set spelllang=en

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" FilePaths: copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

" COC: Plugin Installation (Run from neovim console line)
" :CocInstall coc-json coc-tsserver
" COC: GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" MarkdownPreview: Pluging
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle
