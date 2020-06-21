"""""""""""""""""""""""""""""""
" My 'Hardcore'-mode
"
"""""""""""""""""""""""""""""""
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
":inoremap <BS> <Nop>
:inoremap <Del> <Nop>
noremap <C-j> jzz 
noremap <C-k> kzz 
let mapleader=","
let maplocalleader = "-"
"""""""""""""""""""""""""""""""
map <Space> <PageDown>
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
map <F2> :NERDTreeToggle<CR>

" nmap <leader>b :buffer<CR>
" Shortcut to close buffer
nmap <leader>k :bdelete<CR>
nmap <leader>q :quit<CR>
" Shortcut to rapidly toggle `set list`
"nmap <leader>l :set list!<CR>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <leader>n :bn<CR>
nmap <leader>p :bp<CR>
nmap <leader>b :bn<CR>

nnoremap <Tab> za


let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snippets"]
"
"
" Use <TAB> to select the popup menu:
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <Right> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<S-Tab>""
inoremap <expr> <Left> pumvisible() ? "\<C-p>" : "\<S-Tab>""
