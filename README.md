# dotfiles

個人用のdotfiles設定リポジトリです。zsh、vim、asdfなどの設定を管理しています。

## 📋 目次

- [必要な前提条件](#必要な前提条件)
- [インストール手順](#インストール手順)
- [含まれる設定](#含まれる設定)
- [使い方](#使い方)
- [カスタマイズ](#カスタマイズ)
- [トラブルシューティング](#トラブルシューティング)

## 🔧 必要な前提条件

- **Git**: リポジトリのクローンに必要
- **curl**: 各種ツールのインストールに使用
- **make**: Makefileを実行するために必要

インストール時に自動的にインストールされるもの:
- zsh
- oh-my-zsh
- asdf (言語バージョン管理ツール)
- vim-plug (Vimプラグインマネージャー)

## 🚀 インストール手順

### 1. リポジトリをクローン

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

### 2. 自動インストールを実行

```bash
make install
```

このコマンドは以下を自動的に実行します:
- 依存関係（zsh、oh-my-zsh）のインストール
- 既存設定ファイルのバックアップ
- シンボリックリンクの作成
- asdfと各種言語ツールのインストール
- Vimプラグインのインストール
- zshをデフォルトシェルに設定

### 3. ターミナルを再起動

```bash
exec zsh
```

## 📦 含まれる設定

### Zsh設定
- **テーマ**: agnoster
- **プラグイン**:
  - git
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - colored-man-pages
  - command-not-found
- **カスタム設定**:
  - `~/.config/zsh/exports.zsh`: 環境変数設定
  - `~/.config/zsh/aliases.zsh`: エイリアス設定
  - `~/.config/zsh/plugins.zsh`: プラグイン固有の設定

### Vim設定
- **プラグインマネージャー**: vim-plug
- **主要プラグイン**:
  - NERDTree (ファイルエクスプローラー)
  - fzf (ファジーファインダー)
  - coc.nvim (LSP・補完)
  - TypeScript/JSX対応プラグイン
  - Emmet (HTML/JSX展開)
- **カラーテーマ**: gruvbox

### asdf設定
以下の言語・ツールのバージョン管理:
- Node.js 23.11.0
- Python 3.11.4
- Go 1.24.6
- Java (AdoptOpenJDK 21.0.7)
- GitHub CLI 2.79.0
- uv 0.9.2

## 📚 使い方

### Makeコマンド一覧

```bash
make help           # 利用可能なコマンドを表示
make install        # フルインストール
make backup         # 既存設定をバックアップ
make link           # シンボリックリンク作成
make asdf-install   # asdfと言語ツールをインストール
make clean          # シンボリックリンクを削除
make test-docker    # Docker環境でテスト
```

## 🎨 カスタマイズ

### ローカル設定の追加

Gitで管理されないローカル設定を追加する場合:

```bash
# Zshのローカル設定
vim ~/.zshrc.local
```

このファイルは自動的に読み込まれますが、Gitには含まれません。

### プラグインの追加

#### Zshプラグイン
`zsh/.zshrc`の`plugins=()`に追加してください。

#### Vimプラグイン
`vim/.vimrc`の`call plug#begin()`と`call plug#end()`の間に追加し、`:PlugInstall`を実行してください。

### asdfで新しい言語を追加

```bash
asdf plugin add <plugin-name>
asdf install <plugin-name> <version>
asdf global <plugin-name> <version>
```

## 🐛 トラブルシューティング

### oh-my-zshプラグインが見つからない

一部のプラグイン（zsh-autosuggestions、zsh-syntax-highlighting）は手動でインストールが必要な場合があります:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Vimプラグインがインストールされない

Vimを起動して以下を実行:

```vim
:PlugInstall
```

### asdfコマンドが見つからない

ターミナルを再起動するか、以下を実行:

```bash
source ~/.zshrc
```

### バックアップを復元したい

バックアップは`~/.config/backup/YYYYMMDD_HHMMSS/`に保存されています:

```bash
# 例: zshrcを復元
cp ~/.config/backup/20240101_120000/.zshrc.bak ~/.zshrc
```

## 🧹 アンインストール

```bash
cd ~/dotfiles
make clean
```

これにより、作成されたシンボリックリンクとインストールされたツールが削除されます。

---

最終更新: 2025-11-14
