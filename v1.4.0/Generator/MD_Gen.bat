set "template_FileMD=!generateProjectDir!\!formattedCounter!_%FolderName%.md"
setlocal EnableDelayedExpansion

call Generator/randomColor_Gen.bat
:: Menyimpan variabel ke dalam file

(
echo.
echo ---
echo ## ^<span style="color:!color_Text!"^>!formattedCounter!_%FolderName%^</span^>
echo # ^<span style="color:!color_Text!"^>!isSelectedClient! !isLoginUser!^</span^>
echo ---
echo.
echo ## Direktori File :
echo ---
echo ^```
echo !generateProjectDir!
echo ^```
echo.
echo ^[Buka Folder^]^(!generateProjectDir!^)
echo.
echo ## Preview :
echo ---
echo ^^![[!formattedCounter!_%FolderName%.png]]
echo.
echo ## Progress File :
echo ---
echo - [ ] 
echo     - [ ] ^<span style="color:!color_Text!"^>Modeling^</span^>
echo         - [ ] Material
echo         - [ ] Clean Up
echo     - [ ] ^<span style="color:!color_Text!"^>Scene^</span^>
echo         - [ ] Background
echo         - [ ] Kamera
echo     - [ ] ^<span style="color:!color_Text!"^>Lighting^</span^>
echo         - [ ] HDRI
echo         - [ ] Tri Light
echo     - [ ] ^<span style="color:!color_Text!"^>Rendering^</span^>
echo         - [ ] Batch
echo         - [ ] Clean Up
echo         - [ ] Pack Resource
echo         - [ ] Flamenco
echo     - [ ] ^<span style="color:!color_Text!"^>Adjustment^</span^>
echo         - [ ] JPG
echo         - [ ] PSD
echo         - [ ] Video
echo     - [ ] ^<span style="color:!color_Text!"^>Publish^</span^>
echo         - [ ] Adobe Stock
echo         - [ ] Shutterstock
echo         - [ ] Freepik
echo         - [ ] Dreamstime
echo.
echo ## Categories :
echo ---
echo [[%mainCategory%]] [[%subCategory%]] [[%main_Project_Type%]] [[%!selectedDisk!%]] [[%projectDate%]] [[%RootFolder%]] [[%projectType%]] [[%isLoginUser%]] [[%isSelectedClient%]]

) > "!template_FileMD!"