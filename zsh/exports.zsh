# 環境変数とPATH設定

# asdf（言語バージョン管理ツール）の設定
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Go環境変数設定
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# ローカルbinディレクトリをPATHに追加
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# 言語設定
export LANG=en_US.UTF-8
export LC_ALL=C.UTF-8  # Fix locale for gcalcli and other tools

# エディタ設定
export EDITOR=vim
export VISUAL=$EDITOR

# ページャ設定
export PAGER=less