# Based on Steve Losh's prose theme
# https://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme

if [ "x$OH_MY_ZSH_HG" = "x" ]; then
    OH_MY_ZSH_HG="hg"
fi

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    $OH_MY_ZSH_HG prompt --angle-brackets "\
< on %B%{$FG[197]%}<branch>%B%{$reset_color%}>\
< at %B%{$FG[208]%}<tags|%B%{$reset_color%}, %B%{$FG[208]%}>%B%{$reset_color%}>\
%B%{$FG[227]%}<status|modified|unknown><update>%B%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%B%{$FG[208]%})|post_applied(%B%{$reset_color%})|pre_unapplied(%B%{$FG[black]%})|post_unapplied(%B%{$reset_color%})>>" 2>/dev/null
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

PROMPT='
%B%{$FG[197]%}%n%b%{$reset_color%} at %B%{$FG[208]%}$(box_name)%b%{$reset_color%} in %B%{$FG[227]%}${PWD/$HOME/~}%b%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)$(git_prompt_status)$(git_remote_status)
%B%{$FG[141]%}$(virtualenv_info)%b%{$reset_color%}%(?,,%{${FG[256]}%}[%?]%{$reset_color%} )$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %B%{$FG[118]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$reset_color%}"

# see .oh-my-zsh/lib/git.zsh for the rest of the variables that you can set
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[081]%}%B✚%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[081]%}%B✹%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[081]%}%B✖%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[081]%}%B➜%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[081]%}%B═%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[081]%}%B!%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[081]%}%B?%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_status="%B%{$FG[001]%}%(?..✘)%b%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'
