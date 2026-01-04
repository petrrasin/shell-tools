# shell-tools
Collection of small command-line utilities and helper scripts. Includes automation for CMD (Batch), PowerShell (PS), and Bash. Designed to streamline development and system maintenance tasks.

## CMD Aliases & Shell Enhancer
This repository contains a setup script to supercharge your **CMD** with **persistent aliases** and enhanced shell features via **Clink**.

#### ?? Features
- **Persistent Aliases**: Creates `%USERPROFILE%\cmd_aliases.txt` and auto-loads it via Registry.
- **Shell Enhancement**: Automatically installs **Clink** via `winget` for Bash-like features (Ctrl+V, history, better completion).
- **Robust Setup**: Handles Registry `AutoRun` with proper quoting and forces reliable `winget` sources.

#### ?? Usage
1. Open **CMD** (Command Prompt).
2. Run the script:
   ```cmd
   init-cmd-aliases.cmd