
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
ZSH_DIR="$HOME/.config/zsh"
SHELL_DIR="$HOME/repo/shell_scripts/"
source $HOME/.config/zsh/zshrc

export PATH=/usr/local/bin:$PATH
