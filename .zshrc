export PATH=$PATH:/usr/local/go/bin

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

source "$HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"


# bun completions
[ -s "/home/vegapunk/.bun/_bun" ] && source "/home/vegapunk/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
