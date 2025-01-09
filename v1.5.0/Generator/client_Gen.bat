@echo off

echo.

rem Ambil file list klien

set "file_clientMember=Database/client.txt"
rem Cek apakah file opsi tersedia
if not exist "%file_clientMember%" (
    echo %_fBRed%File tidak ditemukan:%_RESET% %_fBYellow%%file_clientMember%%_RESET%
    pause
    exit /b
)

echo %_fMag%CLIENT :
echo %magLine%
rem Baca file opsi dan simpan ke dalam array
set "indexClientMember=0"
for /f "tokens=*" %%a in (%file_clientMember%) do (
    set /a "indexClientMember+=1"
    set "option[!indexClientMember!]=%%a"
)
rem Tampilkan pesan kepada pengguna
for /l %%i in (1, 1, !indexClientMember!) do (
    echo %_fBMag%[%%i]%_RESET% !option[%%i]!
)
echo %magLine%

rem Meminta input dari pengguna
:inputClientMember
set /p "clientMemberChoice=Masukkan indeks: "

rem Validasi input pengguna
set "validClientMemberChoice="
for /l %%i in (1, 1, !indexClientMember!) do (
    if "!clientMemberChoice!"=="%%i" (
        set "validClientMemberChoice=1"
        set "selectedClientMember=!option[%%i]!"
        set "isSelectedClient=!selectedClientMember!"
        set "isClient=isClient"
        echo Client Member : %_fBGreen%!selectedClientMember!%_RESET%
    )
)

rem Jika pilihan tidak valid, minta input lagi
if not defined validClientMemberChoice (
    echo %_fRed%Indeks salah.%_RESET%
    goto :inputClientMember
)
exit /b
