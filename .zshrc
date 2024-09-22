# export PATH="$HOME/.cargo/bin:$PATH"
#
# eval "$(starship init zsh)"
# eval "$(zoxide init zsh)"
# source <(fzf --zsh)
# ZSH_DIR="$HOME/.config/zsh"
# SHELL_DIR="$HOME/repo/shell_scripts/"
# source $HOME/.config/zsh/zshrc
#
# export PATH="/usr/local/bin:$PATH"
#

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/local/share/go/bin:$HOME/.miniconda/bin:/usr/local/bin:/usr/bin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

if [ -f "$HOME/.config/zsh/zsh-exports" ]; then
    source "$HOME/.config/zsh/zsh-exports"
fi

if [ -f "$HOME/.config/zsh/zsh-aliases" ]; then
    source "$HOME/.config/zsh/zsh-aliases"
fi

if [ -f "$HOME/.config/zsh/zsh-functions" ]; then
    source "$HOME/.config/zsh/zsh-functions"
fi

