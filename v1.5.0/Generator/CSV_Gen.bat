
set "template_Shutterstock=!generateProjectDir!\SHUTTERSTOCK_%FolderName%.csv"
set "template_AdobeStock=!generateProjectDir!\ADOBE_STOCK_%FolderName%.csv"
set "template_Freepik=!generateProjectDir!\FREEPIK_%FolderName%.csv"
set "file_count=10"

:: Menyimpan variabel ke dalam file
:: buat file hanya jika projek bukan klien

: Shutterstock
(
    echo Filename,Description,Keywords,Categories,Editorial,Mature content,illustration
    for /l %%i in (1,1,%file_count%) do (
        set fileName=%FolderName%-%%i.jpg
        echo !fileName!,"","","Objects",no,no,yes
    )
) > "!template_Shutterstock!"

: Adobe Stock
(
    echo Filename,Title,Keywords,Category,Releases
    for /l %%i in (1,1,%file_count%) do (
        set fileName=%FolderName%-%%i.jpg
        echo !fileName!,"","","8",
    )
) > "!template_AdobeStock!"

: Freepik
(
    for /l %%i in (1,1,%file_count%) do (
        set fileName=%FolderName%-%%i.jpg
        echo !fileName!;"";""
    )
) > "!template_Freepik!"
