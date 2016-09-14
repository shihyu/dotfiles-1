execute pathogen#infect()
let g:rustfmt_autosave = 1

" custom key bindings
map <F5> :%!xxd<CR>
map <F6> :%!xxd -r<CR>

" theme
set background=dark
set t_Co=256
highlight Normal ctermbg=None
autocmd ColorScheme * highlight Normal ctermfg=253 ctermbg=None
autocmd ColorScheme * highlight NonText ctermbg=None
autocmd ColorScheme * highlight LineNr ctermbg=None
colorscheme jellybeans " https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

" visual options
set shortmess+=I
syntax enable
set number
set ruler
set wrap
set linebreak
set lazyredraw

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" editing options
set modeline
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set textwidth=80
set formatoptions=cnjoq
set formatlistpat=^\\s*[0-9*+-]\\+[.\\t\ ]\\s*
set autoindent
set backspace=indent,eol,start
set timeoutlen=1000 ttimeoutlen=0

" common
"set autochdir " buggy sets byftype -> nofile
set directory=~
set backupdir=~
set spellfile=dictionary.add,~/.vim/dictionary.add " relative to CWD

" helpers
set wildmenu

" trim trailing spaces on save
function! <SID>Cleanup()
    let pos = getpos(".")
    %s/\s\+$//e
    call setpos(".", pos)
endfun
autocmd BufWritePre * :call <SID>Cleanup()
