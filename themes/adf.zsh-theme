BAT_CHARGE="$HOME/bin/batcharge.py"

USER_COLOR=$FG[252]
AT_COLOR=$FG[239]
HOST_COLOR=$FG[252]
DATE_COLOR=$FG[239]
DIR_COLOR=$FG[221]
PROMPT_COLOR=$FG[009]

# user@host portion of the prompt
USER_HOME='%{$USER_COLOR%}%n%{$reset_color%}%{$AT_COLOR%}@%{$reset_color%}%{$HOST_COLOR%}%m%{$reset_color%}'
# main prompt
MAIN_PROMPT='%{$PROMPT_COLOR%}>%{$fg_bold[green]%}%p %{$DIR_COLOR%}${PWD/#$HOME/~} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# right prompt with battery indicator
RPROMPT_BAT='%(?..%{$fg_bold[red]%}(%?%)) $(battery_charge) %{$reset_color%}%{$DATE_COLOR%}%D{%F} %*%{$reset_color%}'
# right prompt sans batter indicator
RPROMPT_NOBAT='%(?..%{$fg_bold[red]%}(%?%)) %{$reset_color%}%{$DATE_COLOR%}%D{%F} %*%{$reset_color%}'

if [[ `uname` = Darwin ]]; then
	# hide user@host when running on darwin/local
	PROMPT=$MAIN_PROMPT
	if [[ -x $BAT_CHARGE ]]; then
		# show a battery charge indicator when on os x when the battery script can be found
		RPROMPT=$RPROMPT_BAT
	else
		RPROMPT=$RPROMPT_NOBAT
	fi
else 
	PROMPT="$USER_HOME $MAIN_PROMPT"
	RPROMPT=$RPROMPT_NOBAT
fi

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function battery_charge {
	echo `$BAT_CHARGE` 2>/dev/null
}
