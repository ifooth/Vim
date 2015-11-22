set history=2000
set autoread
set shortmess=atI
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
set cursorcolumn
set cursorline
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set encoding=utf-8
"set fileencodings=utf-8,chinese,latin-1
set fileencoding=utf-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set langmenu=en_US.UTF-8
let $LANG="en_US"

set guifont=DejaVu\ Sans\ Mono:h10:cDEFAULT
colorscheme monokai

set guioptions-=T  "remove toolbar
set guioptions-=m
set t_Co=256
set lines=45 columns=150
set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set mouse-=a
set backupdir=$TEMP
set directory=$TEMP

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/nvie/vim-flake8'
Plugin 'https://github.com/tell-k/vim-autopep8'
Plugin 'https://github.com/davidhalter/jedi-vim'
"Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/SirVer/ultisnips.git'
Plugin 'https://github.com/honza/vim-snippets.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
"Plugin 'https://github.com/terryma/vim-multiple-cursors' 
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9

"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
" Put your non-Plugin stuff after this line
"
" NERDTree Conf
map <C-n> :NERDTreeToggle<CR>
au GUIEnter * simalt ~x
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set scrolloff=7
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
autocmd! bufwritepost vimrc source %
set completeopt=longest,menu
