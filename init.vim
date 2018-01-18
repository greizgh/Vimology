call plug#begin('~/.vim/plugged')

Plug 'Valloric/MatchTagAlways'
" Completion
Plug 'roxma/nvim-completion-manager'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

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

Plug 'airblade/vim-gitgutter'

Plug 'sbdchd/neoformat'

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
set hidden

let mapleader=","
nnoremap <F5> :GundoToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>
nnoremap <C-p> :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <A-x> :Commands<cr>
nnoremap <C-f> :Ag<cr>
nmap m <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" Cycle through completions with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Gundo
let g:gundo_close_on_revert = 1
let g:gundo_help = 0

" Easymotion
let g:EasyMotion_g_smartcase = 1

" Neomake
call neomake#configure#automake('w')

" JSX
let g:jsx_ext_required = 0 " Allow JSX in .js files

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'cargo fmt'

" Language server
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python': ['pyls'],
    \ }

" Autoformat on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
