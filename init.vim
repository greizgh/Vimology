call plug#begin('~/.vim/plugged')

Plug 'Valloric/MatchTagAlways'
" Completion
Plug 'ncm2/ncm2' | Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
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
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Auto pair parenthesis
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'

" Syntax
Plug 'sheerun/vim-polyglot'

" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }

Plug 'airblade/vim-gitgutter'

Plug 'sbdchd/neoformat'
Plug 'editorconfig/editorconfig-vim'

call plug#end()
set shortmess+=I
set shortmess+=c

set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set inccommand=split

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
nnoremap <C-f> :Rg<cr>
nmap m <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" NCM related mapping
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Gundo
let g:gundo_close_on_revert = 1
let g:gundo_help = 0

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Easymotion
let g:EasyMotion_g_smartcase = 1

" FZF
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Neomake
call neomake#configure#automake('w')

" JSX
let g:jsx_ext_required = 0 " Allow JSX in .js files

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'cargo fmt'

" Ultisnips
" As par NCM doc:
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" optional
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

" Language server
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/matt/.config/nvim/ls-settings.json'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python': ['pyls'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ }
