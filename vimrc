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
nmap s <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Solarized settings
" let g:solarized_visibility="high"
let g:solarized_termtrans=1
let g:solarized_contrast="high"
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

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set noexpandtab
set shiftwidth=3
set tabstop=3

function! NERDTreeStartUp()
	" if argc() == 0
	" wincmd p
	" Open default NERDTree directories (uses macro)

	if getcwd() == "/var/www/gyd"
		NERDTree
		let @a = ":NERDTreeFocusP2jOkOP"
		normal @a
		let @a = ''
	endif
	" end
endfunction
autocmd VimEnter * call NERDTreeStartUp()
