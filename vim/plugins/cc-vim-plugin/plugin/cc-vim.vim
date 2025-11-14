" ==============================================
" cc-vim-plugin: Claude Code Vim統合プラグイン
" ==============================================

" プラグインの重複読み込み防止
if exists('g:loaded_cc_vim') || &compatible
  finish
endif
let g:loaded_cc_vim = 1

" プラグイン設定のデフォルト値
if !exists('g:cc_vim_command')
  let g:cc_vim_command = 'claude'
endif

" ==============================================
" メインコマンド定義
" ==============================================

" Claude Codeを起動
command! ClaudeCode call cc_vim#launch_claude()

" 現在のファイルをClaude Codeに送信
command! ClaudeFile call cc_vim#send_current_file()

" 選択範囲をClaude Codeに送信
command! -range ClaudeSelection <line1>,<line2>call cc_vim#send_selection()

" ==============================================
" キーマッピング
" ==============================================

" デフォルトキーマッピング（ユーザーが無効化可能）
if !exists('g:cc_vim_no_mappings') || !g:cc_vim_no_mappings
  " <leader>cc: Claude Code起動
  nnoremap <leader>cc :ClaudeCode<CR>
  
  " <leader>cf: 現在のファイルを送信
  nnoremap <leader>cf :ClaudeFile<CR>
  
  " <leader>cs: 選択範囲を送信
  vnoremap <leader>cs :ClaudeSelection<CR>
endif