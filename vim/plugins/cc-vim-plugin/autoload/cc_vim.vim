" ==============================================
" cc-vim-plugin autoload functions
" ==============================================

" Claude Codeを起動する関数
function! cc_vim#launch_claude()
  echo "Claude Codeを起動中..."
  
  " 新しいターミナルでClaude Codeを起動
  if has('terminal')
    " 右側に縦分割でターミナルを開く（幅80列）
    execute 'vertical rightbelow 80new'
    execute 'terminal ++close ' . g:cc_vim_command
  else
    " 外部ターミナルで起動
    execute '!' . g:cc_vim_command . ' &'
    redraw!
  endif
endfunction

" 現在のファイルをClaude Codeに送信する関数
function! cc_vim#send_current_file()
  echo "現在のファイルをClaude Codeに送信中..."
  
  let filename = expand('%:p')
  if filename == ''
    echo "保存されていないファイルです"
    return
  endif
  
  " Claude Codeでファイルを開く
  if has('terminal')
    execute 'terminal ++close ' . g:cc_vim_command . ' ' . shellescape(filename)
  else
    execute '!' . g:cc_vim_command . ' ' . shellescape(filename) . ' &'
    redraw!
  endif
endfunction

" 選択範囲をClaude Codeに送信する関数
function! cc_vim#send_selection() range
  echo "選択範囲をClaude Codeに送信中..."
  
  " 選択範囲の内容を取得
  let lines = getline(a:firstline, a:lastline)
  let content = join(lines, "\n")
  
  " 一時ファイルに保存
  let tempfile = tempname() . '.txt'
  call writefile(split(content, "\n"), tempfile)
  
  " Claude Codeで一時ファイルを開く
  if has('terminal')
    execute 'terminal ++close ' . g:cc_vim_command . ' ' . shellescape(tempfile)
  else
    execute '!' . g:cc_vim_command . ' ' . shellescape(tempfile) . ' &'
    redraw!
  endif
endfunction