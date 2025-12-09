.PHONY: help install backup link clean asdf-install zsh-install zsh-default oh-my-zsh-install zsh-plugins-install vim-plugins-install docker-install claude-install check-deps test-docker test-docker-build

# デフォルトターゲット
help:
	@echo "利用可能なコマンド:"
	@echo "  install      - 依存関係チェック・設定ファイルのバックアップ・リンク作成・asdfインストールを実行"
	@echo "  check-deps   - 必要な依存関係（zsh等）をチェックしてインストール"
	@echo "  zsh-install  - zshをインストール"
	@echo "  zsh-default  - zshをデフォルトシェルに設定"
	@echo "  oh-my-zsh-install - oh-my-zshをインストール"
	@echo "  zsh-plugins-install - zshプラグインをインストール"
	@echo "  vim-plugins-install - Vimプラグインをインストール"
	@echo "  docker-install - Dockerをインストール"
	@echo "  claude-install - Claude Code CLIをインストール"
	@echo "  backup       - 既存の設定ファイルをバックアップ"
	@echo "  link         - 設定ファイルのシンボリックリンクを作成"
	@echo "  asdf-install - asdfのインストールと言語ツールのセットアップ"
	@echo "  clean        - 作成したシンボリックリンクを削除"
	@echo "  test-docker-build - Dockerテスト環境をビルド"
	@echo "  test-docker  - Dockerでdotfilesのインストールをテスト"

# メインインストール（依存関係チェックから開始）
install: check-deps oh-my-zsh-install zsh-plugins-install backup link asdf-install vim-plugins-install zsh-default
	@echo "dotfilesのインストールが完了しました！"

# 依存関係のチェックとインストール
check-deps: zsh-install
	@echo "依存関係のチェックが完了しました"

# zshのインストール
zsh-install:
	@echo "zshの存在確認中..."
	@if ! command -v zsh >/dev/null 2>&1; then \
		echo "zshが見つかりません。インストールしています..."; \
		if command -v apt-get >/dev/null 2>&1; then \
			sudo apt-get update && sudo apt-get install -y zsh; \
		elif command -v yum >/dev/null 2>&1; then \
			sudo yum install -y zsh; \
		elif command -v dnf >/dev/null 2>&1; then \
			sudo dnf install -y zsh; \
		elif command -v brew >/dev/null 2>&1; then \
			brew install zsh; \
		else \
			echo "パッケージマネージャーが見つかりません。手動でzshをインストールしてください。"; \
			exit 1; \
		fi; \
		echo "zshのインストールが完了しました"; \
	else \
		echo "zshは既にインストールされています"; \
	fi

# oh-my-zshのインストール
oh-my-zsh-install:
	@echo "oh-my-zshの存在確認中..."
	@if [ ! -d ~/.oh-my-zsh ]; then \
		echo "oh-my-zshが見つかりません。インストールしています..."; \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
		echo "oh-my-zshのインストールが完了しました"; \
	else \
		echo "oh-my-zshは既にインストールされています"; \
	fi

