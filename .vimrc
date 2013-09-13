set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'klen/python-mode'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

NeoBundleCheck

filetype on
filetype plugin on
filetype indent on

let mapleader = ','

set number
set backspace=indent,eol,start " Allow backspace in insert mode
set history=1000 " Store lots of :cmdline history
set showcmd " Show incomplete cmds down the bottom
set showmode " Show current mode down the bottom
set gcr=a:blinkon0 " Disable cursor blink
set visualbell " No sounds
set autoread " Reload files changed outside vim

" http://items.sjbach.com/319/configuring-vim-right
set hidden
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set title

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Indents
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Scroll improvements
set scrolloff=8 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


""""""""""""""""
" Key mappings
""""""""""""""""

" Make cursor move as expected with wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Buffers, tabs movement
map <C-j> :bprevious<CR>
map <C-k> :bnext<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

vmap <TAB> >gv
vmap <S-TAB> <gv


"""""""""""""""""
" MiniBufExplorer
"""""""""""""""""

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


"""""""""""
" NerdTree
"""""""""""

let NERDTreeIgnore = ['\.pyc$']
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif " open always
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


""""""""""
" Airline
""""""""""

let g:airline_powerline_fonts = 1
set t_Co=256
set laststatus=2 " Make Airline appear always


""""""""""""""
" Python-mode
""""""""""""""

let g:pymode_rope = 0 " Forget rope, jedi

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E501"

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 99
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%99v.*/
    autocmd FileType python set nowrap
augroup END


let javascript_enable_domhtmlcss = 0
let b:javascript_fold = 0

