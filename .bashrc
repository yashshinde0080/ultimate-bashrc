#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Clear terminal on startup (for Warp AI)
clear

# rgb color

e_reset='\e[0m'
e_rosewater='\e[38;2;245;224;220m'
e_flamingo='\e[38;2;242;205;205m'
e_pink='\e[38;2;245;194;231m'
e_mauve='\e[38;2;203;166;247m'
e_red='\e[38;2;243;139;168m'
e_maroon='\e[38;2;235;160;172m'
e_peach='\e[38;2;250;179;135m'
e_yellow='\e[38;2;249;226;175m'
e_green='\e[38;2;166;227;161m'
e_teal='\e[38;2;148;226;213m'
e_sky='\e[38;2;137;220;235m'
e_sapphire='\e[38;2;116;199;236m'
e_blue='\e[38;2;137;180;250m'
e_lavender='\e[38;2;180;190;254m'
e_text='\e[38;2;205;214;244m'
e_subtext1='\e[38;2;186;194;222m'
e_subtext0='\e[38;2;166;173;200m'
e_overlay2='\e[38;2;147;153;178m'
e_overlay1='\e[38;2;127;132;156m'
e_overlay0='\e[38;2;108;112;134m'
e_surface2='\e[38;2;88;91;112m'
e_surface1='\e[38;2;69;71;90m'
e_surface0='\e[38;2;49;50;68m'
e_base='\e[38;2;30;30;46m'
e_mantle='\e[38;2;24;24;37m'
e_crust='\e[38;2;17;17;27m'

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
alias ll='ls -alF'                                    # List all files with details
alias la='ls -A'                                      # List almost all files (excl. . and ..)
alias l='ls -CF'                                      # List files in columns
alias ..='cd ..'                                      # Go up one directory
alias ...='cd ../..'                                  # Go up two directories
alias cls='clear'                                     # Clear the screen
alias h='history'                                     # Show command history
alias j='jobs -l'                                     # List active jobs with details
alias python='python3'                                # Use python3 as default python
alias clean='~/wsl-clean.sh'                          # Clean up WSL
alias update='sudo apt update && sudo apt upgrade -y' # Update system
alias ex='exit'                                       # Exit the shell
alias bat='batcat'                                    # Use batcat as default bat

# === Enhanced Aliases (No external dependencies) ===
alias lh='ls -lah'                             # List all with human readable sizes
alias fgrep='fgrep --color=auto'               # Colorized fgrep
alias egrep='egrep --color=auto'               # Colorized egrep
alias df='df -h'                               # Human readable disk usage
alias du='du -h'                               # Human readable directory usage
alias free='free -h'                           # Human readable memory usage
alias ps='ps aux'                              # Better process listing
alias reload='source ~/.bashrc'                # Reload bashrc
alias bashrc='$EDITOR ~/.bashrc'               # Quick edit bashrc
alias ports='netstat -tuln'                    # Show open ports
alias gitlog='git log --oneline --graph --all' # Pretty git log
alias gitst='git status --short'               # Short git status

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

# === Enhanced Functions (No external dependencies) ===
# Create backup of file with timestamp
backup() {
  if [ -f "$1" ]; then
    cp "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${e_green}Backup created: $1.backup.$(date +%Y%m%d_%H%M%S)${e_reset}"
  else
    echo -e "${e_red}File not found: $1${e_reset}"
  fi
}

# Quick file search with pattern
search() {
  if [ -z "$1" ]; then
    echo -e "${e_yellow}Usage: search <pattern> [directory]${e_reset}"
    return 1
  fi
  local dir="${2:-.}"
  find "$dir" -type f -name "*$1*" 2>/dev/null
}

# Show system information using standard commands
sysinfo() {
  echo -e "${e_sapphire}╔═══════════════════════════════════════════════════╗${e_reset}"
  echo -e "${e_sapphire}║${e_text}                  System Information               ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╠═══════════════════════════════════════════════════╣${e_reset}"
  echo -e "${e_sapphire}║${e_teal} OS:       ${e_text}$(uname -s) $(uname -r | cut -d' ' -f1)${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_teal} Hostname: ${e_text}$(hostname)${e_sapphire}                         ║${e_reset}"
  echo -e "${e_sapphire}║${e_teal} User:     ${e_text}$(whoami)${e_sapphire}                                    ║${e_reset}"
  if command -v uptime >/dev/null 2>&1; then
    echo -e "${e_sapphire}║${e_teal} Uptime:   ${e_text}$(uptime | awk -F'up ' '{print $2}' | awk -F',' '{print $1}')${e_sapphire}                                   ║${e_reset}"
  fi
  echo -e "${e_sapphire}║${e_teal} Date:     ${e_text}$(date)${e_sapphire}            ║${e_reset}"
  echo -e "${e_sapphire}╚═══════════════════════════════════════════════════╝${e_reset}"
}

