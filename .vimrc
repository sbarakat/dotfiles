

" -- general -------------------------------------------------------------------

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set visualbell                  "No sounds
set enc=utf-8
set fenc=utf-8

set title

"set binary

" -- Vundle initialization -----------------------------------------------------

filetype off                  " required

if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    let s:bootstrap=1
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'           " let Vundle manage Vundle, required
Plugin 'nathangrigg/vim-beancount'

call vundle#end()

if exists("s:bootstrap") && s:bootstrap
    unlet s:bootstrap
    :PluginInstall
endif

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


" -- presentation --------------------------------------------------------------

set background=dark

" koehler/slate/torte work well in non-diff
colorscheme koehler

" slate/murphy work well in diff
if &diff
    colorscheme slate
endif

if &term == "xterm"
    set t_Co=256
endif

" Display tabs and trailing spaces visually
set listchars=eol:$,tab:>-,trail:∙,extends:>,precedes:<

set showmatch           "Show matching brackets
set nowrap              "Don't wrap lines
set linebreak           "Wrap lines at convenient points

set backspace=indent,eol,start  "Allow backspace in insert mode


" -- searching -----------------------------------------------------------------

set ignorecase          "Ignore case in searches using /
set smartcase           "When uppercase used in search then use case

" -- indentation ---------------------------------------------------------------

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set shiftround
set softtabstop=4
set tabstop=4
set expandtab

set viminfo='50,\"10000 "Recall marks for 50 files and set register size to     10000 lines


" -- folds ---------------------------------------------------------------------

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" -- Python section ------------------------------------------------------------

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def

