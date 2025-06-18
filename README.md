# 🚀 Ultimate Bash Configuration

<div align="center">

![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![WSL](https://img.shields.io/badge/WSL-0078D4?style=for-the-badge&logo=windows&logoColor=white)
![Starship](https://img.shields.io/badge/Starship-DD0B78?style=for-the-badge&logo=starship&logoColor=white)

**A beautiful, feature-rich bash configuration with Catppuccin colors, custom functions, and developer-friendly aliases.**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Customization](#-customization)

</div>

---

## 📸 Preview

```bash
   /\_/\          |\__/,|   (`\    ◤————————————◥
  ( o.o )       _.|o o  |_   ) )    Welcome YASH
   > ^ <      -(((---(((--------   ◣————————————◢

██╗   ██╗██████╗ ██╗   ██╗███╗   ██╗████████╗██╗   ██╗
██║   ██║██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██║   ██║
██║   ██║██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║
██║   ██║██╔══██╗██║   ██║██║╚██╗██║   ██║   ██║   ██║
╚██████╔╝██████╔╝╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝
 ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝ 

Hello, YASH! Your terminal is live — ready to compile some code?✨💻
User: yash | Host: hostname | Shell: /bin/bash
💡Type 'helpx' to see available functions | ✨Type 'als' to see available aliases | 🎨Type 'colors' to show colors
```

## ✨ Features

### 🎨 **Beautiful Catppuccin Color Scheme**
- Full RGB color palette with 24 carefully selected colors
- Consistent theming across all functions and outputs
- Eye-friendly color combinations for extended terminal sessions

### 🛠️ **Enhanced Shell Experience**
- **Starship Prompt**: Modern, fast, and customizable prompt
- **Smart History**: Duplicate removal, timestamps, and better navigation
- **Auto-completion**: Enhanced bash completion with spell correction
- **Directory Navigation**: Smart cd with spell correction and autocd

### 📊 **System Information & Monitoring**
- `sysinfo` - Beautiful system information display
- `duh` - Directory sizes with color coding
- `ports` - Quick port listing
- Memory, disk, and process monitoring aliases

### 💻 **Developer Tools**
- **Git Integration**: Quick git operations with `gita`, `gitc`, `gitp`
- **Project Management**: `newproject` creates structured project directories
- **HTTP Server**: `serve` starts Python HTTP server instantly
- **Language Shortcuts**: `py` for Python, `c` for C compilation

### 📁 **File Management**
- `backup` - Create timestamped backups
- `search` - Find files by pattern
- `extract` - Universal archive extractor
- `mkcd` - Create and enter directory in one command

### 🔧 **Utility Functions**
- `note` - Simple note-taking system
- `calc` - Built-in calculator
- `colors` - Display full color palette
- `helpx` - Interactive help system

## 🚀 Installation

> [!IMPORTANT]
> This configuration is specifically designed for Ubuntu/WSL environments. Make sure you're running a compatible system before installation.

### Prerequisites
```bash
# Required tools
sudo apt update
sudo apt install git curl wget vim

# Optional but recommended
sudo apt install batcat tree htop
```

> [!TIP]
> Install `batcat` for enhanced file viewing and `tree` for better directory visualization. These tools integrate seamlessly with the custom aliases.

### Method 1: Git Clone Installation (Recommended)

> [!WARNING]
> This method will replace your current `.bashrc`. Make sure to backup your existing configuration first!

```bash
# Step 1: Backup your current .bashrc
cp ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d_%H%M%S)

# Step 2: Clone the repository
cd ~
git clone https://github.com/yashshinde0080/simple-ubuntu-.bashrc.git

# Step 3: Replace .bashrc
rm ~/.bashrc
cp simple-ubuntu-.bashrc/.bashrc ~/.bashrc

# Step 4: Clean up
rm -rf simple-ubuntu-.bashrc

# Step 5: Install Starship prompt
curl -sS https://starship.rs/install.sh | sh

# Step 6: Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Step 7: Reload configuration
source ~/.bashrc
```

### Method 2: Direct Download
```bash
# Backup your current .bashrc
cp ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d_%H%M%S)

# Download and install directly
curl -fsSL https://raw.githubusercontent.com/yashshinde0080/simple-ubuntu-.bashrc/main/.bashrc > ~/.bashrc

# Install dependencies
curl -sS https://starship.rs/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Reload configuration
source ~/.bashrc
```

> [!NOTE]
> If you encounter any issues during installation, you can restore your original configuration using the backup created in Step 1.

### 🔄 Restoring Default Configuration

If you want to restore the default WSL `.bashrc`:

```bash
# Clone default bashrc repository
git clone https://github.com/yashshinde0080/default_wsl_.bashrc.git

# Replace current .bashrc with default
cp default_wsl_.bashrc/.bashrc ~/.bashrc

# Clean up
rm -rf default_wsl_.bashrc

# Reload
source ~/.bashrc
```

> [!CAUTION]
> Restoring the default configuration will remove all custom functions and aliases. Make sure this is what you want before proceeding.

### Post-Installation Setup

> [!TIP]
> After installation, run these commands to fully utilize all features:

1. **Configure Starship prompt:**
   ```bash
   # Create starship config directory
   mkdir -p ~/.config
   
   # The configuration will use default starship settings
   # Customize by editing ~/.config/starship.toml if needed
   ```

2. **Test installation:**
   ```bash
   # Check if all functions work
   helpx    # View custom functions
   als      # View aliases
   colors   # View color palette
   sysinfo  # System information
   ```

3. **Install Node.js (via NVM):**
   ```bash
   # Install latest LTS Node.js
   nvm install --lts
   nvm use --lts
   ```

## 📚 Usage Guide

### 🎯 Quick Commands Reference

#### **File Operations**
| Command | Description | Example |
|---------|-------------|---------|
| `ll` | List all files with details | `ll` |
| `la` | List almost all files | `la` |
| `lh` | List with human-readable sizes | `lh` |
| `backup <file>` | Create timestamped backup | `backup config.txt` |
| `search <pattern>` | Find files by name | `search "*.py"` |

#### **Navigation**
| Command | Description | Example |
|---------|-------------|---------|
| `..` | Go up one directory | `..` |
| `...` | Go up two directories | `...` |
| `mkcd <dir>` | Create and enter directory | `mkcd newproject` |

#### **Git Shortcuts**
| Command | Description | Example |
|---------|-------------|---------|
| `gita <files>` | Git add files | `gita .` |
| `gitc <message>` | Git commit with message | `gitc "fix: bug resolved"` |
| `gitp` | Git push | `gitp` |
| `gitpull` | Git pull | `gitpull` |
| `gitst` | Git status (short) | `gitst` |
| `gitlog` | Pretty git log | `gitlog` |

#### **Development**
| Command | Description | Example |
|---------|-------------|---------|
| `py <file>` | Run Python file | `py script.py` |
| `c <file>` | Compile and run C file | `c program.c` |
| `serve [port]` | Start HTTP server | `serve 8080` |
| `newproject <name>` | Create project structure | `newproject myapp` |

#### **System & Utilities**
| Command | Description | Example |
|---------|-------------|---------|
| `sysinfo` | Show system information | `sysinfo` |
| `duh` | Directory sizes with colors | `duh` |
| `calc <expr>` | Calculate expression | `calc "2*3+4"` |
| `note <text>` | Add/view notes | `note "Remember to..."` |
| `extract <file>` | Extract any archive | `extract file.tar.gz` |

#### **Help & Information**
| Command | Description |
|---------|-------------|
| `helpx` | Show custom functions help |
| `als` | Show all aliases |
| `colors` | Display color palette |

### 🎨 Color Palette

The configuration includes a full **Catppuccin** color scheme with these colors:

**Main Colors:**
- 🌸 Rosewater, Flamingo, Pink, Mauve
- ❤️ Red, Maroon, Peach, Yellow  
- 💚 Green, Teal, Sky, Sapphire
- 💙 Blue, Lavender

**Text & Surface Colors:**
- 📝 Text, Subtext1, Subtext0
- 🎯 Overlay2, Overlay1, Overlay0
- 🏠 Surface2, Surface1, Surface0, Base, Mantle, Crust

Use `colors` command to see the full palette with RGB values!

## ⚙️ Customization

> [!WARNING]
> Always backup your `.bashrc` before making changes. Use `cp ~/.bashrc ~/.bashrc.backup` to create a backup.

### 🎨 Changing Colors
Edit the color variables at the top of `.bashrc`:
```bash
# Example: Change primary text color
e_text='\e[38;2;255;255;255m'  # White instead of default
```

> [!TIP]
> Use online RGB color pickers to find the perfect colors for your terminal theme. The format is `\e[38;2;R;G;Bm` where R, G, B are values from 0-255.

### 🖥️ Customizing Starship Prompt
Edit `~/.config/starship.toml`:
```toml
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[➜](bold red)"
```

> [!NOTE]
> If the starship config file doesn't exist, create it with `touch ~/.config/starship.toml`. Visit [starship.rs](https://starship.rs/config/) for full configuration options.

### 📝 Adding Custom Functions
Add your functions before the "Final Touches" section:
```bash
# Custom function example
myfunction() {
    echo -e "${e_green}Hello from my custom function!${e_reset}"
}
```

> [!IMPORTANT]
> Always use `${e_reset}` after colored text to prevent color bleeding into subsequent terminal output.

### 🔧 Environment Variables
Customize these variables in the configuration:
```bash
export EDITOR='code'              # Change default editor
export BROWSER='firefox'          # Set default browser
export PATH="$HOME/bin:$PATH"     # Add custom bin directory
```

> [!CAUTION]
> Be careful when modifying the `PATH` variable. Always append to it rather than replacing it to avoid breaking system commands.

## 🛠️ Advanced Features

> [!NOTE]
> These features require additional software to be installed. Most are optional but enhance the overall experience.

### 📊 System Monitoring
The configuration includes several monitoring tools:
- `htop` integration for process monitoring
- `df -h` and `du -h` for disk usage
- `free -h` for memory usage
- Network port monitoring with `netstat`

> [!TIP]
> Install `htop` with `sudo apt install htop` for enhanced process monitoring compared to the default `top` command.

### 🔄 Auto-completion
Enhanced bash completion with:
- Command completion
- File path completion  
- Git branch completion
- Variable name completion

### 📚 History Management
Smart history features:
- Timestamps on all commands
- Duplicate removal
- Increased history size (1000 commands)
- Shared history across sessions

> [!WARNING]
> The configuration sets `HISTCONTROL=ignoreboth:erasedups` which removes duplicate commands. If you prefer to keep duplicates, comment out this line.

## 🛡️ Troubleshooting

> [!NOTE]
> Common issues and their solutions:

### Colors Not Displaying
```bash
# Check if your terminal supports 256 colors
echo $TERM

# Test color support
curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
```

> [!TIP]
> If colors aren't working, try using a different terminal emulator like Windows Terminal, Terminator, or update your current one.

### Starship Not Loading
```bash
# Check if starship is installed
which starship

# Reinstall if needed
curl -sS https://starship.rs/install.sh | sh
```

### Git Functions Not Working
```bash
# Make sure git is installed
git --version

# If not installed
sudo apt install git
```

> [!IMPORTANT]
> Git shortcuts only work within git repositories. Initialize a repository with `git init` or clone an existing one.

### NVM Commands Not Found
```bash
# Check if NVM is properly loaded
command -v nvm

# If not working, add this to your .bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

## 🤝 Contributing

> [!NOTE]
> Contributions are welcome! Please follow the guidelines below to maintain code quality and consistency.

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Commit** your changes: `git commit -m 'Add amazing feature'`
4. **Push** to the branch: `git push origin feature/amazing-feature`
5. **Open** a Pull Request

> [!TIP]
> Before submitting a PR, test your changes in a clean environment to ensure they work correctly.

### 🐛 Bug Reports
Found a bug? Please open an issue with:
- Your OS and shell version
- Steps to reproduce
- Expected vs actual behavior
- Any error messages

> [!IMPORTANT]
> Include the output of `echo $SHELL` and `uname -a` in your bug reports for better debugging.

### 💡 Feature Requests

> [!NOTE]
> Feature requests are welcome! Please explain:
- What problem does this solve?
- How would it work?
- Any examples or mockups

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

> [!NOTE]
> Feel free to use, modify, and distribute this configuration as needed under the MIT License terms.

## 🙏 Acknowledgments

- **[Catppuccin](https://catppuccin.com/)** - For the beautiful color palette
- **[Starship](https://starship.rs/)** - For the amazing prompt
- **[NVM](https://github.com/nvm-sh/nvm)** - Node Version Manager
- **Bash Community** - For endless inspiration

> [!TIP]
> Check out these projects if you want to further customize your terminal experience!

---

<div align="center">

**Made with ❤️ for developers who love beautiful terminals**

[⭐ Star this repo](https://github.com/yashshinde0080/simple-ubuntu-.bashrc) • [🐛 Report Bug](https://github.com/yashshinde0080/simple-ubuntu-.bashrc/issues) • [💡 Request Feature](https://github.com/yashshinde0080/simple-ubuntu-.bashrc/issues)

</div>

---

### 📱 Connect

- **GitHub**: [@yashshinde0080](https://github.com/yashshinde0080)
- **Repository**: [simple-ubuntu-.bashrc](https://github.com/yashshinde0080/simple-ubuntu-.bashrc)
- **Backup Repository**: [default_wsl_.bashrc](https://github.com/yashshinde0080/default_wsl_.bashrc)

> [!QUOTE]
> *"A beautiful terminal is a productive terminal"* ✨

---

## 🔄 Quick Reference

> [!NOTE]
> Keep this handy for quick access to commonly used commands:

### Essential Commands
```bash
# Help and Information
helpx          # Custom functions help
als            # Show all aliases  
colors         # Display color palette
sysinfo        # System information

# File Operations
ll             # List all files
backup <file>  # Create backup
search <name>  # Find files
extract <file> # Extract archives

# Development
py <file>      # Run Python file
c <file>       # Compile and run C
serve [port]   # HTTP server
newproject <n> # Create project

# Git Shortcuts
gita .         # Git add all
gitc "msg"     # Git commit
gitp           # Git push
gitst          # Git status
```

> [!TIP]
> Bookmark this README for quick reference to all commands and features!
