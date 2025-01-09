@echo off

rem Tentukan nama file yang berisi opsi

:chooseSubCategory
set "fileSubCategory=Database/Sub_Category/!mainCategory!.txt"

rem Cek apakah file opsi tersedia
if not exist "%fileSubCategory%" (
    rem Buatkan sub kategori baru jika tidak ada
    set "file_SubCategory=!mainCategory!.txt"
    type nul > "Database/Sub_Category/!file_SubCategory!"
    echo %_fBGreen%^> %_RESET%File %_fBGreen%!file_SubCategory!%_RESET% masih kosong.
)


rem Meminta input dari pengguna
:addSubCategory
for %%A in ("!fileSubCategory!") do set "filesize=%%~zA"
    if !filesize! equ 0 (

        rem Meminta input dari pengguna untuk baris baru
        set /p "newline=Tambahkan Sub Kategori Baru : "

        rem Menambahkan baris baru ke file
        echo !newline: =_!>> "!fileSubCategory!"

    ) else (
        goto :inputSubCategory   
    )
exit /b

:addMoreSubCategory
    rem Meminta input dari pengguna untuk baris baru
    set /p "newline=Tambahkan Sub Kategori Baru : "

    rem Menambahkan baris baru ke file
    echo !newline: =_!>> "!fileSubCategory!"
exit /b

:inputSubCategory

rem Baca file opsi dan simpan ke dalam array
        set "indexSubCategory=0"
        for /f "tokens=*" %%a in (%fileSubCategory%) do (
            set /a "indexSubCategory+=1"
            set "option[!indexSubCategory!]=%%a"
        )

        
        rem Tampilkan pesan kepada pengguna
        echo %_fBGreen%Sub Kategori:%_RESET%
        echo %greenLine%
        for /l %%i in (1, 1, !indexSubCategory!) do (
            echo %_fBGreen%[%%i]%_RESET% !option[%%i]!
        )
        echo %greenLine%
        set /p "userSubCategoryChoice=Masukkan indeks: %_fBGreen%[...]%_RESET% : "

        rem Validasi input pengguna
        set "validSubCategoryChoice="
        for /l %%i in (1, 1, !indexSubCategory!) do (
            if "%userSubCategoryChoice%"=="%%i" (
                set "validSubCategoryChoice=1"
                set "selectedSubCategory=!option[%%i]!"
                set "subCategory=!selectedSubCategory!"
            )
        )

        rem Jika pilihan tidak valid, minta input lagi
        if not defined validSubCategoryChoice (
            echo %_fRed%Indeks salah.%_RESET%
            goto :inputSubCategoryAgain
        ) else (
            exit /b
        )


        :inputSubCategoryAgain
        choice /c yn /n /m "Tambah Sub Kategori baru? Y/N : "
            set "option=%errorlevel%"
            if %option% equ 1 (
                goto :addMoreSubCategory
            ) else if %option% equ 2 (
                goto :indexSubCategory
            )
            echo %blueLine%
exit /b
