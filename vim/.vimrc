" ======================================
" 基本的なVim設定
" ======================================

" 文字エンコーディング設定
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

" 表示設定
set number              " 行番号を表示
set ruler               " カーソルの位置を表示
set title               " タイトルを表示
set showmatch           " 括弧の対応をハイライト
set visualbell          " ビジュアルベル使用
set noerrorbells        " エラーベルを無効化

" インデント・タブ設定
set autoindent          " 自動インデント
set expandtab           " タブを空白で展開
set tabstop=4           " タブの表示幅
set shiftwidth=4        " インデント幅
filetype plugin indent on  " ファイルタイプ別インデント

" 検索設定
set hlsearch            " 検索結果をハイライト
set incsearch           " インクリメンタルサーチ
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 大文字が含まれる場合は区別する

" 編集関連設定
set backspace=indent,eol,start  " バックスペースの動作設定
set history=1000        " コマンド履歴数
set undolevels=1000     " アンドー回数

" 補完設定
set wildmenu            " コマンドライン補完を強化
set wildmode=list:longest   " 補完動作設定

" ======================================
" キーマッピング
" ======================================

" jjでInsertモードから脱出
inoremap jj <Esc>

" Escキー2回で検索ハイライトを消去
nnoremap <Esc><Esc> :nohlsearch<CR>

" ======================================
" その他
" ======================================

" シンタックスハイライトを有効化
syntax on

" ======================================
" プラグイン管理（vim-plug）
" ======================================

" vim-plugの自動インストール
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ======================================
" 基本プラグイン
" ======================================

" ステータスライン
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ファイルエクスプローラー
Plug 'preservim/nerdtree'

" ファジーファインダー
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git統合
Plug 'tpope/vim-fugitive'

" ======================================
" React+TypeScript開発用プラグイン
" ======================================

" LSP・補完・診断
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TypeScript構文ハイライト
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" JSX/TSX構文サポート
Plug 'maxmellon/vim-jsx-pretty'

" Emmet（HTML/JSX展開）
Plug 'mattn/emmet-vim'

" 括弧・タグ操作
Plug 'tpope/vim-surround'

" 自動ペア補完
Plug 'jiangmiao/auto-pairs'

" コメント切り替え
Plug 'tpope/vim-commentary'

" インデントライン表示
Plug 'Yggdroot/indentLine'

" カラーテーマ
Plug 'morhetz/gruvbox'

call plug#end()

" ======================================
" プラグイン設定
" ======================================

" カラーテーマ設定
colorscheme gruvbox
set background=dark

" NERDTree設定
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" FZF設定
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

" Emmet設定（JSX対応）
let g:emmet_html5 = 1
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'typescript.tsx' : {
\      'extends' : 'jsx',
\  },
\}

" CoC設定
" Tab補完
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enter確定
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo定義
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" エラー診断移動
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)