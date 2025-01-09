@echo off


REM Reset untuk memulai program dari ----------------------------------------------
:programStart
call :enableANSI
call :loadConfigFile
call :header

setlocal EnableDelayedExpansion

REM untuk cek label tertentu
rem goto :project_Microstock

REM Tampilkan menu utama (HOME) ---------------------------------------------------
:main_Menu
echo %blueLine%
echo %_fBRed%+---------------------------------------------------+
echo ^|                     PILIH ROOT                    ^|%_RESET%

rem Menentukan lebar kolom
set "ID_Width=6"
set "Nama_Width=20"
set "Departemen_Width=23"

rem Membuat garis horizontal
set "Line="
for /l %%a in (1, 1, %ID_Width%) do set "Line=!Line!-"
set "Line=!Line!+"
for /l %%a in (1, 1, %Nama_Width%) do set "Line=!Line!-"
set "Line=!Line!+"
for /l %%a in (1, 1, %Departemen_Width%) do set "Line=!Line!-"
set "Line=!Line!+"

echo +%Line%%_RESET%

rem Menampilkan baris data
echo ^|  1   ^| MICROSTOCK         ^| Projek Microstock DSNA^|
echo ^|  2   ^| CLIENT             ^| Projek Klien DSNA     ^|
echo ^|  3   ^| ASSETS             ^| Folder Asset DSNA     ^|
echo ^|  4   ^| TEAM               ^| Folder Asset Team     ^|
echo ^|  5   ^| SOCMED             ^| Folder Portofolio     ^|
echo ^|  %_fBRed%Q%_RESET%   ^| %_fBRed%Exit%_RESET%               ^| Keluar dari CMD       ^|

rem Menampilkan footer tabel
echo +%Line%

choice /c 1234q /n /m "Pilih Opsi (1/2/3/4/%_fBRed%Q%_RESET%): "
set "option=%errorlevel%"
if %option% equ 1 (
    set "rootFolder=MICROSTOCK"
    goto :chooseCategory
) else if %option% equ 2 (
    echo CLIENT
    pause
    goto programStart
) else if %option% equ 3 (
    echo ASSETS
    pause
    goto programStart
) else if %option% equ 4 (
    echo TEAM
    pause
    goto programStart
) else if %option% equ 5 (
    goto :ask_exit
) else (
    goto :programStart
)
exit /b
REM Akhir menu utama (End HOME) ---------------------------------------------------

REM Pilih Kategori (End HOME) ---------------------------------------------------
:chooseCategory
call :header

echo %_fBBlue%^> %_RESET%ROOT : %_fBYellow%%RootFolder%%_RESET%
echo %greenLine%
rem Tentukan nama file yang berisi opsi
set "fileCategory=Z:\DSNA_FOLDER_GENERATOR\category.txt"

rem Cek apakah file opsi tersedia
if not exist "%fileCategory%" (
    echo File kategori tidak ditemukan: %fileCategory%
    pause
    exit /b
)

rem Baca file opsi dan simpan ke dalam array
set "index=0"
for /f "tokens=*" %%a in (%fileCategory%) do (
    set /a "index+=1"
    set "option[!index!]=%%a"
)
rem Tampilkan pesan kepada pengguna
echo Pilih Kategori:
echo %greenLine%
for /l %%i in (1, 1, !index!) do (
    echo %_fBGreen%[%%i]%_RESET% !option[%%i]!
)
echo %greenLine%

rem Meminta input dari pengguna
:inputMainCategory
set /p "userCategoryChoice=Masukkan indeks: "

rem Validasi input pengguna
set "validCategoryChoice="
for /l %%i in (1, 1, !index!) do (
    if "%userCategoryChoice%"=="%%i" (
        set "validCategoryChoice=1"
        set "selectedCategory=!option[%%i]!"
        set "mainCategory=!selectedCategory!"
        echo Kategori : %_fBGreen%!selectedCategory!%_RESET%
    )
)

rem Jika pilihan tidak valid, minta input lagi
if not defined validCategoryChoice (
    echo %_fRed%Indeks salah.%_RESET%
    goto :inputMainCategory
)
    echo %blueLine%
    goto :chooseSubCategory
exit /b

:chooseSubCategory
call :header
echo %_fBBlue%^> %_RESET%ROOT : %_fBYellow%%RootFolder%%_RESET%

