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
alias todo='nvim ~/TODO.md'
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
NEWLINE=$'\n'
# sign="❯"
sign=">"

green1="#acddaa"
green2="#93c591"
green3="#76af74"
gray1="#252525"
gray2="#171717"
gray3="#101010"

### define main colors here
a_light=$green1
b_light=$green2
c_light=$green3

a_dark=$gray1
b_dark=$gray2
c_dark=$gray3

text_light="#333333"
text_dark="#aaaaaa"

### this is what sed will change
cur_main1=$a_light
cur_main2=$b_light
cur_main3=$c_light
cur_text=$text_light

PROMPT="${NEWLINE}%K{$cur_main1}%F{$cur_text} $0 %K{$cur_main2}%F{$cur_text} %n %K{$cur_main3}%F{$cur_text} %~ %f%k ${sign} "
# PROMPT="%F{magenta}%n@%m %F{cyan}%~%f${NEWLINE}%F{magenta}-${sign}%f "

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

# -----------------------------------------------------------
# https://github.com/junegunn/fzf/wiki/examples#opening-files
# -----------------------------------------------------------
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --preview="bat --color=always {}"))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}
