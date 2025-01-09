@echo off

:main_Menu
echo %_fBRed%ROOT :
echo %redLine%
choice /c 123 /n /m "%_bBBlue%%_fBlack% [1] MICROSTOCK %_RESET% %_bBMag%%_fBlack% [2] CLIENT %_RESET% %_bBGreen%%_fBlack% [3] TEAM %_RESET%"

set "option=%errorlevel%"
if %option% equ 1 (
    set "rootFolder=MICROSTOCK"
    set "menu_Type=menuType"
    set "selectedDisk=M:\"
) else if %option% equ 2 (
    set "rootFolder=CLIENT"
    set "menu_Type=menuType"
    set "selectedDisk=K:\"
) else if %option% equ 3 (
    set "rootFolder=TEAM"
    set "menu_Type=menuType"
    set "selectedDisk=T:\"
)
