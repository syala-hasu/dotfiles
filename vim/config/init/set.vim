set nocompatible
set backspace=indent,eol,start

" UTF-8
set fenc=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" 行番号表示
set number

" Tab
" タブ文字
set list listchars=tab:\▸\-
" タブは空白
set expandtab
" タブは2スペ
set tabstop=2

" Space
" 行末スペースを空白記号に
set list listchars=trail:\␣

" Indent
" インデントは2スペ
set shiftwidth=2

" ステータスラインを表示
set laststatus=2

" カーソルラインを表示
" set cursorline

" シンタックスハイライトを有効
syntax enable

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

" swpファイル出力先
set directory=~/.vim
" バックアップファイル出力先
set backupdir=~/.vim
" undoファイル出力先
set undodir=~/.vim
" スクロールするときに3行空ける
set scrolloff=3

" ファイルに更新があれば自動で再読み込み
set autoread

" コマンドを表示
set showcmd
