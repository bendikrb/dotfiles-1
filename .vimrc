" setup Vundle
set shell=/bin/bash
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

syntax on
set cindent
set autoindent
set smartindent
set shiftwidth=2
set expandtab
set tabstop=2

map <Esc>[B <Down>

set number

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle 'Lokaltog/vim-easymotion'
" git stuff
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
" kickass powerline
Bundle 'bling/vim-airline'
" syntax highlighting for slim
Bundle 'slim-template/vim-slim'
" json highlighting
Bundle 'elzr/vim-json'
" auto close tags
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
" syntax help
Bundle 'scrooloose/syntastic'
" colorize tmux to match
Bundle 'edkolev/tmuxline.vim'
" fugitive, git stuff
Bundle 'airblade/vim-gitgutter'


" solarized settings
set background=dark
colorscheme solarized

" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Airline
" Use vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode
set ttimeoutlen=50
" show whitespace
let g:airline#extensions#whitespace#enabled = 1

filetype plugin indent on

" highlight md files correctly
au BufRead,BufNewFile *.md set filetype=markdown

" backspace correctly
set backspace=2

" Customize git gutter colors
" let g:gitgutter_highlight_lines = 1
highlight SignColumn ctermbg=black

" unmap arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
nnoremap Q <Nop>
nnoremap <F5> :GundoToggle<CR>
