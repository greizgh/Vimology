"
" Greizgh's very own vimrc
"

"---------------------------------------"
" Initialisation                        "
"---------------------------------------"
set nocompatible
" Let Vundle load plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle bundles
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'justinmk/vim-sneak'
Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/ZoomWin'

call vundle#end()

"---------------------------------------"
" General settings                      "
"---------------------------------------"
filetype plugin indent on
syntax enable
set hidden
set mouse=a
set autoindent
set smartindent
set backspace=indent,eol,start
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set incsearch
set virtualedit=onemore
let g:tex_flavor = "latex"
set completeopt=menuone,preview

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
set showtabline=2
set laststatus=2
set noshowmode
set cursorline


"---------------------------------------"
" Key mapping                           "
"---------------------------------------"
set pastetoggle=<F12>
nnoremap <F9> :TagbarToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
let mapleader=","
nnoremap <F5> :GundoToggle<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <leader>m :Unite file_mru<cr>
nnoremap <leader>/ :Unite  grep:.<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>b :Unite -quick-match buffer<cr>

"---------------------------------------"
" Plugin specific configuration         "
"---------------------------------------"

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Gundo
let g:gundo_close_on_revert = 1
let g:gundo_help = 0

" Syntastic
let g:syntastic_check_on_wq = 0

" Pymode options
let g:pymode_folding = 0
let g:pymode_rope_complete_on_dot = 0

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-k>"

"---------------------------------------"
" Helpers                               "
"---------------------------------------"

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" grep in project
set grepprg=grep\ -nH\ $*
au BufRead,BufNewFile *.md set filetype=markdown
