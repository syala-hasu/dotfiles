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
if [ $OS = "Mac" ] ; then
  alias ls='ls -G'
elif [ $OS = "Linux" ] ; then
  alias ls='ls --color=always'
  stty stop undef
fi

alias ll='ls -la'
alias bash_edit='vim ~/.bashrc && source ~/.bashrc'
alias vim_plug='vim ~/dotfiles/vim/config/plugin/00_plugin_list.vim && vim +":PlugInstall" +":qa"'

export LSCOLORS=gxfxcxdxbxegexabagacad
