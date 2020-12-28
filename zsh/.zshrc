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

export CLICOLOR=1

alias ll='ls -la'

# git
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '[%b]'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]'
zstyle ':vcs_info:git+set-message:*' hooks check_branch

function +vi-check_branch() {
if [[ ${hook_com[branch]} == "master" ]] ; then
  hook_com[branch]='%F{red}'${hook_com[branch]}'!!!!!%f'
elif [[ ${hook_com[branch]} == "develop" ]] ; then
  hook_com[branch]='%F{cyan}'${hook_com[branch]}'!%f'
fi
}
precmd () { vcs_info }

setopt prompt_subst
PROMPT='%B%K{white}%F{black}%D %*%k%f%b ${vcs_info_msg_0_}
%~ $ '

export PATH=$PATH:~/.dotfiles/bin
