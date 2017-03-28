" setup Vundle
set shell=/bin/bash
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

set autoindent
set autoread
set autowrite
set backspace=2
set binary
set cindent
set expandtab
set noeol
set number
set rnu
set shiftwidth=2
set smartindent
set softtabstop=2
set spell
set spelllang=en_us
set tabstop=2

map <Esc>[B <Down>

" My Plugins here:
" general editor helpers
"Plugin 'Raimondi/delimitMate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'chase/vim-ansible-yaml'
"Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-eunuch'
"Plugin 'whatyouhide/vim-lengthmatters'
" source control information
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Navigation
"Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" API sutff
"Plugin 'mattn/gist-vim'
"Plugin 'mattn/webapi-vim'
" snippits and syntax highlighting
"lugin 'lepture/vim-jinja'
"lugin 'elzr/vim-json'
"lugin 'hashivim/vim-terraform'
"lugin 'honza/vim-snippets'
"lugin 'parkr/vim-jekyll'
"lugin 'Glench/Vim-Jinja2-Syntax'

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
noremap   <C-n> :NERDTreeToggle<CR>
nnoremap  Q <Nop>
nnoremap  <F5> :GundoToggle<CR>
nnoremap  <F8> :TagbarToggle<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


call vundle#end()

syntax enable

" solarized settings
set background=dark
colorscheme solarized

