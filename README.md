# dotfiles

個人用のdotfiles設定リポジトリです。zsh、vim、tmux、asdfなどの設定を管理しています。

## 必要な前提条件

- Git
- curl
- make

## インストール

```bash
git clone git@github.com:syala-hasu/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install
```

`make install` は以下を自動的に実行します:

1. zsh / vim / tmux のインストール
2. zsh プラグイン（autosuggestions、syntax-highlighting）のインストール
3. 既存設定ファイルのバックアップ
4. シンボリックリンクの作成
5. asdf と各種ツールのインストール
6. vim プラグインのインストール
7. zsh をデフォルトシェルに設定

インストール後はターミナルを再起動してください。

## 含まれる設定

### Zsh

- **プロンプト**: starship
- **プラグイン**: zsh-autosuggestions、zsh-syntax-highlighting
- **設定ファイル**:
  - `~/.config/zsh/exports.zsh`: 環境変数・PATH
  - `~/.config/zsh/aliases.zsh`: エイリアス
  - `~/.config/zsh/plugins.zsh`: プラグイン設定

### Vim

- **プラグインマネージャー**: vim-plug（初回起動時に自動インストール）
- **主要プラグイン**:
  - coc.nvim（LSP・補完）
  - NERDTree（ファイルエクスプローラー）
  - fzf（ファジーファインダー）
  - vim-fugitive（Git統合）
  - TypeScript / JSX 対応
- **カラーテーマ**: gruvbox

### tmux

- prefix: `Ctrl-a`
- マウスサポート有効
- `|` / `-` でペイン分割
- vim キーでペイン移動・コピーモード操作

### asdf で管理するツール

| ツール | 用途 |
|---|---|
| nodejs | JavaScript ランタイム |
| python | Python ランタイム |
| golang | Go ランタイム |
| github-cli | GitHub CLI |
| uv | Python パッケージ管理 |
| direnv | プロジェクトごとの環境変数管理 |
| starship | プロンプト |
| eza | ls の代替 |
| zoxide | cd の代替 |
| fzf | ファジーファインダー |
| lazygit | Git TUI |

## Makeコマンド

```bash
make install        # フルインストール
make link           # シンボリックリンク作成
make backup         # 既存設定をバックアップ
make clean          # シンボリックリンクを削除

# 個別インストール
make zsh-install
make vim-install
make tmux-install
make docker-install
make claude-install
make gemini-install
make codex-install
```

## カスタマイズ

マシン固有の設定は Git 管理外のローカルファイルに書きます:

```bash
~/.zshrc.local        # zsh のローカル設定
~/.tmux.conf.local    # tmux のローカル設定
```

いずれも自動的に読み込まれます。

### 任意ツールの追加

asdf がインストールされていれば、dotfiles に含まれていないツールも後から追加できます:

```bash
asdf plugin add <tool>
asdf install <tool> <version>
# グローバルに使う場合
asdf global <tool> <version>
```