# Create simple project directory structure
newproject() {
  if [ -z "$1" ]; then
    echo -e "${e_yellow}Usage: newproject <project_name>${e_reset}"
    return 1
  fi

  mkdir -p "$1"/{src,docs,tests}
  cd "$1"
  touch README.md .gitignore
  echo "# $1" >README.md
  echo -e "${e_green}Project '$1' created successfully!${e_reset}"
  echo -e "${e_text}Created directories: src/, docs/, tests/${e_reset}"
  echo -e "${e_text}Created files: README.md, .gitignore${e_reset}"
}

# Simple note taking function
note() {
  local note_file="$HOME/.daily_notes"

  if [ -z "$1" ]; then
    if [ -f "$note_file" ]; then
      echo -e "${e_blue}Recent notes:${e_reset}"
      tail -10 "$note_file"
    else
      echo -e "${e_yellow}No notes found. Use 'note <text>' to add a note.${e_reset}"
    fi
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" >>"$note_file"
    echo -e "${e_green}Note added${e_reset}"
  fi
}

# Simple calculator using bash arithmetic
calc() {
  if [ -z "$1" ]; then
    echo -e "${e_yellow}Usage: calc <expression>${e_reset}"
    echo -e "${e_text}Example: calc '2+2' or calc '10*5'${e_reset}"
    return 1
  fi
  result=$((${1}))
  echo -e "${e_green}Result: $result${e_reset}"
}

# Show directory sizes with simple coloring
duh() {
  echo -e "${e_blue}Directory sizes in current folder:${e_reset}"
  for item in *; do
    if [ -d "$item" ]; then
      size=$(du -sh "$item" 2>/dev/null | cut -f1)
      echo -e "${e_green}$size\t${e_text}$item/${e_reset}"
    elif [ -f "$item" ]; then
      size=$(ls -lah "$item" | awk '{print $5}')
      echo -e "${e_yellow}$size\t${e_text}$item${e_reset}"
    fi
  done
}

# Quick HTTP server using Python (if available)
serve() {
  local port="${1:-8000}"
  if command -v python3 >/dev/null 2>&1; then
    echo -e "${e_green}Starting HTTP server on port $port...${e_reset}"
    echo -e "${e_blue}Access at: http://localhost:$port${e_reset}"
    python3 -m http.server "$port"
  else
    echo -e "${e_red}Python3 not available for HTTP server${e_reset}"
  fi
}

# Git shortcuts with simple output
gita() {
  git add "$@" && echo -e "${e_green}Files staged${e_reset}"
}

gitc() {
  if [ -z "$1" ]; then
    echo -e "${e_yellow}Usage: gitc <commit message>${e_reset}"
    return 1
  fi
  git commit -m "$*" && echo -e "${e_green}Changes committed${e_reset}"
}

gitp() {
  git push && echo -e "${e_green}Changes pushed${e_reset}"
}

gitpull() {
  git pull && echo -e "${e_green}Repository updated${e_reset}"
}

# Show available custom functions
helpx() {
  echo -e "${e_sapphire}╔═══════════════════════════════════════════════╗${e_reset}"
  echo -e "${e_sapphire}║${e_text}                     helpx                     ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╠═══════════════════════════════════════════════╣${e_reset}"
  echo -e "${e_sapphire}║${e_green} backup <file>    ${e_text}- Create timestamped backup  ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} search <pattern> ${e_text}- Search files by name       ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} sysinfo          ${e_text}- Show system information    ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} newproject <n>   ${e_text}- Create project structure   ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} note <text>      ${e_text}- Add/view notes             ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} calc <expr>      ${e_text}- Simple calculator          ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} duh              ${e_text}- Show directory sizes       ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} serve [port]     ${e_text}- Start HTTP server (python) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} gita/gitc/gitp   ${e_text}- Quick git operations       ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╚═══════════════════════════════════════════════╝${e_reset}"
}