echo %blueLine%
echo.
echo %greenLine%
rem Tentukan nama file yang berisi opsi
set "fileSubCategory=Z:\DSNA_FOLDER_GENERATOR\subcategory.txt"

rem Cek apakah file opsi tersedia
if not exist "%fileSubCategory%" (
    echo File sub kategori tidak ditemukan: %fileSubCategory%
    pause
    exit /b
)

rem Baca file opsi dan simpan ke dalam array
set "index=0"
for /f "tokens=*" %%a in (%fileSubCategory%) do (
    set /a "index+=1"
    set "option[!index!]=%%a"
)
rem Tampilkan pesan kepada pengguna
echo Kategori Utama : %_fBGreen%!selectedCategory!%_RESET%
echo Pilih Sub Kategori:
echo %greenLine%
for /l %%i in (1, 1, !index!) do (
    echo %_fBGreen%[%%i]%_RESET% !option[%%i]!
)
echo %greenLine%

rem Meminta input dari pengguna
:inputSubCategory
set /p "userChoice=Masukkan indeks: "

rem Validasi input pengguna
set "validChoice="
for /l %%i in (1, 1, !index!) do (
    if "%userChoice%"=="%%i" (
        set "validChoice=1"
        set "selectedSubCategory=!option[%%i]!"
        set "subCategory=!selectedSubCategory!"
        echo Kategori : %_fBGreen%!selectedSubCategory!%_RESET%
    )
)

rem Jika pilihan tidak valid, minta input lagi
if not defined validChoice (
    echo %_fRed%Indeks salah.%_RESET%
    goto :inputSubCategory
)
    call :header
    echo %_fBBlue%^> %_RESET%ROOT : %_fBYellow%%RootFolder%%_RESET%
    echo %_fBBlue%^> %_RESET%Category : %_fBYellow%%mainCategory%%_RESET%
    echo %_fBBlue%^> %_RESET%Sub Category : %_fBYellow%%subCategory%%_RESET%
    echo %blueLine%
    set choosenRoot=%rootFolder%

    if "%choosenRoot%"=="MICROSTOCK" (
        goto :project_Microstock
    ) else (
        echo alihkan ke operasi lain sesuai root
    )
    pause
exit /b
REM Akhir Pilih Kategori (End HOME) ---------------------------------------------------

REM Project Microstock Start ------------------------------------------------------
:project_Microstock
call :header
echo %_fBBlue%^> %_RESET%ROOT : %_fBYellow%%RootFolder%%_RESET%
echo %_fBBlue%^> %_RESET%Category : %_fBYellow%%mainCategory%%_RESET%
echo %_fBBlue%^> %_RESET%Sub Category : %_fBYellow%%subCategory%%_RESET%
echo %blueLine%

echo %_fBGreen%+---------------------------------------------------+
echo ^|                    TIPE PROJEK                    ^|%_RESET%

rem Menentukan lebar kolom
set "ID_Width=6"
set "Nama_Width=20"
set "Departemen_Width=23"

rem Membuat garis horizontal
set "Line="
for /l %%a in (1, 1, %ID_Width%) do set "Line=!Line!-"
set "Line=!Line!+"
for /l %%a in (1, 1, %Nama_Width%) do set "Line=!Line!-"
set "Line=!Line!+"
for /l %%a in (1, 1, %Departemen_Width%) do set "Line=!Line!-"
set "Line=!Line!+"

echo +%Line%%_RESET%

rem Menampilkan baris data
echo ^|  1   ^| Single Image       ^| 1 Projek              ^|
echo ^|  2   ^| Pack               ^| 3 s.d 5 Projek        ^|
echo ^|  3   ^| Batch              ^| Lebih Dari 10 Projek  ^|
echo ^|  %_fBRed%Q%_RESET%   ^| %_fBRed%Back%_RESET%               ^| Ke menu sebelumnya    ^|

rem Menampilkan footer tabel
echo +%Line%

set "projectTypeSingle=Single"
set "projectTypePack=Pack"
set "projectTypeBatch=Batch"

