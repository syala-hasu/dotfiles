" Normal Mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
" NormalでもEnterで改行
nnoremap <CR> i<Return><ESC>
" NormalでもBackspaceで文字消去
nnoremap <BS> X
" CTRL+Sで保存(:w)
nnoremap <C-S> :w<CR>
" CTRL+Qで閉じる(:q)
nnoremap <C-Q> :q<CR>

nmap <buffer> gd <Plug>(lsp-definition)

" Insert Mode
" jjでNormalモードに
inoremap <silent> jj <ESC>
" (一応...)
inoremap <silent> っｊ <ESC>
" Insert時Escを無効
" inoremap <ESC> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" InsertモードでもCTRL+Sで保存
inoremap <C-S> <ESC>:w<CR>

" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

" Visual Mode
" jjでNormalモードに 
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>


