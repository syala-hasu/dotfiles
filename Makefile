.PHONY: help install backup link clean asdf-install zsh-install zsh-default zsh-plugins-install vim-plugins-install docker-install tmux-install claude-install gemini-install codex-install check-deps

# デフォルトターゲット
help:
	@echo "利用可能なコマンド:"
	@echo "  install      - 依存関係チェック・設定ファイルのバックアップ・リンク作成・asdfインストールを実行"
	@echo "  check-deps   - 必要な依存関係（zsh等）をチェックしてインストール"
	@echo "  zsh-install  - zshをインストール"
	@echo "  zsh-default  - zshをデフォルトシェルに設定"
	@echo "  zsh-plugins-install - zshプラグインをインストール"
	@echo "  vim-plugins-install - Vimプラグインをインストール"
	@echo "  docker-install - Dockerをインストール"
	@echo "  tmux-install   - tmuxをインストール"
	@echo "  claude-install - Claude Code CLIをインストール"
	@echo "  gemini-install - Gemini CLIをインストール"
	@echo "  codex-install  - Codex CLIをインストール"
	@echo "  backup       - 既存の設定ファイルをバックアップ"
	@echo "  link         - 設定ファイルのシンボリックリンクを作成"
	@echo "  asdf-install - asdfのインストールと言語ツールのセットアップ"
	@echo "  clean        - 作成したシンボリックリンクを削除"


# メインインストール（依存関係チェックから開始）
install: check-deps zsh-plugins-install backup link asdf-install zsh-default
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

# zshプラグインのインストール
zsh-plugins-install:
	@echo "zshプラグインをインストールしています..."
	@mkdir -p ~/.zsh/plugins
	@if [ ! -d ~/.zsh/plugins/zsh-autosuggestions ]; then \
		git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions; \
		echo "zsh-autosuggestionsをインストールしました"; \
	else \
		echo "zsh-autosuggestionsは既にインストールされています"; \
	fi
	@if [ ! -d ~/.zsh/plugins/zsh-syntax-highlighting ]; then \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting; \
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

# tmuxのインストール
tmux-install:
	@echo "tmuxの存在確認中..."
	@if ! command -v tmux >/dev/null 2>&1; then \
		echo "tmuxが見つかりません。インストールしています..."; \
		if command -v apt-get >/dev/null 2>&1; then \
			sudo apt-get update && sudo apt-get install -y tmux; \
		elif command -v yum >/dev/null 2>&1; then \
			sudo yum install -y tmux; \
		elif command -v dnf >/dev/null 2>&1; then \
			sudo dnf install -y tmux; \
		elif command -v brew >/dev/null 2>&1; then \
			brew install tmux; \
		else \
			echo "パッケージマネージャーが見つかりません。手動でtmuxをインストールしてください。"; \
			exit 1; \
		fi; \
		echo "tmuxのインストールが完了しました"; \
	else \
		echo "tmuxは既にインストールされています"; \
		tmux -V; \
	fi

# AI CLI ツールのインストール
claude-install:
	@echo "Claude Code CLIの存在確認中..."
	@if ! command -v claude >/dev/null 2>&1; then \
		echo "Claude Code CLIが見つかりません。インストールしています..."; \
		npm install -g @anthropic-ai/claude-code; \
		echo "Claude Code CLIのインストールが完了しました"; \
	else \
		echo "Claude Code CLIは既にインストールされています"; \
		claude --version; \
	fi

gemini-install:
	@echo "Gemini CLIの存在確認中..."
	@if ! command -v gemini >/dev/null 2>&1; then \
		echo "Gemini CLIが見つかりません。インストールしています..."; \
		npm install -g @google/gemini-cli; \
		echo "Gemini CLIのインストールが完了しました"; \
	else \
		echo "Gemini CLIは既にインストールされています"; \
		gemini --version; \
	fi

codex-install:
	@echo "Codex CLIの存在確認中..."
	@if ! command -v codex >/dev/null 2>&1; then \
		echo "Codex CLIが見つかりません。インストールしています..."; \
		npm install -g @openai/codex; \
		echo "Codex CLIのインストールが完了しました"; \
	else \
		echo "Codex CLIは既にインストールされています"; \
		codex --version; \
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
	ln -sf $(CURDIR)/tmux/.tmux.conf ~/.tmux.conf
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
	@echo "asdfのインストールが完了しました"

# 完全クリーンアップ
clean:
	@echo "dotfilesの完全クリーンアップを実行しています..."
	@echo "シンボリックリンクを削除中..."
	@rm -f ~/.zshrc ~/.vimrc ~/.tool-versions ~/.asdfrc ~/.tmux.conf
	@rm -rf ~/.config/zsh
	@echo "asdfとインストール済みツールを削除中..."
	@rm -rf ~/.asdf
	@echo "バックアップフォルダを削除中..."
	@rm -rf ~/.config/backup
	@echo "完全クリーンアップ完了"

