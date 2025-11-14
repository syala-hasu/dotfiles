# Ubuntu LTSベースでdotfilesのテスト環境
FROM ubuntu:22.04

# 非対話モードに設定
ENV DEBIAN_FRONTEND=noninteractive

# 最小限のパッケージのみインストール
RUN apt-get update && apt-get install -y \
    curl \
    git \
    sudo \
    vim \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# テストユーザーの作成
RUN useradd -m -s /bin/bash testuser && \
    echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# ユーザーを切り替え
USER testuser
WORKDIR /home/testuser

# dotfilesディレクトリを作成してコピー用に準備
RUN mkdir -p /home/testuser/dotfiles

# 作業ディレクトリを設定
WORKDIR /home/testuser/dotfiles

# デフォルトコマンド（テスト実行）
CMD ["make", "install"]