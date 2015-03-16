" setup Vundle
set shell=/bin/bash
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set autoindent
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
set tabstop=2

map <Esc>[B <Down>


" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My Plugins here:
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/unite.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'chase/vim-ansible-yaml'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'elzr/vim-json'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'kmnk/vim-unite-giti'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'whatyouhide/vim-lengthmatters'
" snippits and highlighting
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

syntax enable

call unite#filters#matcher_default#use(['matcher_fuzzy'])

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
noremap <C-P>  :Unite -start-insert file_rec<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" toggle semantic higlighting
nnoremap <C-s> :SemanticHighlightToggle<cr>
