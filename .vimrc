set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'gcmt/taboo.vim'

" General vim utilities 
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/dbext.vim'

" File utilities
Plugin 'rking/ag.vim'

" Editor utilities
Plugin 'nathanaelkane/vim-indent-guides' " Show vertical tab alignment
Plugin 'Shougo/neocomplete'              " TODO
Plugin 'Shougo/neosnippet'               " TODO
Plugin 'Shougo/neosnippet-snippets'      " TODO
Plugin 'ervandew/supertab'               " Tab triggers autocomplete 
Plugin 'Lokaltog/vim-easymotion'         " TODO
Plugin 'scrooloose/nerdcommenter'        " Nice commenting
Plugin 'Raimondi/delimitMate'            " TODO
Plugin 'ciaranm/detectindent'            " TODO
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/camelcasemotion'

" Color schemes
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'

" Language utilities
Plugin 'derekwyatt/vim-scala'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'tpope/vim-markdown'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mattn/emmet-vim'

" Javascript
Plugin 'posva/vim-vue'
Plugin 'ternjs/tern_for_vim'

" Styles
Plugin 'groenewege/vim-less'
Plugin 'skammer/vim-css-color'

call vundle#end()
filetype plugin indent on


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
"set copyindent    " Copy the previous indentation on autoindenting
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
set diffopt=filler
set guifont=Inconsolata:h14
"set cursorcolumn

"set guifont=Inconsolata\ for\ Powerline
"let g:airline_powerline_fonts = 1

" Set the color scheme background properly?
 "hi Normal ctermbg=White ctermfg=Black guifg=Black guibg=White

" Auto detect the indentation style
autocmd BufReadPost * :DetectIndent 
au BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set filetype=glsl
au BufNewFile,BufRead *.vue set filetype=html

" Python comment fix
autocmd BufRead *.py inoremap # X<c-h>#<space>

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
nmap <silent> <leader>/ :nohlsearch<CR>

" Use w!! to write with sudo
cmap w!! w !sudo tee % >/dev/null

set pastetoggle=<C-S-p>

" Insert single character in normal mode
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

imap <C-k> <Plug>(neosnippet_expand_or_jump)
" File tree browser
map \           :NERDTreeToggle<CR>
" File tree browser showing current file - pipe (shift-backslash)
map \|          :Tagbar<CR>
" Previous/next buffers
map <M-D-Left>  :bp<CR>
map <M-D-Right> :bn<CR>
" Easy access to the shell
map <leader><leader> :!
" Git blame
map <leader>g   :Gblame<CR>
" Comment/uncomment lines
map <leader>/   <plug>NERDCommenterToggle
"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" ========================================
" Buffers
" http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" ========================================
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" ========================================
" Colors
" ========================================

syntax on
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-ocean

" ========================================
" Databases
" ========================================
let g:dbext_default_profile_cdb = ''
let g:dbext_default_profile_cdb = ''

" ========================================
" Airline
" ========================================
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_type = 1
"let g:airline#extensions#tabline#show_splits = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ========================================
" CtrlP
" ========================================
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|bower_components$\|.bower-cache$\|node_modules$\|\.exe$\|\.so$\|\.dll$\|\.pyc$'
"let g:ctrlp_working_path_mode = 'r'
" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nmap <leader>pb :CtrlPBuffer<cr>
nmap <leader>pm :CtrlPMixed<cr>
nmap <leader>ps :CtrlPMRU<cr>

