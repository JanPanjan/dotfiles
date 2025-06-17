
# ------------------------------------------
# https://github.com/conda/conda/issues/7855
# ------------------------------------------
if [ 1 -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pogacha/programs/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pogacha/programs/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pogacha/programs/miniconda3/bin:$PATH"
    fi
fi

alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'
alias cat='bat'
alias v='nvim'
alias R='R --no-save -q'
alias todo='nvim ~/.config/TODO.md'
alias cfg='nvim ~/.config'
alias faks='cd ~/progAAAAAAA/faks'
alias dev='cd ~/progAAAAAAA/dev'
alias art='cd ~/progAAAAAAA/art'

# Zsh does not need explicit color variables like Bash for basic colors.
# $0: shell
# %K: background
# %F{magenta} - sets foreground to magenta
# %F{#ffffff} - sets foreground to white
# %f - resets foreground color
# %n - username
# %m - hostname (short)
# %~ - current working directory (tildified, e.g., ~/documents)
# \n - newline
# %# - prompt character (defaults to % for regular user, # for root)
PROMPT="%F{magenta}%n@%m %F{cyan}%~%f
%F{magenta}->%f "

test -r '/home/pogacha/.opam/opam-init/init.sh' && . '/home/pogacha/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# eval $(opam env)

bindkey -v

# ----------------------------------------------------------------------
# https://github.com/BreadOnPenguins/dots/blob/master/.config/zsh/.zshrc
# ----------------------------------------------------------------------
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# NEWLINE=$'\n'
# PROMPT="${NEWLINE}%K{#32302f}%F{#d5c4a1} $0 %K{#3c3836}%F{#d5c4a1} %n %K{#504945} %~ %f%k ❯ " # warmer theme
# echo -e "${NEWLINE}\x1b[38;5;137m\x1b[48;5;0m it's$(date +%_I:%M%P) \x1b[38;5;180m\x1b[48;5;0m $(uptime -p | cut -c 4-) \x1b[38;5;223m\x1b[48;5;0m $(uname -r) \033[0m" # warmer theme
