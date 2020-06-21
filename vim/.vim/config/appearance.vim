""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""
set t_Co=256
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
let g:seoul256_background = 239
colorscheme seoul256
let g:airline_theme="base16_mocha"
"""""""""""""""""""""""""""""""""

set relativenumber
set number
set guifont=Monospace\ 14

"""""""""""""""""""""""""""""""
" Show special characters
"""""""""""""""""""""""""""""""

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"
"""""""""""""""""""""""""""""""
set guioptions-=r
set go-=T
set go-=m



