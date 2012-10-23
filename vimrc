set nocompatible        " use Vim defaults

" General Options
" -------------------------------------
set t_Co=256			" enable 256 colors
set mouse=a             " make sure mouse is used in all cases.
set autoread
set backspace=indent,eol,start
set shortmess+=I        " disable the welcome screen
set complete+=k         " enable dictionary completion
set completeopt=longest,menuone
set showcmd
set title
set virtualedit=all
set wildmenu
set wildmode=list:longest,full
set scrolloff=5
set shortmess=atI
set laststatus=2		" always show a status line
set clipboard+=unnamed  " yank and copy to X clipboard
set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
set ruler               " ruler display in status line
set showmode            " show mode at bottom of screen
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set cmdheight=1         " set the command height
set showmatch           " show matching brackets (),{},[]
set number				" show number line
set hidden				" allow unsaved buffers to go in background
set shell=/bin/zsh		" set shell

"  wrap like other editors
" -------------------------------------
" set wrap                " word wrap
" set lbr                 " line break
" set display=lastline    " don't display @ with long paragraphs

" backup settings
" -------------------------------------
set backup              " keep a backup file
set backupdir=/tmp      " backup dir
set directory=~/.vim/swap " swap file directory

" tabs and indenting
" -------------------------------------
set expandtab
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set smarttab
set hlsearch

" searching
" -------------------------------------
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" syntax highlighting
" -------------------------------------
syntax on               " enable syntax highlighting

" Code Folding
"---------------------------------
if has ('folding')
  set foldenable
  set foldmethod=marker
  set foldmarker={{{,}}}
  set foldcolumn=0
endif

" plug-in settings
" -------------------------------------
call pathogen#infect()

filetype on
filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete

" scroll one screen line regardless of editor line length
" -------------------------------------
:noremap    <Up> gk
:noremap!   <Up> <C-O>gk
:noremap    <Down> gj
:noremap!   <Down> <C-O>gj

let maplocalleader = ","
let mapleader = ","

"nnoremap <silent> leader :TlistToggle<CR>
map <LocalLeader>l :Tlist<CR>

:noremap	<C-w> <C-w><C-w>

:noremap    k gk
:noremap    j gj

" change the mapleader from \ to ,
let mapleader=","

au FileType * setl fo-=cro 
"set cc=80

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

colorscheme neverland2

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

autocmd Filetype ruby		setlocal ts=2 sts=2 sw=2
autocmd Filetype sh			setlocal ts=2 sts=2 sw=2
autocmd FileType html		setlocal ts=2 sts=2 sw=2
autocmd FileType c			setlocal ts=8 sts=8 sw=8
autocmd FileType make		setlocal noet
autocmd FileType Makefile	setlocal noet
autocmd Filetype python		setlocal sw=4 ts=4 noet
autocmd FileType js			setlocal ts=4 sw=4 noet
