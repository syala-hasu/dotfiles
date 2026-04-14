#!/bin/bash
# asdfプラグイン自動インストールスクリプト

set -e

ASDF="${ASDF_DATA_DIR:-$HOME/.asdf}/bin/asdf"

echo "🔧 asdfプラグインをインストール中..."

# プラグインリスト
PLUGINS=(
    "nodejs https://github.com/asdf-vm/asdf-nodejs.git"
    "python"
    "golang https://github.com/kennyp/asdf-golang.git"
    "github-cli"
    "uv"
    "direnv"
    "starship"
    "eza"
    "zoxide"
    "lazygit"
    "fzf"
)

for plugin_info in "${PLUGINS[@]}"; do
    read -r plugin_name plugin_url <<< "$plugin_info"

    if $ASDF plugin list | grep -q "^${plugin_name}$"; then
        echo "✅ ${plugin_name} プラグインは既にインストール済み"
    else
        echo "📦 ${plugin_name} プラグインをインストール中..."
        if [ -n "$plugin_url" ]; then
            $ASDF plugin add "$plugin_name" "$plugin_url" || true
        else
            $ASDF plugin add "$plugin_name" || true
        fi
    fi
done

echo "🎉 プラグインインストール完了！"
