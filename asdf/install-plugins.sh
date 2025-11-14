#!/bin/bash
# asdfプラグイン自動インストールスクリプト

set -e

echo "🔧 asdfプラグインをインストール中..."

# プラグインリスト
PLUGINS=(
    "nodejs https://github.com/asdf-vm/asdf-nodejs.git"
    "python"
    "golang https://github.com/kennyp/asdf-golang.git"
    "java"
    "github-cli"
)

for plugin_info in "${PLUGINS[@]}"; do
    read -r plugin_name plugin_url <<< "$plugin_info"
    
    if asdf plugin list | grep -q "^${plugin_name}$"; then
        echo "✅ ${plugin_name} プラグインは既にインストール済み"
    else
        echo "📦 ${plugin_name} プラグインをインストール中..."
        if [ -n "$plugin_url" ]; then
            asdf plugin add "$plugin_name" "$plugin_url" || true
        else
            asdf plugin add "$plugin_name" || true
        fi
    fi
done

echo "🎉 プラグインインストール完了！"