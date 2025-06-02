# 🚀 Custom Bash Configuration

> A powerful, colorful, and feature-rich bash configuration that transforms your terminal experience into a developer-friendly powerhouse.

## ✨ Features

### 🎨 **Visual Enhancements**
- **Colorful Prompt**: Beautiful color-coded prompt with user, host, path, and git branch information
- **Git Branch Display**: Real-time git branch status in your prompt
- **Custom Welcome Message**: ASCII art greeting with system information
- **Terminal Title**: Dynamic terminal title showing current user and directory

### 📝 **History Management**
- **Smart History**: Ignores duplicates and commands starting with spaces
- **Timestamped History**: Every command gets a timestamp for easy tracking
- **Persistent History**: Commands are appended to history file in real-time
- **Large History Size**: 1000 commands in memory, 2000 in file

### 🛠️ **Shell Enhancements**
- **Auto Directory Change**: Type directory name to cd into it
- **Spelling Correction**: Automatic correction for directory names and cd commands
- **Window Size Updates**: Automatically adjusts after each command
- **Bash Completion**: Enhanced tab completion support

### ⚡ **Powerful Aliases**
```bash
ll          # Detailed file listing
la          # Show almost all files
..          # Go up one directory  
...         # Go up two directories
cls         # Clear screen
update      # System update command
python      # Uses python3 by default
```

### 🔧 **Utility Functions**

#### File Management
- **`mkcd <dir>`** - Create directory and navigate into it
- **`f <name>`** - Find files by name in current directory
- **`extract <file>`** - Extract various archive formats (tar, zip, gz, etc.)

#### Development Tools
- **`gs()`** - Quick git status and diff overview
- **`py <file>`** - Run Python files with python3
- **`c <file>`** - Compile and run C files with GCC

## 🚀 Quick Start

### Installation

1. **Clone or download** this configuration file
2. **Backup** your existing `.bashrc`:
   ```bash
   cp ~/.bashrc ~/.bashrc.backup
   ```
3. **Replace** your `.bashrc` with this configuration:
   ```bash
   cp paste.txt ~/.bashrc
   ```
4. **Reload** your shell:
   ```bash
   source ~/.bashrc
   ```

### Dependencies

This configuration works best with:
- **Starship Prompt** (recommended) - Modern cross-shell prompt
- **Git** - For git branch integration
- **Node Version Manager (NVM)** - For Node.js development
- **GCC** - For C compilation features

## 🎯 What You Get

### Before
```
user@hostname:~$ 
```

### After
```
YASH@hostname:/path/to/directory (main) ⚡ 
```

Plus a beautiful welcome screen with ASCII art and system information!

## 🔧 Customization

### Colors
Modify the color variables in the prompt section:
```bash
c_user='\[\e[1;32m\]'   # Username color (bright green)
c_host='\[\e[1;36m\]'   # Hostname color (bright cyan)
c_path='\[\e[1;34m\]'   # Path color (bright blue)
```

### Welcome Message
Replace the ASCII art in the welcome section with your own design or remove it entirely.

### Aliases
Add your own aliases in the aliases section:
```bash
alias myalias='your-command-here'
```

## 📋 Compatibility

- ✅ **Ubuntu/Debian** - Fully tested
- ✅ **WSL (Windows Subsystem for Linux)** - Optimized for WSL usage
- ✅ **macOS** - Compatible with minor modifications
- ✅ **Most Linux Distributions** - Should work out of the box

## 🤝 Contributing

Feel free to:
- Fork this repository
- Add your own customizations
- Submit pull requests with improvements
- Report issues or suggestions
---

**Made with ❤️ for developers who love a beautiful terminal experience**

> Transform your boring terminal into a colorful, functional workspace that makes coding a joy!
