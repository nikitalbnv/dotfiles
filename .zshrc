
# ========================
# Oh My Zsh
# ========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="typewritten"
plugins=(tmux git zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# ========================
# Appearance and colors
# ========================
ENABLE_CORRECTION="true"

# Gruvbox syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[comment]='fg=white'

# Gruvbox LS_COLORS
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32"

# ========================
# Keybindings to match Ghostty
# ========================
bindkey -e
bindkey '^[\x7f' backward-kill-word   # Ctrl+Backspace
bindkey '^[[3;5~' kill-word           # Ctrl+Delete
bindkey '^[[1;5D' backward-word       # Ctrl+Left
bindkey '^[[1;5C' forward-word        # Ctrl+Right


# ========================
# Editor and aliases
# ========================
export EDITOR=nvim
export VISUAL=nvim

alias reload='source ~/.zshrc'
alias vi='nvim'
alias vim='nvim'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias q='exit'
alias :q='exit'
alias update='_ pacman -Syu && yay -Syu'
alias brightness="ddcutil -b 14 setvcp 10 "
alias g++23='g++ -std=c++23 -Wall -Wextra'

# Terminal-based Brightness Control
bright() {
    if [ -z "$1" ]; then
        ddcutil -b 14 getvcp 10
        brightnessctl get
    else
        ddcutil -b 14 setvcp 10 "$@"
        if [ "$1" = "+" ]; then
            brightnessctl set "+${2}%"
        elif [ "$1" = "-" ]; then
            brightnessctl set "${2}%-"
        else
            brightnessctl set "${1}%"
        fi
    fi
}
. "$HOME/.local/share/../bin/env"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$HOME/.local/bin:$PATH


eval "$(zoxide init zsh)"


export PNPM_HOME="/home/nikita/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="/home/nikita/.cache/.bun/bin:$PATH"
export PATH="$HOME/.fly/bin:$PATH"

# Auto-start OpenClaw browser if not running
if ! pgrep -f "openclaw-browser" > /dev/null 2>&1; then
    (openclaw browser start > /dev/null 2>&1 &)
fi

# OpenClaw Completion
source "/home/nikita/.openclaw/completions/openclaw.zsh"
