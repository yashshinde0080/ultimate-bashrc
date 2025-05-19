# simple-ubuntu-.bashrc

# Custom `.bashrc` Configuration

This is a customized `.bashrc` configuration designed to enhance the Bash shell experience for developers and power users. It provides productivity features, a colorful prompt, useful aliases, and functions to create an efficient and visually appealing terminal environment.

## Features

- **History Management**:
  - Ignores duplicate commands and commands starting with a space.
  - Appends to history file instead of overwriting.
  - Configurable history size (1000 entries stored, 2000 lines in file).
  - Adds timestamps to history entries for better tracking.

- **Shell Options**:
  - Automatically updates window size after each command.
  - Allows changing directories by typing their name alone.
  - Enables spelling correction for directories during tab completion.
  - Corrects minor spelling errors in `cd` commands.

- **Custom Prompt**:
  - Displays username, hostname, current path, and Git branch (if applicable) in vibrant colors.
  - Includes a lightning bolt symbol (`⚡`) for visual flair.
  - Falls back to a simple prompt for terminals without color support.
  - Sets the terminal title for `xterm` or `rxvt` terminals.

- **Color Support**:
  - Enables color output for `ls` and `grep` commands.
  - Configurable via a ```~/.dircolors``` file for custom color schemes.

- **Aliases**:
  - `ll`: Lists all files with detailed information.
  - `la`: Lists almost all files (excluding `.` and `..`).
  - `l`: Lists files in columns.
  - `..` and `...`: Navigate up one or two directories.
  - `cls`: Clears the terminal screen.
  - `h`: Displays command history.
  - `j`: Lists active jobs with details.
  - `python`: Sets `python3` as the default Python interpreter.

- **Functions**:
  - `mkcd`: Creates a directory and navigates into it in one step.
  - `f`: Searches for files by name in the current directory.
  - `gs`: Shows Git status and a summary of changes.
  - `extract`: Extracts various archive formats (e.g., `.tar.gz`, `.zip`, `.bz2`).

- **Environment Variables**:
  - Sets `vim` as the default editor.
  - Adds ```~/.local/bin``` to the system `PATH`.
  - Enables raw control characters for `less` to support colored output.

- **Bash Completion**:
  - Loads system-wide Bash completion for enhanced command-line interaction.

- **Welcome Message**:
  - Displays a stylized ASCII art banner with a personalized greeting.
  - Shows user, host, shell, and current date in colored text.

- **Oh My Posh Integration**:
  - Enhances the prompt with a customizable theme (default: ```kali.omp.json```).

- **Node Version Manager (NVM)**:
  - Integrates NVM for managing multiple Node.js versions.
  - Includes NVM Bash completion for easier version switching.

## Installation

1. **Backup Existing ```.bashrc```**:
   Create a backup of your current `.bashrc` file to avoid losing existing settings.

2. **Copy the Configuration**:
   Download the `.bashrc` file from this repository to your home directory.

3. **Set Permissions**:
   Ensure the file has appropriate permissions (read/write for the user).

4. **Install Dependencies**:
   - **Oh My Posh**: Install and configure the prompt theming tool with the specified theme.
   - **NVM**: Install Node Version Manager for Node.js version control.
   - **Git**: Required for Git-related features like branch display.
   - **dircolors**: Part of `coreutils`, needed for colored `ls` output.

5. **Reload the Shell**:
   Apply the new configuration by sourcing the ```.bashrc``` file or restarting your terminal.

## Usage

- **Prompt**: View your current location and Git branch in a colorful format (`username@hostname:path (git-branch) ⚡`).
- **Aliases**: Use shortcuts like `ll`, `la`, or `..` for faster navigation and file listing.
- **Functions**:
  - Create and enter a directory: ```mkcd myfolder```.
  - Find files: ```f filename```.
  - Check Git status: ```gs```.
  - Extract archives: ```extract file.tar.gz```.
- **History**: Access command history with timestamps using ```h```.
- **Oh My Posh**: Customize the prompt appearance via theme files.
- **NVM**: Switch Node.js versions with commands like ```nvm use 18```.

## Customization

- **Prompt Colors**: Adjust the ANSI color codes for username, hostname, path, Git branch, and symbols.
- **Aliases and Functions**: Add or modify shortcuts and scripts to suit your workflow.
- **History Settings**: Change the number of stored history entries or file size limits.
- **Oh My Posh**: Switch to a different prompt theme or edit the existing one.
- **Welcome Message**: Update the ASCII art or greeting text for a personal touch.

## Notes

- The configuration is optimized for terminals supporting ANSI colors (e.g., GNOME Terminal, `xterm`).
- It includes checks to ensure compatibility in minimal environments by verifying command availability.
- A fallback prompt is provided for terminals without color support.
- The archive extraction function supports common formats and can be extended.

## Troubleshooting

- **Broken Prompt**: Verify terminal color support and Oh My Posh installation.
- **Missing Commands**: Ensure dependencies like `git`, `dircolors`, or `oh-my-posh` are installed.
- **NVM Problems**: Confirm NVM is installed and the directory path is correct.
- **No Colors**: Check for a `~/.dircolors` file or generate a default configuration.

## Acknowledgments

- Inspired by community `.bashrc` setups and Bash customization resources.
- Includes ASCII art for a welcoming interface.
- Leverages Oh My Posh for advanced prompt styling.
- Integrates NVM for seamless Node.js version management.

---

Enjoy a more productive terminal experience! 🚀
