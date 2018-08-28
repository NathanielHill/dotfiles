" To avoid people writing bad shell scripts that aren't fish compatible
set shell=/bin/bash

" Pathogen
filetype off
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

" To disable a plugin, add it's bundle name to the following list
" Temporarily disabling vimtex until I have time to configure it
let g:pathogen_disabled = []

" Avoid linter conflict, set standard as only linter for javascript
let g:ale_linters = { 'javascript': ['standard'], }

" Automatic standardjs formatting on save
autocmd bufwritepost *.js silent !standard --fix %
set autoread

let mapleader = ","
set showcmd

syntax on
filetype plugin indent on
set nocompatible
set modelines=0

" ALE settings
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

set conceallevel=1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒   "
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set autoindent
nnoremap ; :
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap <C-n> ñ

" Easy motion mapings
nmap s <Plug>(easymotion-s)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1

set scrolloff=999

" Solarized settings
" let g:solarized_visibility="low"
let g:solarized_termtrans=1
let g:solarized_contrast="high"

set background=light

colorscheme solarized

set encoding=utf8
set number
set hidden
set mouse=a

map <Leader>n :NERDTreeToggle<CR>
" let g:nerdtree_tabs_open_on_console_startup=1
set autochdir
let NERDTreeChDirMode=2
nnoremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40
let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
autocmd FileType nerdtree setlocal nolist
set laststatus=2
let NERDTreeShowHidden=0
" let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeStatusline=""

let NERDTreeIgnore = ['\.pyc$','__pycache__','__init__']


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set relativenumber

set list
set listchars=trail:~,tab:▸\ ,precedes:«,extends:»
set nowrap

" Invisible character colors 
" highlight NonText ctermfg=8 guifg=#505050
" highlight SpecialKey ctermfg=8 guifg=#4a4a59

" Unmap arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>


" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
" set t_Co=256

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

" set noexpandtab
" set shiftwidth=3
" set tabstop=3

set foldmethod=indent

" This isn't working! Need to have all folds unfolded on file open
autocmd Syntax css,c,cpp,vim,xml,svg,html,py,js setlocal foldmethod=indent
" autocmd Syntax css,c,cpp,vim,xml,svg,html,py,js normal zR

au BufWinEnter * normal zR

:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

:nnoremap <silent> <C-S>          :update<CR>
:vnoremap <silent> <C-S>         <C-C>:update<CR>
:inoremap <silent> <C-S>         <C-O>:update<CR>

"Adding #{} to AutoClose Plugin and activating it for String interpolation
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '{{': '}}'}
let g:AutoCloseProtectedRegions = ["Character"]
let g:AutoCloseExpandEnterOn = "{"

" Remaps Ctrl-O to do a full re-indent of the entire current buffer in Insert,
" Normal and Visual mode :)
nnoremap <C-o> :let b:PlugView=winsaveview()<CR>gg=G:call winrestview(b:PlugView) <CR>:echo "file indented"<CR>
:vnoremap <C-o> <C-C>:let b:PlugView=winsaveview()<CR>gg=G:call winrestview(b:PlugView) <CR>:echo "file indented"<CR>v
:inoremap <C-o> <C-C>:let b:PlugView=winsaveview()<CR>gg=G:call winrestview(b:PlugView) <CR>:echo "file indented"<CR>i

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"
:nnoremap <C-e> :update<CR>:Bdelete<CR>
:vnoremap <C-e> :update<CR>:Bdelete<CR>
:inoremap <C-e> :update<CR>:Bdelete<CR>

" Use the X11 clipboard to seamlessly copy past between Vim and GUI
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus
