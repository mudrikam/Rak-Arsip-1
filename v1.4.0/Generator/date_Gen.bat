@echo off

rem Memeriksa format tanggal untuk menyesuaikan pengambilan hari ini
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do (
    set "day=%%b"
    set "month=%%a"
    set "year=%%c"
)

rem Konversi nama bulan menjadi nama lengkap dalam bahasa Inggris
if "%month%"=="01" set "month=January"
if "%month%"=="02" set "month=February"
if "%month%"=="03" set "month=March"
if "%month%"=="04" set "month=April"
if "%month%"=="05" set "month=May"
if "%month%"=="06" set "month=June"
if "%month%"=="07" set "month=July"
if "%month%"=="08" set "month=August"
if "%month%"=="09" set "month=September"
if "%month%"=="10" set "month=October"
if "%month%"=="11" set "month=November"
if "%month%"=="12" set "month=December"

rem Tampilkan tanggal dalam format yang diinginkan
set "formatted_Date=%day%_%month%_%year%"
set "projectDate=%formatted_Date%"