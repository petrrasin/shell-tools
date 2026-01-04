@echo off
setlocal enabledelayedexpansion
cls

echo STEP 1/3: Removing Registry AutoRun entry...
reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f >nul 2>&1
if "!ERRORLEVEL!"=="0" (
    echo DONE: AutoRun registry key removed.
) else (
    echo INFO: AutoRun registry key was not found or already removed.
)

echo STEP 2/3: Uninstalling Clink...
winget uninstall --id chrisant996.Clink --silent
if "!ERRORLEVEL!"=="0" (
    echo DONE: Clink uninstalled successfully.
) else (
    echo INFO: Clink was not found or could not be uninstalled via winget.
)

echo STEP 3/3: Cleaning up alias file...
set ALIAS_FILE=%USERPROFILE%\cmd_aliases.txt
if exist "!ALIAS_FILE!" (
    set /p DELETE_FILE="Found !ALIAS_FILE!. Do you want to delete it? (y/n): "
    if /i "!DELETE_FILE!"=="y" (
        del "!ALIAS_FILE!"
        echo DONE: Alias file deleted.
    ) else (
        echo INFO: Alias file kept at !ALIAS_FILE!.
    )
) else (
    echo INFO: Alias file not found.
)

echo.
echo --------------------------------------------------
echo UNINSTALL COMPLETE
echo All modifications have been reverted.
echo --------------------------------------------------
pause
endlocal