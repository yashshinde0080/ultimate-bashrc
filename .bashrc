#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# === History Settings ===
# Ignore duplicates and commands starting with a space, append to history file
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT='%F %T ' # Add timestamps to history entries

# === Shell Options ===
shopt -s checkwinsize # Update window size after each command
shopt -s autocd       # Change to directory by typing its name
shopt -s dirspell     # Correct directory spelling on tab completion
shopt -s cdspell      # Correct minor spelling errors in cd commands

# === Prompt Customization ===
if command -v tput >/dev/null 2>&1 && tput setaf 1 >/dev/null 2>&1; then
  # ANSI color codes for a colorful prompt
  c_reset='\[\e[0m\]'     # Reset color
  c_user='\[\e[1;32m\]'   # Bright green for username
  c_host='\[\e[1;36m\]'   # Bright cyan for hostname
  c_path='\[\e[1;34m\]'   # Bright blue for path
  c_git='\[\e[1;33m\]'    # Bright yellow for git branch
  c_symbol='\[\e[1;31m\]' # Bright red for symbol

  # Function to display current git branch if available
  parse_git_branch() {
    if command -v git >/dev/null 2>&1; then
      git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    fi
  }

  # Custom prompt: user@host:path (git-branch) ⚡
  PS1="${c_user}\u${c_reset}${c_host}@\h${c_reset}:${c_path}\w${c_git}\$(parse_git_branch)${c_reset}${c_symbol} ⚡ ${c_reset}"
else
  # Fallback prompt for terminals without color support
  PS1='\u@\h:\w \$ '
fi

# Set terminal title for xterm/rxvt
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# === Color Support ===
if command -v dircolors >/dev/null 2>&1; then
  # Enable color for ls and grep if dircolors is available
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

# === Aliases ===
alias ll='ls -alF'           # List all files with details
alias la='ls -A'             # List almost all files (excl. . and ..)
alias l='ls -CF'             # List files in columns
alias ..='cd ..'             # Go up one directory
alias ...='cd ../..'         # Go up two directories
alias cls='clear'            # Clear the screen
alias h='history'            # Show command history
alias j='jobs -l'            # List active jobs with details
alias python='python3'       # Use python3 as default python
alias clean='~/wsl-clean.sh' # Clean up WSL
# === Functions ===
# Create a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Find files by name in current directory
f() {
  find . -name "$1" 2>/dev/null
}

# Quick git status and diff overview
gs() {
  if command -v git >/dev/null 2>&1; then
    git status
    git diff --stat
  else
    echo "Git is not installed."
  fi
}

# Extract various archive types
extract() {
  if [ -f "$1" ]; then
    case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *) echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# === Environment Variables ===
export EDITOR='vim'                  # Set default editor to vim
export PATH="$HOME/.local/bin:$PATH" # Add ~/.local/bin to PATH
export LESS='-R'                     # Enable raw control chars for less (color support)

# === Bash Completion ===
if ! shopt -oq posix; then
  # Enable bash completion if available
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# === Welcome Message ===
cat <<'EOF'

   /\_/\          |\__/,|   (`\    ◤————————————◥
  ( o.o )       _.|o o  |_   ) )    Welcome YASH
   > ^ <      -(((---(((--------   ◣————————————◢

██╗   ██╗██████╗ ██╗   ██╗███╗   ██╗████████╗██╗   ██╗
██║   ██║██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██║   ██║
██║   ██║██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║
██║   ██║██╔══██╗██║   ██║██║╚██╗██║   ██║   ██║   ██║
╚██████╔╝██████╔╝╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝
 ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝ 
EOF

echo -e "\033[1;33mHello, YASH! Your terminal is live—ready to compile some code?✨💻\033[0m" # Yellow welcome text
echo -e "\033[1;36mUser: $USER | Host: $(hostname) | Shell: $SHELL\033[0m"                  # Cyan user info

# === Final Touches ===
unset color_prompt force_color_prompt # Clean up unused variables

eval "$(oh-my-posh init bash --config ~/.poshthemes/kali.omp.json)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
