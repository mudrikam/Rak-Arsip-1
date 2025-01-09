@echo off


:: Daftar variabel yang akan dikosongkan
set "vars=programReset menu_Type isType isUser user isClient rootFolder mainCategory subCategory userCategoryChoice userSubCategoryChoice validCategoryChoice validSubCategoryChoice projectType isLoginUser isSelectedClient projectDate projectName generateProjectDir assetGenerateDir assetFolders main_Project_Type nav_ProjectType selectedDisk file_teamMember file_perUser" 

:: Menampilkan nilai variabel sebelum dikosongkan
:: for %%V in (%vars%) do (
::     echo %%V sebelum: !%%V!
:: )

:: Mengosongkan variabel
for %%V in (%vars%) do (
    set "%%V="
)

:: Menampilkan nilai variabel setelah dikosongkan
:: for %%V in (%vars%) do (
::     echo %%V setelah: !%%V!
:: )

