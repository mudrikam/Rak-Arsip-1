@echo off

:main_Project_Type
echo %_fBMag%Project Type :
echo %magLine%
choice /c 123 /n /m "%_bBGreen%%_fBlack% [1] MOCKUP %_RESET% %_bBYellow%%_fBlack% [2] RENDER %_RESET% %_bBMag%%_fBlack% [3] VIDEO %_RESET%"

set "option=%errorlevel%"
if %option% equ 1 (
    set "main_Project_Type=MOCKUP"
    set "nav_ProjectType=navprojecttype"
) else if %option% equ 2 (
    set "main_Project_Type=RENDER"
    set "nav_ProjectType=navprojecttype"
) else if %option% equ 3 (
    set "main_Project_Type=VIDEO"
    set "nav_ProjectType=navprojecttype"
)
