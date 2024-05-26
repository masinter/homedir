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
