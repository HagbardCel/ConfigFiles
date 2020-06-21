" associate *.m with mma filetype
au BufRead,BufNewFile *.m set filetype=mma

filetype plugin indent on
set grepprg=grep\ -nH\ $*
syntax on

"""""""""""""""""""""""""""""""
" Python 
"""""""""""""""""""""""""""""""
let python_highlight_all=1

"""""""""""""""""""""""""""""""
" Tex 
"""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
