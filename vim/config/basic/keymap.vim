" Normal Mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
" NormalでもEnterで改行
nnoremap <CR> i<Return><ESC>

" Insert Mode
" jjでNormalモードに
inoremap <silent> jj <ESC>
" Insert時Escを無効
" inoremap <ESC> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

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


