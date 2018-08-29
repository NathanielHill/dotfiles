" To avoid people writing bad shell scripts that aren't fish compatible
set shell=/bin/bash

" Pathogen
filetype off
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

" To disable a plugin, add it's bundle name to the following list
" Temporarily disabling vimtex until I have time to configure it
let g:pathogen_disabled = []

filetype plugin indent on
set nocompatible
set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=trail:~,tab:▸\ ,precedes:«,extends:»

" Invisible character colors
highlight NonText ctermfg=8 guifg=#505050
highlight SpecialKey ctermfg=8 guifg=#4a4a59

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa

nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>d :silent !google-chrome --user-data-dir=/tmp/vscode-chrome-debug-userdatadir_9222/ --no-first-run --no-default-browser-check --remote-debugging-port=9222 chrome://inspect &> /dev/null &<cr>

inoremap jj <ESC>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Avoid linter conflict, set standard as only linter for javascript
let g:ale_linters = { 'javascript': ['standard'], }

" Automatic standardjs formatting on save
autocmd bufwritepost *.js silent !standard --fix %
set autoread

syntax on

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

inoremap <C-n> ñ

" Easy motion mapings
nmap s <Plug>(easymotion-s)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1

" Solarized settings
let g:solarized_visibility="low"
let g:solarized_termtrans=1
let g:solarized_contrast="high"

set background=light

colorscheme solarized

set mouse=a

set autochdir
let NERDTreeChDirMode=2
let g:NERDTreeWinSize=40
let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
autocmd FileType nerdtree setlocal nolist
let NERDTreeShowHidden=0
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

let NERDTreeIgnore = ['coverage', 'node_modules']

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" set foldmethod=indent

" This isn't working! Need to have all folds unfolded on file open
" autocmd Syntax css,c,cpp,vim,xml,svg,html,py,js setlocal foldmethod=indent
" autocmd Syntax css,c,cpp,vim,xml,svg,html,py,js normal zR

au BufWinEnter * normal zR

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

"nnoremap <silent> <C-S>          :update<CR>
"vnoremap <silent> <C-S>         <C-C>:update<CR>
"inoremap <silent> <C-S>         <C-O>:update<CR>

" Remaps Ctrl-O to do a full re-indent of the entire current buffer in Insert,
" Normal and Visual mode :)
nnoremap <C-o> :let b:PlugView=winsaveview()<CR>gg=G:call winrestview(b:PlugView) <CR>:echo "file indented"<CR>
vnoremap <C-o> <C-C>:let b:PlugView=winsaveview()<CR>gg=G:call winrestview(b:PlugView) <CR>:echo "file indented"<CR>v
inoremap <C-o> <C-C>:let b:PlugView=winsaveview()<CR>gg=G:call winrestview(b:PlugView) <CR>:echo "file indented"<CR>i

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"
nnoremap <C-e> :update<CR>:Bdelete<CR>
vnoremap <C-e> :update<CR>:Bdelete<CR>
inoremap <C-e> :update<CR>:Bdelete<CR>

" Use the X11 clipboard to seamlessly copy past between Vim and GUI
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus
