" Jason Gardella (jgardella)
" .vimrc

" vim-plug ------------------------------------- {{{
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
" }}}

" Plugin settings ------------------------------- {{{
" Syntastic --------------------------- {{{

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" Airline ----------------------------- {{{
set laststatus=2
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}
" }}}

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

" Functions ------------------------------------- {{{

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
" }}}

" Autocommands ---------------------------------- {{{
" auto-remove trailing whitespace on write
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
" }}}

" Tab settings ---------------------------------- {{{
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
" }}}

" Search settings ------------------------------- {{{
set incsearch " search as characters are entered
set hlsearch  " highlight matches
nmap <C-W> :nohlsearch<CR>
" }}}

" Misc settings --------------------------------- {{{
set cindent " enable vim's c-style indentation
set hidden
set backspace=indent,eol,start " normal backspace
" }}}

" Mappings -------------------------------------- {{{
let mapleader = ","
inoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr> " edit vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> " source vimrc
nnoremap <silent> <leader>rts :call TrimWhiteSpace()<CR> " remove trailing whitepsace mapping
nnoremap <leader>sp :set paste!<cr> " toggle paste mode

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

" Window splits ----------------------- {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" }}}

" Vimscript file settings ----------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Vim Manpager ---------------------------------- {{{
let $MANPAGER=''

source $VIMRUNTIME/ftplugin/man.vim

" if you want K to use the :Man command
nnoremap K :execute ":Man " . expand("<cword>")<CR>
" }}}
