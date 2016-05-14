" Set up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vimrc.bundles
filetype on

" Let the games begin
colorscheme detailed

set modeline
set exrc
set secure
syntax on
set nocursorline                " do not highlight current line
set nonumber
set shiftwidth=2               " use indents of 2 spaces
set tabstop=2                  " an indentation every two columns
set softtabstop=2              " let backspace delete indent
set mouse=                 " disable mouse
set history=10000
set wrap                      " wrap long lines
set expandtab
set ruler
set hlsearch

" These 4 lines break left and right arrows in insert mode:
"imap OA <ESC>ki
"imap OB <ESC>ji
"imap OC <ESC>li
"imap OD <ESC>hi

"set nottybuiltin
"set timeout ttimeoutlen=100 timeoutlen=5000
"set smartindent
"set autoindent
set foldmethod=indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" indentation guides
let g:spf13_no_indent_guides_autocolor = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3a3a3a ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#585858 ctermbg=240

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" fix weird arrows don't work problem
"set t_ku=OA
"set t_kd=OB
"set t_kr=OC
"set t_kl=OD

if &diff
  syntax off
	set diffopt+=iwhite

"  set diffexpr=MyDiff()
"  function MyDiff()
"    silent execute "!diff -a --binary -b -w --minimal " . v:fname_in . " " . v:fname_new . " > " . v:fname_out
"  endfunction
endif

"source ~/.vimrc.omnicomplete
"source ~/.vimrc.neocachecomplete
source ~/.vimrc.popup_menu
"source ~/.vimrc.golang
"source ~/.vimrc.fatih
source ~/.vimrc.ctrlp-funky

"source ~/.vimrc.confirm_quit
"source ~/.vimrc.ultisnips
if has("autocmd")
  filetype plugin indent on
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
set backspace=indent,eol,start
set nosecure
set exrc

au BufRead,BufNewFile *.fls        set ft=fls
" Make buffer selection easy with :b <tab>
set wildchar=<Tab> wildmenu wildmode=full

"turn off all beeping and flashing
set noerrorbells
set visualbell
set t_vb=

