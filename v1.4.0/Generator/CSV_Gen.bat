
set "template_Shutterstock=!generateProjectDir!\CSV\SHUTTERSTOCK_%FolderName%.csv"
set "template_AdobeStock=!generateProjectDir!\CSV\ADOBE_STOCK_%FolderName%.csv"
set "template_Freepik=!generateProjectDir!\CSV\FREEPIK_%FolderName%.csv"
set "file_count=10"

:: Menyimpan variabel ke dalam file


: Shutterstock
(
    echo Filename,Description,Keywords,Categories,Editorial,Mature content,illustration
    for /l %%i in (1,1,%file_count%) do (
        if %%i lss 10 (
            set fileName=%FolderName%-0%%i.jpg
        ) else (
            set fileName=%FolderName%-%%i.jpg
        )
        echo !fileName!,"Description untuk nama file tes pada shutterstock","Keywords, dua, tiga, empat, lima","Objects, Beauty/Fashion",no,no,yes
    )
) > "!template_Shutterstock!"

: Adobe Stock
(
    echo Filename,Title,Keywords,Category,Releases
    for /l %%i in (1,1,%file_count%) do (
        if %%i lss 10 (
            set fileName=%FolderName%-0%%i.jpg
        ) else (
            set fileName=%FolderName%-%%i.jpg
        )
        echo !fileName!,"Coba title adobe stock","Keywords, one, two, three, four","4",
    )
) > "!template_AdobeStock!"

: Freepik
(
    for /l %%i in (1,1,%file_count%) do (
        if %%i lss 10 (
            set fileName=%FolderName%-0%%i.jpg
        ) else (
            set fileName=%FolderName%-%%i.jpg
        )
        echo !fileName!;"Title";"Keywords, satu, dua, tiga, empat, lima"
    )
) > "!template_Freepik!"