@echo off
setlocal enabledelayedexpansion
cls

set USER_DIR=%USERPROFILE%
set ALIAS_FILE=%USER_DIR%\cmd_aliases.txt

echo STEP 1/5: Setting up alias file path...
echo INFO: Alias file path set to !ALIAS_FILE!

echo STEP 2/5: Checking and creating alias file if needed...
if exist "!ALIAS_FILE!" (
    echo INFO: Alias file already exists. Skipping creation.
) else (
    echo INFO: Creating alias file with default aliases...
    (
        echo ll=dir /w
        echo gs=git status
        echo gp=git pull
        echo gd=git diff
        echo touch=fsutil file createnew $1 0
        echo cat=type $*
        echo dbld=dotnet build
        echo dtst=dotnet test
        echo edsni=notepad "%ALIAS_FILE%"
        echo qq=exit
        echo heelp=doskey /macros
    ) > "!ALIAS_FILE!"
    echo DONE: Default alias file created.
)

echo STEP 3/5: Updating Windows Registry for AutoRun...
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "doskey /macrofile=\"!ALIAS_FILE!\"" /f
echo DONE: Registry updated.

echo STEP 4/5: Installing Clink (enhanced CMD)...
winget install --id chrisant996.Clink --source winget --silent --accept-source-agreements --accept-package-agreements
if "!ERRORLEVEL!"=="0" (
    echo DONE: Clink installation successful or already present.
) else (
    echo WARNING: Clink installation returned code !ERRORLEVEL!.
)

echo STEP 5/5: Finalizing...
echo --------------------------------------------------
echo SETUP COMPLETE!
echo Alias file: !ALIAS_FILE!
echo.
echo TIP: Open a NEW CMD window to apply changes.
echo TIP: In the new window, type 'heelp' to see active aliases.
echo --------------------------------------------------
pause
endlocal