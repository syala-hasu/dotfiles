# エイリアス設定

# ls系コマンドの拡張（eza）
alias ls="eza"
alias ll="eza -la --git"
alias la="eza -a"
alias l="eza -l"
alias lt="eza --tree"

# grep系コマンドに色付け
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# よく使うコマンドの短縮形
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# git関連
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph"

# 安全性を高めるエイリアス
alias cp="cp -i"
alias mv="mv -i"

# その他便利なエイリアス
alias h="history"
alias c="clear"
