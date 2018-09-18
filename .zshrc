export LANG=ja_JP.UTF-8
  
# histroty
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 重複を履歴に残さない
setopt hist_ignore_dups
setopt hist_ignore_all_dups

setopt nonomatch

#prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%b'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

color1="030"
color2="115"
color3="231"

username="%K{$color1}%F{255} $(echo '\uf007') $(git config user.name) %f%k%K{$color2}%F{$color1}`echo '\uE0B0'`%f%k"
dir="%K{$color2}%F{237} `echo '\uf07c '`%~ %f%k%K{$color3}%F{$color2}`echo '\uE0B0'`%f%k"
branch="%K{$color3}%F{237}%1(v|`echo ' \ue725'` %1v|) %f%k%K{232}%F{$color3}`echo '\uE0B0'`%f%k"
 
PROMPT="$username$dir$branch
$"

# ls
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -G"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# pyenv
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# terraform
export PATH="$HOME/.terraform/bin:$PATH"

# my script
export PATH="$HOME/dev/switch/bin:$PATH"

#alias
alias chrome='open -a "Google Chrome"'
