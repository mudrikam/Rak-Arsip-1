@echo off
setlocal EnableDelayedExpansion

REM Memulai program dari awal
:programInit
cls
call config/config.bat
call config/config_ANSI.bat
call Generator/date_Gen.bat
call Generator/line_Gen.bat
call Generator/header_Gen.bat
if "!menu_Type!" == "" (
    goto :programStart
)
exit /b

:programStart
if "!programReset!" == "Yes" (
    goto :programReset
)

:programSelector
:: Cek nav_ProjectType
if "!nav_ProjectType!" == "" (
    call Nav/nav_Project_Type.bat
    call :programInit
    call :programStart
    exit /b
)
:programNav
:: Cek menu_Type
if "!menu_Type!" == "" (
    call Nav/nav_Menu.bat
)

:: Cek rootFolder dan arahkan sesuai dengan nilai rootFolder
if "!rootFolder!" == "MICROSTOCK" goto :check_MainCategory
if "!rootFolder!" == "CLIENT" goto :client_Gen
if "!rootFolder!" == "ASSETS" goto :check_MainCategory
if "!rootFolder!" == "TEAM" goto :user_Gen
if "!rootFolder!" == "SOCMED" goto :check_MainCategory
exit /b

:check_MainCategory
:: Cek mainCategory
if "!mainCategory!" == "" (
    goto :category_Gen
) else (
    goto :check_SubCategory
)

:check_SubCategory
:: Cek subCategory
if "!subCategory!" == "" (
    goto :subCategory_Gen
) else (
    goto :type_Gen
)
exit /b

:category_Gen
call :programInit
call Generator/category_Gen.bat
call :programStart
exit /b

:subCategory_Gen
call :programInit
call Generator/subcategory_Gen.bat
call :programInit
call :programStart
exit /b 

:user_Gen
if not "!isUser!" == "isUser" (
    call Generator/user_Gen.bat
    call :programInit
    goto :programStart
) else (
    goto :check_MainCategory
)
exit /b

:client_Gen
if not "!isClient!" == "isClient" (
    call Generator/client_Gen.bat
    call :programInit
    goto :programStart
) else (
    goto :check_MainCategory
)
exit /b

:type_Gen
call :programInit
if "!rootFolder!" == "ASSETS" goto :projectName_Gen
if "!rootFolder!" == "SOCMED" goto :projectName_Gen
if "!isType!" == "" (
    call Generator/type_Gen.bat
) else (
    goto :projectName_Gen
)
call :programStart
exit /b

:projectName_Gen
call :programInit
call Generator/projectName_Gen.bat
call :programStart
exit /b

REM Mereset semua variabel optional menjadi kosong
:programReset
call config/config_Reset.bat
call :programInit
exit /b

endlocal
