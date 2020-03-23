call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'twitvim/twitvim'
Plug 'itchyny/lightline.vim'

" Utility----------
" 括弧補完
Plug 'cohama/lexima.vim'
" ファイルを検索して開く
Plug 'ctrlpvim/ctrlp.vim'
" 置換プレビュー
Plug 'markonm/traces.vim'
" Git操作
Plug 'tpope/vim-fugitive'

" Back----------
" Golang
" Plug 'fatih/vim-go'

" EndBack----------


" Front----------
" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
" HTMLタグを自動で閉じてくれるやつ
Plug 'alvan/vim-closetag'

" TypeScript
Plug 'leafgarland/typescript-vim'

" CSS/Sass
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" Vue
Plug 'posva/vim-vue'
Plug 'syala-hasu/init-vue-component.vim'

" Elm
Plug 'andys8/vim-elm-syntax'

" EndFront----------

" Markdown----------
" EndMarkdown----------
"
" Docker----------
" DockerFile Syntax
Plug 'ekalinin/Dockerfile.vim'
" EndDocker----------
call plug#end()
