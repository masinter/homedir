# ~/.zshrc: executed by zsh(1) for non-login shells.

echo running .zshrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export LOGINDIR=~/il
export OSTYPE="darwin"

# Make completion menu behave like Debian's (display options in columns)
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # Use terminal colors for completion list

# Auto-correct commands if possible (similar to Debian)
setopt correctall

# Case-insensitive completion (similar to Debian)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

