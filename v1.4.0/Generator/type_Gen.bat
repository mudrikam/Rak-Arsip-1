@echo off

:type_Generator
echo %_fBRed%TIPE :
echo %redLine%
choice /c 12345 /n /m "%_bBBlue%%_fBlack% [1] SINGLE %_RESET% %_bBMag%%_fBlack% [2] PACK %_RESET% %_bBGreen%%_fBlack% [3] BATCH %_RESET%"

set "option=%errorlevel%"
if %option% equ 1 (
    set "projectType=SINGLE"
    set "isType=isType"
) else if %option% equ 2 (
    set "projectType=PACK"
    set "isType=isType"
) else if %option% equ 3 (
    set "projectType=BATCH"
    set "isType=isType"
)