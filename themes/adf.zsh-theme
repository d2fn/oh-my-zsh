#if [[ `uname` = Darwin ]]; then
#  PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}${PWD/#$HOME/~} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
#else 
  PROMPT='%{$FG[000]%}%n%{$reset_color%}%{$FG[145]%}@%{$reset_color%}%{$FG[203]%}%m%{$reset_color%} %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}${PWD/#$HOME/~} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
#fi

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
