@echo off

rem Memeriksa format tanggal untuk menyesuaikan pengambilan hari ini
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do (
    set "day=%%b"
    set "setmonth=%%a"
    set "year=%%c"
)

rem Konversi nama bulan menjadi nama lengkap dalam bahasa Inggris
if "%setmonth%"=="01" set "month=January"
if "%setmonth%"=="02" set "month=February"
if "%setmonth%"=="03" set "month=March"
if "%setmonth%"=="04" set "month=April"
if "%setmonth%"=="05" set "month=May"
if "%setmonth%"=="06" set "month=June"
if "%setmonth%"=="07" set "month=July"
if "%setmonth%"=="08" set "month=August"
if "%setmonth%"=="09" set "month=September"
if "%setmonth%"=="10" set "month=October"
if "%setmonth%"=="11" set "month=November"
if "%setmonth%"=="12" set "month=December"

rem Tampilkan tanggal dalam format yang diinginkan
set "formatted_Date=%day%_%month%_%year%"
set "projectDate=%formatted_Date%"