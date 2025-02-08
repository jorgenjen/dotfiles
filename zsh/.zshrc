source /usr/share/zinit/zinit.zsh

# You need zinit installed $(sudo pacman -S zinit)
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode # ice passes argument into next command (after ;) 
                                                      # could also be on newline

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab # Requires fzf to be isntalled (Instlled through nvim dpendencies for me I think...)
zinit light zsh-users/zsh-history-substring-search # Better search


# Snippets from Oh my zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
# Currently don't need these
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx


# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=100000 # Keep my stuff :D
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history  # Ensure the history is saved to this file

# HISTDUP=erase # Remove duplicate commands from history
setopt appendhistory
setopt sharehistory
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Can be used to not store commands to history by adding space to start
# setopt hist_ignore_space 

# Bind 'j' and 'k' in normal to search based no substring
bindkey -M vicmd 'k' history-substring-search-up  
bindkey -M vicmd 'j' history-substring-search-down
# Basic only matching start 
# bindkey -M vicmd 'k' history-beginning-search-backward
# bindkey -M vicmd 'j' history-beginning-search-forward

# Insert mode
bindkey -M viins '^[[A' history-substring-search-up   # Up arrow
bindkey -M viins '^[[B' history-substring-search-down # Down arrow

# Normal mode
bindkey -M vicmd '^[[A' history-substring-search-up   # Up arrow
bindkey -M vicmd '^[[B' history-substring-search-down # Down arrow

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias v='nvim'
alias vim='nvim'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'


bindkey '^R' fzf-history-widget # This does not work hence TODO below

# TODO: Fix problem with ctrl+r does not use fzftab fancy UI for first run
# in a terminal it has to be used a second time for it to work
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"


# Add starship prompt
eval "$(starship init zsh)"
