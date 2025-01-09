@echo off

:checkInput_FolderName
set "inputFolderName="
:: Mengatur input nama folder
set /p "inputFolderName=%_fBYellow%Nama Projek%_RESET%: "
:: Periksa apakah input kosong
if "!inputFolderName!"=="" (
    echo %_fBRed%Nama folder masih kosong...
    goto :checkInput_FolderName
) else (
    echo %yellowLine%
    set "FolderName=!inputFolderName: =_!"
    if not "!rootFolder!" == "ASSETS" echo %_fBYellow%^> Buat Projek : !FolderName!_!projectType!_!projectDate!%_RESET%
    if "!rootFolder!" == "ASSETS" echo %_fBYellow%^> Buat Asset : !FolderName!%_RESET%
    
    echo %yellowLine%
    
    choice /c ynq /n /m "%_bGreen%%_fBlack% [Y] Yes %_RESET% %_bBRed%%_fBlack% [N] No %_RESET% %_bDGray% [Q] Quit %_RESET%"
    
    rem Tangkap errorlevel saat choice dieksekusi
    set "option=!errorlevel!"

    rem Periksa opsi yang dipilih
    if !option! equ 1 (
        goto :ProjectGenerator
    ) else if !option! equ 2 (
        goto :checkInput_FolderName
    ) else if !option! equ 3 (
        set "programReset=Yes"
    )
)
exit /b

:ProjectGenerator
rem Inisialisasi counter untuk penamaan auto increment
set "counter=1"

echo.
echo %redLine%

rem Loop untuk mencari nama folder yang tersedia
:check_loop
set "formattedCounter=%counter%"
:: set "formattedCounter=!formattedCounter:~-3!"
if "!isUser!" == "isUser" (
    set "generateProjectDir=%selectedDisk%%main_Project_Type%\%isLoginUser%\%mainCategory%\%subCategory%\%year%\%month%\%projectType%\%day%\!formattedCounter!_%FolderName%_%projectType%_%projectDate%"
    goto :makeFolders
    exit /b
) else if "!isClient!" == "isClient" (
    set "generateProjectDir=%selectedDisk%%main_Project_Type%\%isSelectedClient%\%mainCategory%\%subCategory%\%year%\%month%\%projectType%\%day%\!formattedCounter!_%FolderName%_%projectType%_%projectDate%"
    goto :makeFolders
    exit /b
) else (
    set "generateProjectDir=%selectedDisk%%main_Project_Type%\%mainCategory%\%subCategory%\%year%\%month%\%projectType%\%day%\!formattedCounter!_%FolderName%_%projectType%_%projectDate%"
    goto :makeFolders
    exit /b
)
exit /b

:makeFolders
if exist "!generateProjectDir!" (
    echo %_fBRed%^> %_fBRed%Sudah ada.%_RESET%%_RESET% "!formattedCounter!_%FolderName%_%projectType%_%projectDate%"
    set /a "counter+=1"
    goto :check_loop
)

echo %redLine%
rem Membuat folder dengan nama yang telah ditentukan
mkdir "!generateProjectDir!"
set "projectName=!formattedCounter!_%FolderName%_%projectType%_%projectDate%"

echo %greenLine%
echo %_fBGreen%^> %_fGreen%Dibuat. "!projectName!"%_RESET%

:subFolderLoop
:: Loop untuk membuat subfolder utama
if "!projectType!" == "SINGLE" (
    for %%a in (%single_SubFolders%) do (
        rem Memeriksa apakah subfolder utama sudah ada
        if not exist "!generateProjectDir!\%%a" (
            mkdir "!generateProjectDir!\%%a"
        ) else (
            echo %%a sudah ada.
        )
    )
) else if "!projectType!" == "PACK" (
    for %%b in (%pack_SubFolders%) do (
        rem Memeriksa apakah subfolder utama sudah ada
        if not exist "!generateProjectDir!\%%b" (
            mkdir "!generateProjectDir!\%%b"
        ) else (
            echo %%b sudah ada.
        )
    )
) else if "!projectType!" == "BATCH" (
    for %%c in (%batch_SubFolders%) do (
        rem Memeriksa apakah subfolder utama sudah ada
        if not exist "!generateProjectDir!\%%c" (
            mkdir "!generateProjectDir!\%%c"
        ) else (
            echo %%c sudah ada.
        )
    )
)

tree /f "!generateProjectDir!"
:generateTemplateCSV
if "%rootFolder%"=="MICROSTOCKS" (
    call Generator/CSV_Gen.bat
)
:generateTemplateMD
call Generator/MD_Gen.bat

:finishFolderCreation
echo !generateProjectDir!| clip
echo !formattedCounter!_%FolderName%| clip
rem Tampilkan peringatan dan option y/n untuk membuat folder berikutnya
echo %redLine%
set /a "counter+=1"
choice /c rqxn /n /m %_fBYellow%"%_fBBlue%> %_RESET% %_bBWhite%%_fBlack% [R] Redo %_RESET% %_bBWhite%%_fBlack% [N] New %_RESET% %_bBWhite%%_fBlack% [Q] Quit %_RESET% %_bBWhite%%_fBlack% [X] Explorer %_RESET% : "%_RESET%
echo %redLine%
set "option=%errorlevel%"
if %option% equ 1 (
    set /a "counter+=0"
    goto :check_loop
) else if %option% equ 2 (
    set "programReset=Yes"
) else if %option% equ 3 (
    start "" explorer "!generateProjectDir!"
    set "programReset=Yes"
) else if %option% equ 4 (
    goto :checkInput_FolderName
)
exit /b