" vimrc config

" Runtimepath
set runtimepath+=~/.config/vim

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin('~/.config/vim/plugged/')

Plug 'dylanaraps/wal.vim'
"Plug 'ghifarit53/tokyonight-vim'
"Plug 'haishanh/night-owl.vim'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'nordtheme/vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/AutoComplPop'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" }}}


" ================ General Config ====================

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection.
filetype on

" Enable and load plugins for the detected file type.
filetype plugin on

" Turn syntax highlighting on.
syntax on

" Add line numbers
set number


" ================ Indentation =======================

" Load an indent file for the detected file type.
filetype indent on

" Tab behaves intelligently based on shiftwidth.
set smarttab

" Use space characters instead of tabs.
set expandtab

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4


" ================ Colors ============================

colorscheme wal 

set background=dark

set termguicolors

"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1

"set cursorline
"highlight CursorLine cterm=NONE ctermbg=darkgray guibg=#2a2a2a


" ================ Search ============================

" Use highlighting when doing a search.
set hlsearch

" While searching a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show matching words during a search.
set showmatch

" Search sub-directories
" Tab-completion for all file-related tasks 
" Use TAB to :find by partial match - use * to kake it fuzzy
set path+=**


" ================ Backups ===========================

" Do not save backup files.
set nobackup

" Tell vim where to put its backup files
"set backupdir=~/.config/vim/backup//

" tell vim where to put swap files
set directory=~/.config/vim/backup//

" tell vim where to put viminfo file
set viminfofile=~/.config/vim/.viminfo


" ================ Additonal Options =================

" Turn comments in italics on.
hi Comment cterm=italic

" Allow backspace in insert mode
set backspace=indent,eol,start

" Wrap lines or allow long lines to extend as far as the line goes.
set wrap

" Add relative numbers to each line.
"set number relativenumber

" Show partial command typed in the last line of the screen.
set showcmd

" Show current mode on the last line.
set showmode

" Let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Set the number of commands saved in history, default is 20.
set history=20

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Disable sound
set belloff=all

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" ================ VimWiki ===========================

let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

let g:vimwiki_global_ext = 0


" VIMSCRIPT ------------------------------------------------------------ {{{

" Additional More Vimscripts code goes here.

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


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
nmap <c-t> :NERDTreeToggle<CR>

" TOGGLE line numbers
function! ToggleLineNumbers()
    if &number
        set nonumber
    else
        set number
    endif
endfunction
nnoremap <F8> :call ToggleLineNumbers()<CR>


" Additional Vimscripts code goes here.

" }}}

" KEY MAPPINGS --------------------------------------------------------------- {{{

" Key Mapping code goes here.

" }}}i

" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
