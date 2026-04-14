#!/bin/bash
# asdfプラグイン自動インストールスクリプト

set -e

ASDF="${ASDF_DATA_DIR:-$HOME/.asdf}/bin/asdf"

echo "asdfプラグインをインストール中..."

# プラグインリスト（"name url" の形式）
PLUGINS=(
    "nodejs https://github.com/asdf-vm/asdf-nodejs.git"
    "golang https://github.com/kennyp/asdf-golang.git"
    "github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git"
    "uv https://github.com/asdf-community/asdf-uv.git"
    "direnv https://github.com/asdf-community/asdf-direnv.git"
    "starship https://github.com/gr1m0h/asdf-starship.git"
    "eza https://github.com/lwiechec/asdf-eza.git"
    "zoxide https://github.com/aniaan/asdf-zoxide"
    "lazygit https://github.com/nklmilojevic/asdf-lazygit.git"
    "fzf https://github.com/kompiro/asdf-fzf.git"
)

for plugin_info in "${PLUGINS[@]}"; do
    read -r plugin_name plugin_url <<< "$plugin_info"

    if $ASDF plugin list | grep -q "^${plugin_name}$"; then
        echo "  $plugin_name: 既にインストール済み"
    else
        echo "  $plugin_name: インストール中..."
        $ASDF plugin add "$plugin_name" "$plugin_url" || echo "  $plugin_name: スキップ（インストール失敗）"
    fi
done

echo "プラグインインストール完了"