# zshプラグインのインストール
zsh-plugins-install:
	@echo "zshプラグインをインストールしています..."
	@if [ ! -d $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then \
		git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions; \
		echo "zsh-autosuggestionsをインストールしました"; \
	else \
		echo "zsh-autosuggestionsは既にインストールされています"; \
	fi
	@if [ ! -d $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting; \
		echo "zsh-syntax-highlightingをインストールしました"; \
	else \
		echo "zsh-syntax-highlightingは既にインストールされています"; \
	fi
	@echo "zshプラグインのインストールが完了しました"

# zshをデフォルトシェルに設定
zsh-default:
	@echo "zshをデフォルトシェルに設定しています..."
	@if [ "$$(basename "$$SHELL")" != "zsh" ]; then \
		ZSH_PATH=$$(which zsh); \
		if grep -q "$$ZSH_PATH" /etc/shells; then \
			chsh -s "$$ZSH_PATH"; \
			echo "デフォルトシェルをzshに変更しました ($$ZSH_PATH)"; \
			echo "変更を反映するには、ターミナルを再起動してください"; \
		else \
			echo "zshが/etc/shellsに登録されていません。追加しています..."; \
			echo "$$ZSH_PATH" | sudo tee -a /etc/shells; \
			chsh -s "$$ZSH_PATH"; \
			echo "デフォルトシェルをzshに変更しました ($$ZSH_PATH)"; \
			echo "変更を反映するには、ターミナルを再起動してください"; \
		fi; \
	else \
		echo "既にzshがデフォルトシェルに設定されています"; \
	fi

# Dockerのインストール
docker-install:
	@echo "Dockerの存在確認中..."
	@if ! command -v docker >/dev/null 2>&1; then \
		echo "Dockerが見つかりません。インストールしています..."; \
		if command -v apt-get >/dev/null 2>&1; then \
			curl -fsSL https://get.docker.com -o get-docker.sh; \
			sudo sh get-docker.sh; \
			rm get-docker.sh; \
			sudo usermod -aG docker $$USER; \
			echo "Dockerのインストールが完了しました"; \
			echo "Dockerを使用するには、ログアウト後に再ログインしてください"; \
		elif command -v yum >/dev/null 2>&1 || command -v dnf >/dev/null 2>&1; then \
			curl -fsSL https://get.docker.com -o get-docker.sh; \
			sudo sh get-docker.sh; \
			rm get-docker.sh; \
			sudo systemctl start docker; \
			sudo systemctl enable docker; \
			sudo usermod -aG docker $$USER; \
			echo "Dockerのインストールが完了しました"; \
			echo "Dockerを使用するには、ログアウト後に再ログインしてください"; \
		elif command -v brew >/dev/null 2>&1; then \
			brew install --cask docker; \
			echo "Docker Desktopのインストールが完了しました"; \
			echo "Docker Desktopを起動してセットアップを完了してください"; \
		else \
			echo "パッケージマネージャーが見つかりません。手動でDockerをインストールしてください。"; \
			echo "詳細: https://docs.docker.com/get-docker/"; \
			exit 1; \
		fi; \
	else \
		echo "Dockerは既にインストールされています"; \
	fi

# Claude Code CLIのインストール
claude-install:
	@echo "Claude Code CLIの存在確認中..."
	@if ! command -v claude >/dev/null 2>&1; then \
		echo "Claude Code CLIが見つかりません。インストールしています..."; \
		curl -fsSL https://claude.ai/install.sh | bash; \
		echo "Claude Code CLIのインストールが完了しました"; \
		echo "ターミナルを再起動するか、'source ~/.zshrc' を実行してください"; \
	else \
		echo "Claude Code CLIは既にインストールされています"; \
		claude --version; \
	fi

# 既存設定ファイルのバックアップ
backup:
	@echo "既存の設定ファイルをバックアップしています..."
	@mkdir -p ~/.config/backup/$(shell date +%Y%m%d_%H%M%S)
	@if [ -f ~/.zshrc ]; then cp ~/.zshrc ~/.config/backup/$(shell date +%Y%m%d_%H%M%S)/.zshrc.bak; fi
	@if [ -f ~/.vimrc ]; then cp ~/.vimrc ~/.config/backup/$(shell date +%Y%m%d_%H%M%S)/.vimrc.bak; fi
	@if [ -f ~/.tool-versions ]; then cp ~/.tool-versions ~/.config/backup/$(shell date +%Y%m%d_%H%M%S)/.tool-versions.bak; fi
	@echo "バックアップ完了"

# Vimプラグインのインストール
vim-plugins-install:
	@echo "Vimプラグインをインストールしています..."
	@if [ -f ~/.vim/autoload/plug.vim ]; then \
		vim +PlugInstall +qall 2>/dev/null || echo "Vimプラグインのインストールが完了しました"; \
	else \
		echo "vim-plugがまだインストールされていません。Vimを一度起動してください"; \
	fi

# シンボリックリンクの作成
link:
	@echo "設定ファイルのシンボリックリンクを作成しています..."
	@mkdir -p ~/.config/zsh
	ln -sf $(CURDIR)/zsh/.zshrc ~/.zshrc
	ln -sf $(CURDIR)/zsh/exports.zsh ~/.config/zsh/exports.zsh
	ln -sf $(CURDIR)/zsh/aliases.zsh ~/.config/zsh/aliases.zsh
	ln -sf $(CURDIR)/zsh/plugins.zsh ~/.config/zsh/plugins.zsh
	@mkdir -p ~/.vim
	ln -sf $(CURDIR)/vim/.vimrc ~/.vimrc
	ln -sf $(CURDIR)/vim/coc-settings.json ~/.vim/coc-settings.json
	ln -sf $(CURDIR)/asdf/.tool-versions ~/.tool-versions
	ln -sf $(CURDIR)/asdf/.asdfrc ~/.asdfrc
	@echo "シンボリックリンク作成完了"

# asdfのインストール
asdf-install:
	@echo "asdfをインストールしています..."
	@if [ ! -d ~/.asdf ]; then \
		git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1; \
	fi
	@echo "asdfプラグインを追加しています..."
	@chmod +x $(CURDIR)/asdf/install-plugins.sh
	@$(CURDIR)/asdf/install-plugins.sh
	@echo "言語ツールをインストールしています..."
	@~/.asdf/bin/asdf install || echo "一部のツールは既にインストール済みです"
	@echo "lazygitをインストールしています..."
	@export PATH="$$HOME/.asdf/shims:$$PATH" && go install github.com/jesseduffield/lazygit@latest || echo "lazygitインストールをスキップ"
	@echo "asdfのインストールが完了しました"

# 完全クリーンアップ
clean:
	@echo "dotfilesの完全クリーンアップを実行しています..."
	@echo "シンボリックリンクを削除中..."
	@rm -f ~/.zshrc ~/.vimrc ~/.tool-versions ~/.asdfrc
	@rm -rf ~/.config/zsh
	@echo "asdfとインストール済みツールを削除中..."
	@rm -rf ~/.asdf
	@echo "バックアップフォルダを削除中..."
	@rm -rf ~/.config/backup
	@echo "完全クリーンアップ完了"

# Dockerテスト環境のビルド
test-docker-build: docker-install
	@echo "Dockerテスト環境をビルドしています..."
	docker build -t dotfiles-test .
	@echo "Dockerイメージのビルドが完了しました"

# Dockerでのテスト実行
test-docker: docker-install test-docker-build
	@echo "Dockerでdotfilesのインストールテストを実行しています..."
	docker run --rm -v $(CURDIR):/home/testuser/dotfiles dotfiles-test
	@echo "Dockerテストが完了しました"