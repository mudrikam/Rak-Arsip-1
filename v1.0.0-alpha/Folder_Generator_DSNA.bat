@echo off

setlocal EnableDelayedExpansion
REM Enable ANSI escape codes

echo [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 > "%TEMP%\ansi.ps1"
powershell -ExecutionPolicy Bypass -File "%TEMP%\ansi.ps1"

REM ANSI escape sequences

set "ESC="

REM Colors

Set _fBlack=[30m
Set _bBlack=[40m
Set _fRed=[31m
Set _bRed=[41m
Set _fGreen=[32m
Set _bGreen=[42m
Set _fYellow=[33m
Set _bYellow=[43m
Set _fBlue=[34m
Set _bBlue=[44m
Set _fMag=[35m
Set _bMag=[45m
Set _fCyan=[36m
Set _bCyan=[46m
Set _fLGray=[37m
Set _bLGray=[47m
Set _fDGray=[90m
Set _bDGray=[100m
Set _fBRed=[91m
Set _bBRed=[101m
Set _fBGreen=[92m
Set _bBGreen=[102m
Set _fBYellow=[93m
Set _bBYellow=[103m
Set _fBBlue=[94m
Set _bBBlue=[104m
Set _fBMag=[95m
Set _bBMag=[105m
Set _fBCyan=[96m
Set _bBCyan=[106m
Set _fBWhite=[97m
Set _bBWhite=[107m
Set _RESET=[0m

rem Membuat tab pada output
set "tab=   "
set "spacer=                                           "

REM Contoh penggunaan warna teks
echo %_fBlack%%_bBRed%%spacer%
echo %_fBlack%%_bBRed%%tab% Folder Generator DSNA Mockup v1.1.0 %tab%
echo %_fBlack%%_bBRed%%spacer%%_RESET%
echo.

rem Tentukan root folder
set selecteddisk=Z:\
set rootFolder=MICROSTOCK
set mainFolder=CONTENT
set CategoryFolder=Food_And_Beverage
set subCategoryFolder=Bottle
set dateCreated=28_Jun_2024
set year=2024
set month=Jun
set projectType=Batch
set projectName=Milk_Bottle_Mockup
set projectSN=001
set nameGenerator=%dateCreated%_%projectName%_%projectType%_%projectSN%

echo %_fBRed%^>%_RESET% FOLDER STRUCTURE ^|
echo --------------------------------------------------------------------------------

echo %_bBYellow%%_fBlack% Disk : %selecteddisk% %_RESET%
echo %_fBWhite%%_bDGray% Root %tab% : %_fBRed%%_bBWhite% %rootFolder% %_RESET%
echo %tab%%_fBWhite% %_bDGray% Main : %_fBRed%%_bBWhite% %mainFolder% %_RESET%
echo %tab%%tab% %_fBWhite% %_bDGray% Category %tab%%tab% : %_fBlack%%_bBWhite% %CategoryFolder% %_RESET%
echo %tab%%tab%%tab% %_fBWhite% %_bDGray% Sub Category : %_fBlack%%_bBWhite% %subCategoryFolder% %_RESET%
echo.
echo --------------------------------------------------------------------------------
echo %_fBRed%^>%_RESET% Project          ^| Data
echo --------------------------------------------------------------------------------
echo %_fBRed%^>%_RESET% Project Date     ^| %dateCreated%
echo %_fBRed%^>%_RESET% Project Type     ^| %projectType%
echo %_fBRed%^>%_RESET% Project Name     ^| %projectName%
echo %_fBRed%^>%_RESET% Project Sequence ^| %projectSN%
echo --------------------------------------------------------------------------------
echo %_fBRed%^>%_RESET% Generated Name   ^| %_fBYellow%%nameGenerator%%_RESET%
echo --------------------------------------------------------------------------------
echo %_fBRed%^>%_RESET% File Naming Template
echo %_fBRed%^>%_RESET% %_fBYellow%%rootFolder%\%mainFolder%\%CategoryFolder%\%subCategoryFolder%\%year%\%month%\%projectType%\File_Name_Template.txt%_RESET%
rem nanti isinya lebih dari 1
echo --------------------------------------------------------------------------------

rem Tentukan root folder
set directoryGenerator=%selecteddisk%%rootFolder%\%mainFolder%

rem Daftar subfolder yang ingin dibuat di dalam root folder
set folderGenerator=%CategoryFolder%\%subCategoryFolder%\%year%\%month%\%projectType%\%nameGenerator%

echo.
echo.
rem Buat subfolder di dalam root folder
echo %_fBRed%^>%_RESET% Status           ^| %_fBRed%^>%_RESET% Directory
echo --------------------------------------------------------------------------------

if "%projectType%" == "Batch" (
    for %%f in (%folderGenerator%) do (
    if not exist "%directoryGenerator%\%%f" (
        mkdir "%directoryGenerator%\%%f"
        echo %_RESET%%_fBlack%%_bBGreen%^> created  %_RESET%^> %_bBGreen%%_fBlack%%%f %_RESET%
    ) else (
        echo %_RESET%%_fBlack%%_bBRed%^> exists %_RESET%^> %_bBYellow%%_fBlack%%%f %_RESET%
    )
    )
)
echo.
echo %_RESET%

endlocal

pause