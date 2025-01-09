@echo off

echo.

rem Ambil file list klien

set "file_teamMember=Database/team.txt"
rem Cek apakah file opsi tersedia
if not exist "%file_teamMember%" (
    echo %_fBRed%File tidak ditemukan:%_RESET% %_fBYellow%%file_teamMember%%_RESET%
    pause
    exit /b
)

echo %_fBYellow%USER :
echo %yellowLine%
rem Baca file opsi dan simpan ke dalam array
set "indexTeamMember=0"
for /f "tokens=*" %%a in (%file_teamMember%) do (
    set /a "indexTeamMember+=1"
    set "option[!indexTeamMember!]=%%a"
)
rem Tampilkan pesan kepada pengguna
for /l %%i in (1, 1, !indexTeamMember!) do (
    echo %_fBYellow%[%%i]%_RESET% !option[%%i]!
)
echo %yellowLine%

rem Meminta input dari pengguna
:inputTeamMember
set /p "teamMemberChoice=Masukkan indeks: "

rem Validasi input pengguna
set "validTeamMemberChoice="
for /l %%i in (1, 1, !indexTeamMember!) do (
    if "!teamMemberChoice!"=="%%i" (
        set "validTeamMemberChoice=1"
        set "selectedTeamMember=!option[%%i]!"
        set "isLoginUser=!selectedTeamMember!"
        set "isUser=isUser"
    )
)

rem Jika pilihan tidak valid, minta input lagi
if not defined validTeamMemberChoice (
    echo %_fRed%Indeks salah.%_RESET%
    goto :inputTeamMember
)
exit /b
