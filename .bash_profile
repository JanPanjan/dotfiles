export PATH="$PATH:/home/pogacha/.local/share/JetBrains/Toolbox/scripts"

# https://github.com/conda/conda/issues/7855
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
alias pls='sudo !!'

COLOR_RED="\[\e[31m\]"
COLOR_CYAN="\[\e[36m\]"
COLOR_MAGENTA="\[\e[35m\]"
COLOR_WHITE="\[\e[37m\]"
COLOR_RESET="\[\e[0m\]" # Resets all formatting

# \u: username
# \h: hostname (short)
# \w: current working directory (full path)
# \$: displays # if root, $ otherwise
PS1="${COLOR_MAGENTA}\u@\h ${COLOR_CYAN}\w${COLOR_RESET}\n${COLOR_MAGENTA}->${COLOR_RESET} "

uwufetch

test -r '/home/pogacha/.opam/opam-init/init.sh' && . '/home/pogacha/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
eval $(opam env)
