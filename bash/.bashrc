echo ""
echo ""
echo " ____    __    ____  _______  __        ______   ______   .___  ___.  _______  "
echo " \   \  /  \  /   / |   ____||  |      /      | /  __  \  |   \/   | |   ____| "
echo "  \   \/    \/   /  |  |__   |  |     |  ,----'|  |  |  | |  \  /  | |  |__    "
echo "   \            /   |   __|  |  |     |  |     |  |  |  | |  |\/|  | |   __|   "
echo "    \    /\    /    |  |____ |  '----.|  '----.|  '--'  | |  |  |  | |  |____  "
echo "     \__/  \__/     |_______||_______| \______| \______/  |__|  |__| |_______| "
echo ""
echo ""

# import util #######
dir_path=~/dotfiles/bash/util
dirs=`find $dir_path -type f`
for dir in $dirs;
do
  . $dir
done
#####################

# alias
export OS=`get_os`
if [ $OS = "Mac" ] ; then
  alias ls='ls -G'
  stty stop undef
  stty start undef
elif [ $OS = "Linux" ] ; then
  alias ls='ls --color=always'
  stty stop undef
  stty start undef
fi

alias ll='ls -la'
alias bash_edit='vim ~/.bashrc && source ~/.bashrc'
alias vim_plug='vim ~/dotfiles/vim/config/init/plugin.vim && vim +":PlugClean" +":PlugInstall" +":qa"'
alias vimrc_count='cat ~/dotfiles/vim/config/**/*.vim | grep -v -e "^\"" -e "^$" | wc -l'

if exist_command docker-compose; then
  alias dc='docker-compose'
fi

export LSCOLORS=gxfxcxdxbxegexabagacad
export LANG=ja_JP.UTF-8

# git
source ~/.git-completion
source ~/.git-prompt

dispatch () {
  export EXIT_STATUS="$?" # 直前のコマンド実行結果のエラーコードを保存
}
export PROMPT_COMMAND=dispatch

export PS1='\[\e[1;33m\]./\W \[\e[1;34m\]\t\[\e[1;35m\]$(__git_ps1) \[\e[m\]\r\n\033[1;30;47m`get_face`.oO(\h) \033[m '
