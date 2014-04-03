set nocompatible
call pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp/doc

" ========================================
"         General
" ========================================

" --- From http://nvie.com/posts/how-i-boosted-my-vim/
set hidden        " Allows you to exit when using hidden buffers
set nowrap        " Don't wrap lines
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set tabstop=2     " A tab is fout spaces
set shiftwidth=2  " Number of spaces to use for autoindenting
set expandtab
set autoindent    " Always set autoindenting on
set si
set copyindent    " Copy the previous indentation on autoindenting
set number        " Always show line numbers
set shiftround    " Use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " Set show matching parenthesis
set ignorecase    " Ignore case when searching
set smartcase     " Ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " Insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " Highlight search terms
set incsearch     " Show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set laststatus=2  " Always show the statusline
set cursorline
set ruler

let g:Tex_DefaultTargetFormat='pdf'

" Set the color scheme background properly?
" hi Normal ctermbg=White ctermfg=Black guifg=Black guibg=White

" Auto detect the indentation style
:autocmd BufReadPost * :DetectIndent 
au BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set filetype=glsl

" ========================================
"         Keymaps
" ========================================

" Efficiency
inoremap kj <esc>
inoremap KJ <esc>
noremap ; :
let mapleader=","

" Quick edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Movement mappings
nmap <S-j> <C-f>zz
nmap <S-k> <C-b>zz
nmap <S-b> *
imap <C-j> <down>
imap <C-k> <up>
imap <C-h> <left>
imap <C-l> <right>
nnoremap j gj
nnoremap k gk
nnoremap <Space> 10jzz
nnoremap <BS> 10kzz

" Clear search highlights with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Use w!! to write with sudo
cmap w!! w !sudo tee % >/dev/null

set pastetoggle=<C-p>

" Insert single character in normal mode
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" Rebinds for EasyMotion
let g:EasyMotion_leader_key = ','

" Easy open terminal
cmap bh ConqueTerm bash

" ========================================
"         Colors
" ========================================

syntax on
syntax enable
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme mustang

let g:neocomplcache_enable_at_startup = 1

filetype plugin indent on
