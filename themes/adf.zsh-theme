BAT_CHARGE="$HOME/bin/batcharge.py"

RPROMPT_BAT='%(?..%{$fg_bold[red]%}(%?%)) $(battery_charge) %{$reset_color%}%{$FG[000]%}%D{%F} %*%{$reset_color%}'
RPROMPT_NOBAT='%(?..%{$fg_bold[red]%}(%?%)) %{$reset_color%}%{$FG[000]%}%D{%F} %*%{$reset_color%}'

if [[ `uname` = Darwin ]]; then
	# hide user@host when running on darwin/local
	PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}${PWD/#$HOME/~} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
	if [[ -x $BAT_CHARGE ]]; then
		# show a battery charge indicator when on os x when the battery script can be found
		RPROMPT=$RPROMPT_BAT
	else
		RPROMPT=$RPROMPT_NOBAT
	fi
else 
	PROMPT='%{$FG[000]%}%n%{$reset_color%}%{$FG[145]%}@%{$reset_color%}%{$FG[203]%}%m%{$reset_color%} %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}${PWD/#$HOME/~} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
	RPROMPT=$RPROMPT_NOBAT
fi

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function battery_charge {
	echo `$BAT_CHARGE` 2>/dev/null
}
