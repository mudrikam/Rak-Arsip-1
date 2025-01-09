set "guide_Gen=!generateProjectDir!\!formattedCounter!_%FolderName%.txt"

(
    echo Nama Projek  : !formattedCounter!_%FolderName%
    echo Jenis Projek : %main_Project_Type%
) > "!guide_Gen!"