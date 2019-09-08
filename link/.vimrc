" Default Settings
set history=500
set nocompatible
set showcmd
set incsearch
set number

" Graphical tuning
syntax enable
set laststatus=2
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme smyck
set ruler

" Hightlight trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

set showmatch
set textwidth=80
match ErrorMsg '\%>80v.\+'

" No Swap Files
set nobackup
set nowb
set noswapfile

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Dont divide words by
set isk+=_,$,@,%,#,-

" urxvt mouse scrolling
set ttymouse=xterm2

" Make .md files markdown not modula2
au BufRead,BufNewFile *.md set filetype=markdown

let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
" Pathoge
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'powerline')
call pathogen#infect()
"let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_theme='powerlineish'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ' nobranch'

" Enable Status line
set laststatus=2

" Only do this part when compiled with support for autocommands
if has("autocmd")
  filetype plugin indent on
else
  set autoindent    " always set autoindenting on
endif

" Custom Command for trailing whitespaces
com Tws :%s/\s\+$//

" NERDTree
map <F2> :NERDTreeToggle<CR>
