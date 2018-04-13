
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
Plug 'liuchengxu/space-vim-dark'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
call plug#end()

" install plugins if vim-plug was just installed
if installedVimPlug
  PlugInstall
endif
" }}}"

" jk escape ----------------------- {{{
inoremap jk <esc>
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

" options for editing .txt files more smoothly
" au BufRead,BufNewFile *.txt set spell wrap linebreak nolist textwidth=0 wrapmargin=0
au BufRead,BufNewFile *.txt call ToggleWrap()
au BufRead,BufNewFile *.txt set spell
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>

    noremap  <buffer> <silent> k   gk
    noremap  <buffer> <silent> j   gj
    "inoremap <buffer> <silent> k   <C-o>gk
    "inoremap <buffer> <silent> j   <C-o>gj
  endif
endfunction
" autocmd Filetype txt nmap <silent> <j> gj
" autocmd FileType txt nmap <silent> <k> gk

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

" Visual settings ------------------------------- {{{
syntax enable " enable syntax processing
" let g:sierra_Twilight = 1
"colorscheme sierra
colorscheme space-vim-dark
hi Normal	  ctermbg=NONE guibg=NONE
hi LineNr	  ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

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
