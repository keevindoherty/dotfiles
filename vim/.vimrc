
" vim-plug ------------------------------------- {{
let installedVimPlug = 0
" install vim-plug if it's not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  let installedVimPlug = 1
  silent !curl -fsLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'AlessandroYorba/Sierra'
Plug 'tpope/vim-fugitive'
call plug#end()

" install plugins if vim-plug was just installed
if installedVimPlug
  PlugInstall
endif
" }}}"

" Window splits ----------------------- {{{
inoremap jk <esc>
inoremap kj <esc>
" }}}

" Window splits ----------------------- {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}

" Forced learning --------------------- {{{
" disable arrow key movement to force learning
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" disable esc to force use of jk mapping
inoremap <esc> <NOP>
" }}}

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

" Visual settings ------------------------------- {{{
syntax enable " enable syntax processing
let g:sierra_Twilight = 1
colorscheme sierra

set number
set relativenumber    " show relative line numbers
set showcmd   " show command in bottom bar
set cursorline " highlight current line
filetype indent on " load filetype-specific indent files
set showmatch   " highlight matching [{()}]
set nowrap " turn off word wrap
set scrolloff=3 " Keep 3 lines below and above cursor
hi CursorLineNR term=bold cterm=bold " make current line number bold
match ErrorMsg '\s\+$' " highlight trailing whitespace
" }}}
