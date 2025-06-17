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

### Prerequisites
```bash
# Required tools
sudo apt update
sudo apt install git curl wget vim

# Optional but recommended
sudo apt install batcat tree htop
```

### Quick Install
```bash
# Backup your current .bashrc
cp ~/.bashrc ~/.bashrc.backup

# Download and install
git clone https://github.com/yashshinde0080/simple-ubuntu-.bashrc.git > ~/.bashrc

# Install Starship prompt
curl -sS https://starship.rs/install.sh | sh

# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Reload configuration
source ~/.bashrc
```

### Manual Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yashshinde0080/simple-ubuntu-.bashrc.git
   cd bash-config
   ```

2. Copy the configuration:
   ```bash
   cp .bashrc ~/.bashrc
   cp .config/starship.toml ~/.config/starship.toml
   ```

3. Install dependencies and reload:
   ```bash
   source ~/.bashrc
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

### 🎨 Changing Colors
Edit the color variables at the top of `.bashrc`:
```bash
# Example: Change primary text color
e_text='\e[38;2;255;255;255m'  # White instead of default
```

### 🖥️ Customizing Starship Prompt
Edit `~/.config/starship.toml`:
```toml
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[➜](bold red)"
```

### 📝 Adding Custom Functions
Add your functions before the "Final Touches" section:
```bash
# Custom function example
myfunction() {
    echo -e "${e_green}Hello from my custom function!${e_reset}"
}
```

### 🔧 Environment Variables
Customize these variables in the configuration:
```bash
export EDITOR='code'              # Change default editor
export BROWSER='firefox'          # Set default browser
export PATH="$HOME/bin:$PATH"     # Add custom bin directory
```

## 🛠️ Advanced Features

### 📊 System Monitoring
The configuration includes several monitoring tools:
- `htop` integration for process monitoring
- `df -h` and `du -h` for disk usage
- `free -h` for memory usage
- Network port monitoring with `netstat`

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

## 🤝 Contributing

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Commit** your changes: `git commit -m 'Add amazing feature'`
4. **Push** to the branch: `git push origin feature/amazing-feature`
5. **Open** a Pull Request

### 🐛 Bug Reports
Found a bug? Please open an issue with:
- Your OS and shell version
- Steps to reproduce
- Expected vs actual behavior
- Any error messages

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **[Catppuccin](https://catppuccin.com/)** - For the beautiful color palette
- **[Starship](https://starship.rs/)** - For the amazing prompt
- **[NVM](https://github.com/nvm-sh/nvm)** - Node Version Manager
- **Bash Community** - For endless inspiration

---

<div align="center">

**Made with ❤️ for developers who love beautiful terminals**

[⭐ Star this repo](https://github.com/yourusername/bash-config) • [🐛 Report Bug](https://github.com/yourusername/bash-config/issues) • [💡 Request Feature](https://github.com/yourusername/bash-config/issues)

</div>

---

### 📱 Connect

- **GitHub**: [@yourusername](https://github.com/yourusername)
- **Twitter**: [@yourusername](https://twitter.com/yourusername)
- **Email**: syash0080@gmail.com

> *"A beautiful terminal is a productive terminal"* ✨
