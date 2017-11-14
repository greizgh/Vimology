call plug#begin('~/.vim/plugged')

Plug 'Valloric/MatchTagAlways'
" Completion
Plug 'Valloric/YouCompleteMe', {'do': 'python2 install.py --clang-completer --tern-completer --racer-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"Plug 'Shougo/deoplete.nvim'

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'

Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
"Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
Plug 'tweekmonster/braceless.vim'
Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Auto pair parenthesis
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'

" Syntax
Plug 'sheerun/vim-polyglot'

" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }

" TOML support
Plug 'cespare/vim-toml'

Plug 'airblade/vim-gitgutter'

call plug#end()
set shortmess+=I

set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2

set background=dark
colorscheme solarized
set number
set cursorline

let mapleader=","
nnoremap <F5> :GundoToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>
nnoremap <C-p> :FZF<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :YcmCompleter GoToDefinition<cr>
nnoremap <A-x> :Commands<cr>
nnoremap <C-f> :Ag<cr>
nmap m <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Gundo
let g:gundo_close_on_revert = 1
let g:gundo_help = 0

" Syntastic
let g:syntastic_check_on_wq = 0

" Easymotion
let g:EasyMotion_g_smartcase = 1

" Neomake
call neomake#configure#automake('w')

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = 'python'
"let g:ycm_rust_src_path = $RUST_SRC_PATH

let g:UltiSnipsExpandTrigger="<C-e>"

" JSX
let g:jsx_ext_required = 0 " Allow JSX in .js files

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
