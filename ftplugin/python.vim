" Highlight todos and fixmes
noremap <F10> :vimgrep /\<\(TODO\\|BUG\\|FIXME\)\>/j **/*.py<CR>:cw<CR>