# Show available aliases in a formatted table (2 columns)
als() {
  echo -e "${e_sapphire}╔═══════════════════════════════════════════════════════════════════════════════════════════════════╗${e_reset}"
  echo -e "${e_sapphire}║${e_text}                                              Aliases                                              ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╠═══════════════════════════════════════════════════════════════════════════════════════════════════╣${e_reset}"
  echo -e "${e_sapphire}║${e_green} ll        ${e_text}- ls -alF (list all files)        ${e_sapphire}        │${e_green} la        ${e_text}- ls -A (list almost all)       ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} l         ${e_text}- ls -CF (list in columns)        ${e_sapphire}        │${e_green} lh        ${e_text}- ls -lah (human readable)      ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} ..        ${e_text}- cd .. (go up one dir)           ${e_sapphire}        │${e_green} ...       ${e_text}- cd ../.. (go up two dirs)     ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} cls       ${e_text}- clear (clear screen)            ${e_sapphire}        │${e_green} h         ${e_text}- history (command history)     ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} j         ${e_text}- jobs -l (list active jobs)      ${e_sapphire}        │${e_green} python    ${e_text}- python3 (default python)      ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} clean     ${e_text}- ~/wsl-clean.sh (clean WSL)      ${e_sapphire}        │${e_green} update    ${e_text}- apt update && upgrade         ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} ex        ${e_text}- exit (exit shell)               ${e_sapphire}        │${e_green} bat       ${e_text}- batcat (default bat)          ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} fgrep     ${e_text}- fgrep --color=auto              ${e_sapphire}        │${e_green} egrep     ${e_text}- egrep --color=auto            ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} df        ${e_text}- df -h (human readable)          ${e_sapphire}        │${e_green} du        ${e_text}- du -h (human readable)        ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} free      ${e_text}- free -h (human readable)        ${e_sapphire}        │${e_green} ps        ${e_text}- ps aux (better listing)       ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} reload    ${e_text}- source ~/.bashrc                ${e_sapphire}        │${e_green} bashrc    ${e_text}- edit ~/.bashrc                ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} ports     ${e_text}- netstat -tuln (open ports)      ${e_sapphire}        │${e_green} gitlog    ${e_text}- git log --oneline --graph     ${e_sapphire}  ║${e_reset}"
  echo -e "${e_sapphire}║${e_green} gitst     ${e_text}- git status --short              ${e_sapphire}        │${e_text}                                             ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╚═══════════════════════════════════════════════════════════════════════════════════════════════════╝${e_reset}"
}

