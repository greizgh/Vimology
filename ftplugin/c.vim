"---------------------------------------"
" cscope                                "
"---------------------------------------"
if has("cscope")
    set csto=0
    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    " C-Spc to split search
    nmap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
    " C-Spc twice to split vertically
    nmap <leader><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <leader><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif
nmap <F11> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>
set tags+=tags

" Highlight todos and fixmes
noremap <F10> :vimgrep /\<\(TODO\\|BUG\\|FIXME\)\>/j **/*.cpp **/*.hpp **/*.h **/*.c<CR>:cw<CR>
