"
" Greizgh's very own vimrc
"

"---------------------------------------"
" Initialisation                        "
"---------------------------------------"
set nocompatible
" Let Vundle load plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'davidhalter/jedi-vim'
Bundle 'bling/vim-airline'
Bundle 'klen/python-mode'
Bundle 'Valloric/YouCompleteMe'

"---------------------------------------"
" General settings                      "
"---------------------------------------"
filetype plugin indent on
syntax enable
set hidden
set mouse=a
set autoindent
set smartindent
set laststatus=2
set backspace=indent,eol,start
set shiftwidth=4
set expandtab
set tabstop=8
set softtabstop=4
set incsearch
set virtualedit=onemore
let g:tex_flavor = "latex"
set completeopt=longest,menuone

"---------------------------------------"
" UI settings                           "
"---------------------------------------"
hi clear
set background=dark
colorscheme solarized
set number
set hlsearch
set ruler
set showmatch
set shortmess+=I


"---------------------------------------"
" Key mapping                           "
"---------------------------------------"
set pastetoggle=<F12>
nnoremap <F9> :TagbarToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
let mapleader=","
map <C-x> "+x
map <C-c> "+y
map <C-p> "+gP
map <C-a> ggVG
"inoremap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>
nnoremap <F5> :GundoToggle<CR>

"---------------------------------------"
" Plugin specific configuration         "
"---------------------------------------"

"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * if !argc() | NERDTree | endif

" Gundo
let g:gundo_close_on_revert = 1
let g:gundo_help = 0

" Syntastic
let g:syntastic_check_on_wq = 0
" Set syntastic passive on python (python-mode already check my code)
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['python'] }
" Pymode options
let g:pymode_folding = 0
let g:pymode_rope = 0

" Taglist
let Tlist_Exit_OnlyWindow = 1
let Tlist_Process_File_Always = 1

"YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"---------------------------------------"
" Helpers                               "
"---------------------------------------"

" remove bad spaces
autocmd BufReadPost * match BadWhitespace /\s\+$/
autocmd InsertEnter * match BadWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=1

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" grep in project
set grepprg=grep\ -nH\ $*
