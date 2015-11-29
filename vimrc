"========================
"Initial Plugin
"========================
" 修改leader键
let mapleader = ','
let g:mapleader = ','

syntax on

if filereadable(expand("~/vimfiles/vimrc.bundles"))
    source ~/vimfiles/vimrc.bundles
endif

"============================
" Gerneral Settings
" ===========================

set history=2000

filetype on

filetype indent on

filetype plugin on

filetype plugin indent on

set autoread
set shortmess=atI

"create undo file
if has('persistent_undo')
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set undofile                " So is persistent undo ...
  set undodir=$APPDATA\vimundo\
endif

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

set cursorcolumn
set cursorline

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

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
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Windows\ Compatible:h10:cDEFAULT
colorscheme monokai
"set background=dark
"colorscheme solarized
set guioptions-=T  "remove toolbar
set guioptions-=m "remove menubar"
set guioptions-=r "remove right scroolbar"
set guioptions-=L "remove left scrollbar"
set t_Co=256
set lines=45 columns=150
set number
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set mouse-=a
set backupdir=$TEMP
set directory=$TEMP

set fillchars=vert:│
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

set laststatus=2
"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

autocmd! bufwritepost vimrc source %
set completeopt=longest,menu
hi Pmenu                    guibg=#606060
hi PmenuSel                 guifg=#dddd00 guibg=#1f82cd
hi PmenuSbar                guibg=#d6d6d6
hi PmenuThumb               guifg=#3cac3c

au GUIEnter * simalt ~x

set foldenable
set foldmethod=indent
set foldlevel=99
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun


"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
set hidden
