# Oh My Zshのインストールパス
export ZSH="$HOME/.oh-my-zsh"

# 使用するテーマを設定
ZSH_THEME="agnoster"

# プラグインの設定
# 標準プラグインは $ZSH/plugins/ にあります
# カスタムプラグインは $ZSH_CUSTOM/plugins/ に追加できます
# プラグインが多すぎるとシェルの起動が遅くなるので注意
plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages command-not-found)

source $ZSH/oh-my-zsh.sh

# 履歴設定
HISTSIZE=1000
HISTFILESIZE=2000

# 追加設定ファイルの読み込み
[ -f "$HOME/.config/zsh/exports.zsh" ] && source "$HOME/.config/zsh/exports.zsh"
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh" 
[ -f "$HOME/.config/zsh/plugins.zsh" ] && source "$HOME/.config/zsh/plugins.zsh"

# ローカル設定の読み込み（gitで管理しない）
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
