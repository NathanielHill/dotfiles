set rtp+=/home/nhill/.local/lib/python2.7/site-packages/bindings/vim

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

syntax on
filetype plugin indent on
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
" let g:solarized_visibility="high"
let g:solarized_termtrans=1
let g:solarized_contrast="high"

" let hour = strftime("%H")
" if 6 <= hour && hour < 18
"  set background=light
" else
"  set background=dark
" endif

set background=dark

colorscheme solarized

set encoding=utf8
set number
set hidden
" set mouse=a

" let g:nerdtree_tabs_open_on_console_startup=1
set autochdir
let NERDTreeChDirMode=2
nnoremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
autocmd FileType nerdtree setlocal nolist
set laststatus=2
let NERDTreeShowHidden=0
" let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeStatusline=""

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set relativenumber

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.css,*.js"

set list
set listchars=eol:¬,trail:~,tab:▸\ ,precedes:«,extends:»
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

set noexpandtab
set shiftwidth=3
set tabstop=3

let NERDTreeIgnore = ['\.pyc$','__pycache__','__init__']

function! NERDTreeStartUp()
	if getcwd() =~ "/home/nhill/Projects"
		NERDTree
		if getcwd() =~ "/home/nhill/Projects/arclight"
			let @a = ":NERDTreeFocusPOBjouBP"
			normal @a
			let @a = ''
		endif
		" why doesn't this work?
		let @b = ":NERDTreeFocus"
		normal @b
		let @b = ''
	endif
endfunction
autocmd VimEnter * call NERDTreeStartUp()

" Autocomplete

" NEOCOMPLCACHE SETTINGS
let g:neocomplcache_enable_at_startup = 1 
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : 
let g:neocomplcache_force_overwrite_completefunc = 1
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns['python'] = '[^. \t]\.\w*'
set ofu=syntaxcomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python let b:did_ftplugin = 1
" Vim-jedi settings
let g:jedi#popup_on_dot = 0
