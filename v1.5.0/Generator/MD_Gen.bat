setlocal EnableDelayedExpansion

set "template_FileMD=!generateProjectDir!\!formattedCounter!_%FolderName%.md"

call Generator/randomColor_Gen.bat
:: Menyimpan variabel ke dalam file

(
echo ---
if not "%isLoginUser%"=="" (
    echo Team: "[[%isLoginUser%]]"
)
if not "%isSelectedClient%"=="" (
    echo Klien: "[[%isSelectedClient%]]"
)
echo Kategori: "[[%mainCategory%]]"
echo Sub_Kategori: "[[%subCategory%]]"
echo Tipe: "[[%main_Project_Type%]]"
for /f "tokens=2,3,4 delims=/ " %%a in ('date /t') do (

    set month=%%a
    set day=%%b
    set year=%%c
    echo Tanggal_Buat: %%c-%%a-%%b
)
echo Tags:
echo   - %mainCategory%
echo   - %subCategory%
echo   - %isLoginUser%
echo   - %isSelectedClient%
echo   - %projectDate%
echo   - %projectType%
echo   - %main_Project_Type%
echo   - %rootFolder%
echo   - %month%
echo Selesai: false
echo ---
echo.
echo ## ^<span style="color:!color_Text!"^>Direktori File^</span^> :
echo ---
echo ^```
echo !generateProjectDir!
echo ^```
echo.
echo ^```
echo !formattedCounter!_%FolderName%
echo ^```
echo.
echo ^[Buka Folder^]^(!generateProjectDir!^)
echo.
echo ## ^<span style="color:!color_Text!"^>Preview^</span^> :
echo ---
echo ^^![[!formattedCounter!_%FolderName%.png]]
echo.
echo ## ^<span style="color:!color_Text!"^>Progress File^</span^> :
echo ---
echo - [ ] 
echo     - [ ] ^<span style="color:!color_Text!"^>Modeling^</span^>
echo         - [ ] Modelling
echo         - [ ] Material
echo         - [ ] Clean Up
echo     - [ ] ^<span style="color:!color_Text!"^>Scene^</span^>
echo         - [ ] Background
echo         - [ ] Kamera
echo     - [ ] ^<span style="color:!color_Text!"^>Lighting^</span^>
echo         - [ ] HDRI
echo         - [ ] Tri Light
echo     - [ ] ^<span style="color:!color_Text!"^>Rendering^</span^>
echo         - [ ] Mockup
echo             - [ ] Base
echo             - [ ] Masking
echo             - [ ] Highlight
echo             - [ ] Shadow
echo         - [ ] Batch
echo         - [ ] Clean Up
echo         - [ ] Pack Resource
echo         - [ ] Flamenco
echo     - [ ] ^<span style="color:!color_Text!"^>Adjustment^</span^>
echo         - [ ] JPG
echo         - [ ] PSD
echo         - [ ] Video
echo.
echo.

) > "!template_FileMD!"

:: Jika user login, tambahkan konten tambahan ke file MD
set "file_teamPiketMember=Database/team_piket.txt"
set /a startIndex=1
set "file_perUser=2"


if not "%isLoginUser%"=="" (
    (
        echo ## ^<span style="color:!color_Text!"^>File Team^</span^> :
        echo ---
        for /f "tokens=*" %%A in (%file_teamPiketMember%) do (
            set "user=%%A"
            echo ##### ^<span style="color:!color_Text!"^>!user!^</span^>
            
            set endIndex=!startIndex!
            set /a endIndex+=!file_perUser!-1

            for /l %%i in (!startIndex!,1,!endIndex!) do (
                set "file_name=%FolderName%-%%i.jpg"
                echo - !file_name!
            )

            set /a startIndex+=!file_perUser!

            echo - [ ] Publish Platform :
            echo   - [ ] ^<img src="T:\MD_Icons\AdobeStock.png" width=20px alt=" "^> **Adobe Stock**
            echo   - [ ] ^<img src="T:\MD_Icons\Shutterstock.png" width=20px alt=" "^> **Shutterstock**
            echo   - [ ] ^<img src="T:\MD_Icons\Freepik.png" width=20px alt=" "^> **Freepik**
            echo   - [ ] ^<img src="T:\MD_Icons\Dreamstime.png" width=20px alt=" "^> **Dreamstime**
            echo   - [ ] ^<img src="T:\MD_Icons\Depositphotos.png" width=20px alt=" "^> **Deposit Photos**
            echo   - [ ] ^<img src="T:\MD_Icons\Pond5.png" width=20px alt=" "^> **Pond5**
            echo   - [ ] ^<img src="T:\MD_Icons\123RF.jpeg" width=20px alt=" "^> **123RF**
            echo   - [ ] ^<img src="T:\MD_Icons\iStock.png" width=20px alt=" "^> **iStock**
            echo   - [ ] ^<img src="T:\MD_Icons\Envato.png" width=20px alt=" "^> **Envato**
            echo   - [ ] ^<img src="T:\MD_Icons\Alamy.jpeg" width=20px alt=" "^> **Alamy**
            echo   - [ ] ^<img src="T:\MD_Icons\Canva.png" width=20px alt=" "^> **Canva**
            echo   - [ ] ^<img src="T:\MD_Icons\vectzy.png" width=20px alt=" "^> **Vecteezy**
            echo   - [ ] ^<img src="T:\MD_Icons\pngtree.png" width=20px alt=" "^> **PNGTree**
            echo ---

        )

    ) >> "!template_FileMD!" 
)

if "%rootFolder%"=="MICROSTOCK" (
    (
        echo ## File MICROSTOCK
        echo ---
        echo - [ ] Publish Platform :
        echo   - [ ] ^<img src="T:\MD_Icons\AdobeStock.png" width=20px alt=" "^> **Adobe Stock**
        echo   - [ ] ^<img src="T:\MD_Icons\Shutterstock.png" width=20px alt=" "^> **Shutterstock**
        echo   - [ ] ^<img src="T:\MD_Icons\Freepik.png" width=20px alt=" "^> **Freepik**
        echo   - [ ] ^<img src="T:\MD_Icons\Dreamstime.png" width=20px alt=" "^> **Dreamstime**
        echo   - [ ] ^<img src="T:\MD_Icons\Depositphotos.png" width=20px alt=" "^> **Deposit Photos**
        echo   - [ ] ^<img src="T:\MD_Icons\Pond5.png" width=20px alt=" "^> **Pond5**
        echo   - [ ] ^<img src="T:\MD_Icons\123RF.jpeg" width=20px alt=" "^> **123RF**
        echo   - [ ] ^<img src="T:\MD_Icons\iStock.png" width=20px alt=" "^> **iStock**
        echo   - [ ] ^<img src="T:\MD_Icons\Envato.png" width=20px alt=" "^> **Envato**
        echo   - [ ] ^<img src="T:\MD_Icons\Alamy.jpeg" width=20px alt=" "^> **Alamy**
        echo   - [ ] ^<img src="T:\MD_Icons\Canva.png" width=20px alt=" "^> **Canva**
        echo   - [ ] ^<img src="T:\MD_Icons\vectzy.png" width=20px alt=" "^> **Vecteezy**
        echo   - [ ] ^<img src="T:\MD_Icons\pngtree.png" width=20px alt=" "^> **PNGTree**
        echo ---

    ) >> "!template_FileMD!" 
)