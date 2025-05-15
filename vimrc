" vimrc config

" Runtimepath
set runtimepath^=~/.config/vim/


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin('~/.config/vim/plugged/')

Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'nordtheme/vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/AutoComplPop'

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

nmap <c-t> :NERDTreeToggle<CR>

" }}}i


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}i


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}


" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Add relative numbers to each line.
set number relativenumber

" Color settings
set background=dark

" Turn syntax highlighting on.
syntax on

set cursorline
set termguicolors 
colorscheme dracula

hi Comment cterm=italic

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" tell vim where to put its backup files
" set backupdir=~/.config/vim/backup//

" tell vim where to put swap files
set directory=~/.config/vim/backup//

" tell vim where to put viminfo file
set viminfofile=~/.config/vim/.viminfo

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=20

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Disable sound
set belloff=all

" Search sub-directories
" Tab-completion for all file-related tasks 
" Use TAB to :find by partial match - use * to kake it fuzzy
set path+=**

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Autocomplete
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
autocmd BufRead,BufNewFile *.md setlocal spell

" Template
augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.config/vim/templates/skel.'.expand("<afile>:e")
augroup END

" NERDTree settings
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