choice /c 123q /n /m "Pilih Opsi (1/2/3/%_fBRed%Q%_RESET%): "
set "option=%errorlevel%"
if %option% equ 1 (
    call :header
    echo %_fBBlue%^> %_RESET%ROOT : %_fBYellow%%RootFolder%%_RESET%
    echo %_fBBlue%^> %_RESET%Type : %_fBYellow%%projectTypeSingle% %_RESET%
    echo %_fBBlue%^> %_RESET%Category : %_fBYellow%%mainCategory%%_RESET%
    echo %_fBBlue%^> %_RESET%Sub Category : %_fBYellow%%subCategory%%_RESET%
    echo %blueLine%
    echo %redLine%
    :checkInput_FolderName
    set "inputFolderName="
    :: Mengatur input nama folder
    set /p "inputFolderName=%_fBYellow%Nama Projek%_RESET%: "
    :: Periksa apakah input kosong
    if "!inputFolderName!"=="" (
        echo %_fBRed%Nama folder masih kosong...
        goto checkInput_FolderName
    ) else (
        echo %greenLine%
        set "FolderName=!inputFolderName: =_!"
        echo %_fBGreen%^> Nama Folder : %projectDate%_!FolderName!_%projectTypeSingle%%_RESET%
        echo %greenLine%
        
        choice /c ynq /n /m %_fBYellow%"%_fBRed%> %_RESET% Buat Folder %_fYellow%"%projectDate%_!FolderName!_%projectTypeSingle%" %_RESET%(Y/N/%_fBRed%Q%_RESET%) : "%_RESET%
        
        rem Tangkap errorlevel saat choice dieksekusi
        set "option=!errorlevel!"

        rem Periksa opsi yang dipilih
        if !option! equ 1 (
            goto :singleProjectGenerator
        ) else if !option! equ 2 (
            goto :checkInput_FolderName
        ) else if !option! equ 3 (
            goto :project_Microstock
        )
    )

) else if %option% equ 2 (
    echo Anda memilih opsi 2.
) else if %option% equ 3 (
    echo Anda memilih opsi 3.
) else if %option% equ 4 (
    goto :programStart
) else (
    goto :ask_exit
)
exit /b
REM Project Microstock End ------------------------------------------------------

:ask_exit
choice /c yn /n /m "%_fBRed%Yakin Keluar?%_RESET% (Y/N): "
set "option=%errorlevel%"

if %option% equ 1 (
    exit
) else if %option% equ 2 (
    cls
    call :header
    goto :main_Menu
    pause
) else (
    echo Pilihan tidak valid.
    goto :main_Menu
)

pause
goto :main_Menu

:header
cls
rem Membuat tab pada output
set "tab=        "
set "spacer=                                                     "
set "basicLine=-----------------------------------------------------"
set "blueLine=%_fBBlue%-----------------------------------------------------%_RESET%"
set "redLine=%_fBRed%-----------------------------------------------------%_RESET%"
set "greenLine=%_fBGreen%-----------------------------------------------------%_RESET%"

REM Header generator
echo %_fBlack%%_bBWhite%%spacer%
echo %_fBlack%%_bBWhite%%tab%    Folder Generator DSNA Mockup    %programVersion% %tab%
echo %_fBlack%%_bBWhite%%spacer%%_RESET%
echo %blueLine%
call :dateGen
echo %_fBBlue%^> %_RESET%Config %fileConfig%
echo %_fBBlue%^> %_RESET%Date : %_fBYellow%%projectDate%%_RESET%
echo %_fBBlue%^> %_RESET%Disk : %_fBYellow%%selectedDisk%%_RESET%

exit /b


:singleProjectGenerator
rem Inisialisasi counter untuk penamaan auto increment
set "counter=1"

rem Loop untuk mencari nama folder yang tersedia
:check_loop
set "formattedCounter=000%counter%"
set "formattedCounter=!formattedCounter:~-3!"
set "singleProjectName=%selectedDisk%%rootFolder%\%mainCategory%\%subCategory%\%year%\%month%\%projectTypeSingle%\%day%\%projectDate%_%inputFolderName%_%projectTypeSingle%_!formattedCounter!"

if exist "!singleProjectName!" (
    echo %_fBRed%^> %_fBRed%Sudah ada.%_RESET%%_RESET% "%inputFolderName%_%projectTypeSingle%_!formattedCounter!"
    set /a "counter+=1"
    goto :check_loop
)
    echo %redLine%
