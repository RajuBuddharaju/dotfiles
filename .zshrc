# --- Basic safety check ---
[[ $- != *i* ]] && return

# --- Colors and Prompt Substitution ---
autoload -Uz colors && colors
setopt PROMPT_SUBST

# --- Optimized Git Branch Function ---
parse_git_branch() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
      echo "%F{cyan} $branch%f"  #  = nice branch icon
    fi
  fi
}

# --- Prompt Setup ---
PROMPT='%F{yellow}[%*]%f %F{magenta}%n%f@%F{magenta}%m%f %F{white}➜%f %F{blue}%~%f $(parse_git_branch)
%F{green}❯%f '
# ➜ = fancy right arrow, ❯ = nicer prompt arrow

# --- Terminal Title (optional but nice) ---
case "$TERM" in
  xterm*|rxvt*)
    precmd() { print -Pn "\e]0;%n@%m: %~\a" }
    ;;
esac

# --- Aliases ---

# List commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git commands
alias gs='git status --short'

alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"

alias ga='git add'
alias gap='git add --patch'

alias gc='git commit'

alias gp='git push'
alias gu='git pull'

alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias gb='git branch'

alias gi='git init'
alias gco='git checkout'
alias gcl='git clone'

# --- Zoxide (better cd) ---
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

# --- Eza (better ls) ---
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --long --git --group-directories-first --icons"
  alias tree="eza --tree --icons=always"
fi

# --- Bat (better cat) ---
if command -v batcat >/dev/null 2>&1; then
  alias bat="batcat"
  alias cat="batcat --paging=never"
fi

# --- Homebrew ---
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# --- Gurobi ---
export GUROBI_HOME="/opt/gurobi12.0.2/linux64"
export PATH="$GUROBI_HOME/bin:$PATH"
export LD_LIBRARY_PATH="$GUROBI_HOME/lib:$LD_LIBRARY_PATH"
export CLASSPATH="$GUROBI_HOME/lib/gurobi.jar:."


# --- NVM Load Command ---
alias nvmload='source ~/.nvm/nvm.sh'

# --- Pipx ---
export PATH="$PATH:$HOME/.local/bin"

# --- Scripts Folder ---
export PATH="$HOME/scripts:$PATH"
# chmod +x ~/scripts/*.sh

# --- Autosuggestions ---
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# --- Syntax Highlighting ---
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# --- Completion (with caching) ---
autoload -Uz compinit
compinit -C

# --- Misc ---
export TERM=xterm-256color

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
