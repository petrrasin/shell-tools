# shell-tools
Collection of small command-line utilities and helper scripts. Includes automation for CMD (Batch), PowerShell (PS), and Bash. Designed to streamline development and system maintenance tasks.

## CMD Aliases & Shell Enhancer
This repository contains a setup script to supercharge your **CMD** with **persistent aliases** and enhanced shell features via **Clink**.

#### 📝 Features

- Creates (if missing) `%USERPROFILE%\cmd_aliases.txt` with a few example aliases.
- Sets the `AutoRun` registry value so every new **CMD** window loads aliases from that file.

#### 🔧 Usage

1. Open **CMD** (not PowerShell).
2. Run the script:
   ```cmd
   init-cmd-aliases.cmd
   ```
3. Close all CMD windows and open a **new** CMD window.
4. Show loaded aliases:
   ```cmd
   doskey /macros:all
   ```
   or
   ```cmd
   heelp
   ```

### Default aliases

```
ll     = dir /w									      Wide directory listing
gs     = git status								      Git status shortcut
gp     = git pull								         Git pull shortcut
gd     = git diff								         Git diff shortcut
cat    = type $*  								      Print file content
touch  = fsutil file createnew $1 0   			   Create empty file
dbld   = dotnet build  							      Build .NET project
dtst   = dotnet test  							      Run .NET tests
edsni  = notepad %USERPROFILE%\cmd_aliases.txt  Edit your alias file instantly
qq     = exit  									      Quick close window
heelp  = doskey /MACROS:ALL   					   List all active aliases
```

> Note: To add more aliases, run edsni, add your lines, and restart CMD.

### ✅ How it works (AutoRun)

The script automates two main things:
1. Registry AutoRun: Sets **HKCU\Software\Microsoft\Command Processor\AutoRun** to point to your macro file.
2. Clink Integration: Installs Clink to provide a modern shell experience (history search, better Tab-completion).

### ❌ Uninstall / Disable

To revert all changes:

1. Remove AutoRun:
   ```cmd
   reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f
   ```
2. Uninstall Clink:
   ```cmd
   winget uninstall chrisant996.Clink
   ```

3. Optionally delete the file:
   ```cmd
   del "%USERPROFILE%\cmd_aliases.txt"
   ```

### 🛠️ Technical Details

1. Source Integrity: The script forces **--source** winget to avoid common Microsoft Store certificate errors (**0x8a15005e**).
2. Path Safety: All paths in the Registry are escaped and quoted to ensure compatibility with usernames containing spaces.