rem Membuat folder dengan nama yang telah ditentukan
if not exist "!singleProjectName!" (
    mkdir "!singleProjectName!"
    set "projectType=Single"
    set "projectName=%projectDate%_%inputFolderName%_%projectTypeSingle%_!formattedCounter!"

    :: Buatkan File template penamaan file
    call :naming_TemplateGenerator
    echo %greenLine%
    echo %_fBGreen%^> %_fGreen% Dibuat. "!projectName!"%_RESET%
    rem Loop untuk membuat subfolder utama
    for %%a in (%single_SubFolders%) do (
        rem Memeriksa apakah subfolder utama sudah ada
        if not exist "!singleProjectName!\%%a" (
            mkdir "!singleProjectName!\%%a"
            echo ^|____%_fYellow%^> "%%a"%_RESET%
        ) else (
            echo %%a sudah ada.
        )
    )
    echo ^|____%_fBCyan%^> "!projectName!.txt" %_RESET% 
    echo %greenLine%
)

rem Tampilkan peringatan dan option y/n untuk membuat folder berikutnya
echo %redLine%
set /a "counter+=1"
choice /c yn /n /m %_fBYellow%"%_fBBlue%> %_RESET% Buat folder %_fYellow%"%projectDate%_%FolderName%_%projectTypeSingle%_00%counter%" %_RESET% jika Ya (Y/N) : "%_RESET%
echo %redLine%
set "option=%errorlevel%"
if %option% equ 1 (
    set /a "counter+=1"
    goto :check_loop
) else if %option% equ 2 (
    goto :programStart
)
exit /b

:dateGen
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
set "projectDate=%day%_%month%_%year%"
exit /b

:enableANSI
REM Enable ANSI escape codes

echo [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 > "%TEMP%\ansi.ps1"
powershell -ExecutionPolicy Bypass -File "%TEMP%\ansi.ps1"

REM ANSI escape sequences

set "ESC="

REM Colors ---------------------------------------------------------------------------+

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
exit /b

:loadConfigFile
REM Config -----------------------------------------------------------------------
:: Tentukan path ke file config.txt
set "fileConfig=config.bat"

:: Periksa apakah file ada
if not exist "%fileConfig%" (
    echo File %fileConfig% tidak ditemukan.
    pause
    exit /b
)

:: Baca file config.txt
for /f "tokens=1,* delims==" %%A in (%fileConfig%) do (
    if "%%A"=="Disk" (
        set "selectedDisk=%%B:\"
    ) else if "%%A"=="team_Member" (
        set "team_Member=%%B"
    ) else if "%%A"=="client_Member" (
        set "client_Member=%%B"
    ) else if "%%A"=="single_SubFolders" (
        set "single_SubFolders=%%B"
    ) else if "%%A"=="version" (
        set "programVersion=%%B"
    )
)

:: Mengambil Nama-nama orang dari file config.txt
set "teamMemberIndex=0"
set "teamMemberName="
set "clientMemberIndex=0"
set "clientMemberName="
for %%T in (%team_Member%) do (
    set /a teamMemberIndex-=1
    if !teamMemberIndex! equ -1 (
        set "teamMemberName=%%T"
    )
)
for %%C in (%client_Member%) do (
    set /a clientMemberIndex-=1
    if !clientMemberIndex! equ -1 (
        set "clientMemberName=%%C"
    )
)

REM End Config -----------------------------------------------------------------
exit /b

:naming_TemplateGenerator
REM Start Naming template generator -----------------------------------------------------------------

:: Mengatur nilai variabel
if "!projectType!"=="Single" (
    set "naming_TemplateFile=!singleProjectName!\%projectDate%_%FolderName%_%projectTypeSingle%_00%counter%.txt"
) else (
    echo projectType kosong
    pause
)

    :: Menyimpan variabel ke dalam file
    (
        echo File  :
        echo %basicLine%
        echo %basicLine%
        echo File Blender :
        echo %basicLine%
        echo !projectName!_Base.blend
        echo !projectName!_Shading.blend
        echo !projectName!_Highlight.blend
        echo !projectName!_Masking.blend
        echo %basicLine%
        echo.
        echo File PSD :
        echo %basicLine%
        echo !projectName!.psd
        echo %basicLine%
    ) > "%naming_TemplateFile%"
REM End Naming template generator -----------------------------------------------------------------
exit /b

endlocal