""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" Ctrlp
"""""""""""""""""""""""""""""""
let g:ctrlp_show_hidden = 1
"""""""""""""""""""""""""""""""
"Vimtex folding
"
let g:vimtex_fold_enabled = 1
"""""""""""""""""""""""""""""""
" Remember cursor position
"""""""""""""""""""""""""""""""
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


set foldmethod=indent
set foldlevel=2

""" Allow for hidden buffers

set hidden

set autoindent

set runtimepath+=~/.vim/my-snippets

autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

set completeopt=noinsert,menuone,noselect

augroup my_cm_setup
autocmd!
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd Filetype tex call ncm2#register_source({
    \ 'name': 'vimtex',
    \ 'priority': 8,
    \ 'scope': ['tex'],
    \ 'mark': 'tex',
    \ 'word_pattern': '\w+',
    \ 'complete_pattern': g:vimtex#re#ncm2,
    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    \ })
augroup END


