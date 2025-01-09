@echo off

:chooseMainCategory
rem Tentukan nama file yang berisi opsi
call config/config_ANSI.bat
set "fileCategory=Database/category.txt"

rem Cek apakah file opsi tersedia
if not exist "%fileCategory%" (
    echo %_fBRed%File kategori tidak ditemukan:%_RESET% %_fBYellow%%fileCategory%%_RESET%
    pause
    exit /b
)

rem Baca file opsi dan simpan ke dalam array
set "indexCategory=0"
for /f "tokens=*" %%a in (%fileCategory%) do (
    set /a "indexCategory+=1"
    set "option[!indexCategory!]=%%a"
)

rem Tampilkan pesan kepada pengguna
echo %_fBGreen%Kategori:%_RESET%
echo %greenLine%
for /l %%i in (1, 1, !indexCategory!) do (
    echo %_fBGreen%[%%i]%_RESET% !option[%%i]!
)
echo %greenLine%
goto :inputMainCategory

:addMoreCategory
rem Meminta input dari pengguna untuk baris baru
set /p "newline=Tambahkan Kategori Baru : "

rem Menambahkan baris baru ke file
echo !newline: =_!>> "!fileCategory!"
exit /b

rem Meminta input dari pengguna
:inputMainCategory
set /p "userCategoryChoice=Masukkan indeks %_fBGreen%[...]%_RESET% : "

rem Validasi input pengguna
set "validCategoryChoice="
for /l %%i in (1, 1, !indexCategory!) do (
    if "!userCategoryChoice!"=="%%i" (
        set "validCategoryChoice=1"
        set "selectedCategory=!option[%%i]!"
        set "mainCategory=!selectedCategory!"
    )
)

rem Jika pilihan tidak valid, minta input lagi
if not defined validCategoryChoice (
    echo %_fRed%Indeks salah.%_RESET%
    goto :inputMainCategoryAgain
) else (
            exit /b
        )

:inputMainCategoryAgain
        choice /c yn /n /m "Tambah Kategori baru? Y/N : "
            set "option=%errorlevel%"
            if %option% equ 1 (
                goto :addMoreCategory
            ) else if %option% equ 2 (
                goto :inputMainCategory
            )
            echo %blueLine%

exit /b