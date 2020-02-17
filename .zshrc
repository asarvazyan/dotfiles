# ZSH CONFIG

# Path to oh-my-zsh installation.
export ZSH="/home/nauti/.oh-my-zsh"

# Set theme
# ZSH_THEME="gallois"

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "minimal" )

# Plugin list
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Enable colors 
autoload -U colors && colors

# LEFT PROMPT
# PROMPT="%B%F{blue}%#%f%b "
PS1="%B%{$fg_bold[red]%}[%{$fg_bold[yellow]%}%n%{$fg_bold[white]%}:%{$fg_bold[green]%}%1~%{$fg_bold[red]%}]%{$reset_color%}$%b "
PS2=PS1
PS3=PS1
PS4=PS1

# RIGHT PROMPT
# RPROMPT="%B%F{blue}%n%f %F{purple}%1~%f%b"

git_custom_status() {
	
	# Customized git status (see gallois ohmyzsh theme)
	ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg_bold[red]%}[%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg_bold[red]%}]%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}*%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_CLEAN=""

	local cb=$(git_current_branch)
	if [ -n "$cb" ]; then
		echo "$(parse_git_dirty)%{$fg_bold[white]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
	fi
}
# Add vim mode on right prompt and modify cursor (mode dependant)
# TODO: add git status to the right of vim status
function zle-line-init zle-keymap-select {
	# NORMAL and INSERT mode prompts
	VIM_NORMAL="%{$fg_bold[red]%}[%{$fg_bold[yellow]%}NORMAL%{$fg_bold[red]%}]% %{$reset_color%}"
	VIM_INSERT="%{$fg_bold[red]%}[%{$fg_bold[yellow]%}INSERT%{$fg_bold[red]%}]% %{$reset_color%}"	
	
	# Dynamic right prompt (depends on mode)
	RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}$(git_custom_status)" 
    RPS2=$RPS1
	
	# Modify cursor depending on mode
	case $KEYMAP in
	vicmd) print -rn -- $terminfo[cvvis];; # block cursor
	viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
	esac
   	
	# Redraw current prompt
	zle reset-prompt
}

# Show widgets
zle -N zle-line-init
zle -N zle-keymap-select

# Remove padding
ZLE_RPROMPT_INDENT=0
# History
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Variables
export BROWSER="firefox"
export EDITOR="vim"
export PATH="$HOME/Scripts:$PATH"

# Aliasing
alias ls="ls --color"
alias ll="ls --color"
alias sl="ls --color"
alias la="ls --la"
alias :q="exit"

# Auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION # Separate path for .zcompdump files
_comp_options+=(globdots)	# Include hidden files.

# vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# history searching
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# zle-keymap-select () {
#case $KEYMAP in
#vicmd) print -rn -- $terminfo[cvvis];; # block cursor
#viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
#esac
#}

#zle -N zle-keymap-select
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