# Show available colors in a formatted table
colors() {
  echo -e "${e_sapphire}╔═══════════════════════════════════════════════════════════════════╗${e_reset}"
  echo -e "${e_sapphire}║${e_text}                       Color Palette                               ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╠═══════════════════════════════════════════════════════════════════╣${e_reset}"
  echo -e "${e_sapphire}║${e_rosewater} rosewater ${e_text}- \e[38;2;245;224;220m█████${e_text} (245,224,220) ${e_sapphire}│${e_flamingo} flamingo  ${e_text}- \e[38;2;242;205;205m█████${e_text} (242,205,205) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_pink} pink      ${e_text}- \e[38;2;245;194;231m█████${e_text} (245,194,231) ${e_sapphire}│${e_mauve} mauve     ${e_text}- \e[38;2;203;166;247m█████${e_text} (203,166,247) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_red} red       ${e_text}- \e[38;2;243;139;168m█████${e_text} (243,139,168) ${e_sapphire}│${e_maroon} maroon    ${e_text}- \e[38;2;235;160;172m█████${e_text} (235,160,172) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_peach} peach     ${e_text}- \e[38;2;250;179;135m█████${e_text} (250,179,135) ${e_sapphire}│${e_yellow} yellow    ${e_text}- \e[38;2;249;226;175m█████${e_text} (249,226,175) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_green} green     ${e_text}- \e[38;2;166;227;161m█████${e_text} (166,227,161) ${e_sapphire}│${e_teal} teal      ${e_text}- \e[38;2;148;226;213m█████${e_text} (148,226,213) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_sky} sky       ${e_text}- \e[38;2;137;220;235m█████${e_text} (137,220,235) ${e_sapphire}│${e_sapphire} sapphire  ${e_text}- \e[38;2;116;199;236m█████${e_text} (116,199,236) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_blue} blue      ${e_text}- \e[38;2;137;180;250m█████${e_text} (137,180,250) ${e_sapphire}│${e_lavender} lavender  ${e_text}- \e[38;2;180;190;254m█████${e_text} (180,190,254) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╠═══════════════════════════════════════════════════════════════════╣${e_reset}"
  echo -e "${e_sapphire}║${e_text}                        Text Colors                                ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╠═══════════════════════════════════════════════════════════════════╣${e_reset}"
  echo -e "${e_sapphire}║${e_text} text      ${e_text}- \e[38;2;205;214;244m█████${e_text} (205,214,244) ${e_sapphire}│${e_subtext1} subtext1  ${e_text}- \e[38;2;186;194;222m█████${e_text} (186,194,222) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_subtext0} subtext0  ${e_text}- \e[38;2;166;173;200m█████${e_text} (166,173,200) ${e_sapphire}│${e_overlay2} overlay2  ${e_text}- \e[38;2;147;153;178m█████${e_text} (147,153,178) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_overlay1} overlay1  ${e_text}- \e[38;2;127;132;156m█████${e_text} (127,132,156) ${e_sapphire}│${e_overlay0} overlay0  ${e_text}- \e[38;2;108;112;134m█████${e_text} (108,112,134) ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╠═══════════════════════════════════════════════════════════════════╣${e_reset}"
  echo -e "${e_sapphire}║${e_text}                       Surface Colors                              ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╠═══════════════════════════════════════════════════════════════════╣${e_reset}"
  echo -e "${e_sapphire}║${e_surface2} surface2  ${e_text}- \e[38;2;88;91;112m█████${e_text} (88,91,112)   ${e_sapphire}│${e_surface1} surface1  ${e_text}- \e[38;2;69;71;90m█████${e_text} (69,71,90)    ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_surface0} surface0  ${e_text}- \e[38;2;49;50;68m█████${e_text} (49,50,68)    ${e_sapphire}│${e_base} base      ${e_text}- \e[38;2;30;30;46m█████${e_text} (30,30,46)    ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}║${e_mantle} mantle    ${e_text}- \e[38;2;24;24;37m█████${e_text} (24,24,37)    ${e_sapphire}│${e_crust} crust     ${e_text}- \e[38;2;17;17;27m█████${e_text} (17,17,27)    ${e_sapphire}║${e_reset}"
  echo -e "${e_sapphire}╚═══════════════════════════════════════════════════════════════════╝${e_reset}"
  echo -e "${e_overlay1}💡 Use these color variables in your scripts: \${e_colorname}text\${e_reset}${e_reset}"
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

echo -e "${e_rosewater}Hello, ${e_mauve}YASH${e_rosewater}! Your terminal is live — ready to compile some code?✨💻${e_reset}"
echo -e "${e_teal}User: ${e_text}$USER ${e_teal}| Host: ${e_text}$(hostname) ${e_teal}| Shell: ${e_text}$SHELL${e_reset}"
echo -e "${e_overlay1}💡Type 'helpx' to see available functions${e_reset}|${e_overlay1}✨Type 'als' to see available aliases${e_reset}|${e_overlay1}🎨Type "colors" to show colors of terminal${e_overlay1}"

# === Final Touches ===
unset color_prompt force_color_prompt # Clean up unused variables

# eval "$(oh-my-posh init bash --config ~/.poshthemes/kali.omp.json)"
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship.toml

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Shortcut to run Python files
py() {
  if [ -f "$1" ]; then
    python3 "$1"
  else
    echo "Usage: py <filename.py>"
  fi
}

# Shortcut to compile and run C files
c() {
  if [ -f "$1" ]; then
    filename="${1%.*}"
    gcc "$1" -o "$filename" && ./"$filename"
  else
    echo "Usage: c <filename.c>"
  fi
}
alias wrap="/mnt/c/Users/yash shinde/AppData/Local/wrap/bin/wrap.exe"
alias wrap="/mnt/c/Users/yash shinde/AppData/Local/wrap/bin/wrap.exe"
