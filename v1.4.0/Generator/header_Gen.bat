@echo off

REM Header generator
:header_Gen
set "tab=        "
set "spacer=                                                     "
echo %_fBlack%%_bBWhite%%spacer%
echo %_fBlack%%_bBWhite%%tab% Folder Generator DSNA Mockup %programVersion% %tab%
echo %_fBlack%%_bBWhite%%spacer%%_RESET%
echo %blueLine%

:project_Details
echo %_fBRed%^> %_RESET%Disk         : %_fBBlue%!selectedDisk!%_RESET%
echo %blueLine%
echo %_fBBlue%^> %_RESET%Date         : %_fBYellow%%projectDate%%_RESET%
echo %_fBBlue%^> %_RESET%Project Type : %_fBYellow%%main_Project_Type%%_RESET%
echo %_fBBlue%^> %_RESET%ROOT         : %_fBYellow%%RootFolder%%_RESET%
echo %_fBBlue%^> %_RESET%Category     : %_fBYellow%%mainCategory%%_RESET%
echo %_fBBlue%^> %_RESET%Sub Category : %_fBYellow%%subCategory%%_RESET%
echo %_fBBlue%^> %_RESET%Type         : %_fBYellow%%projectType% %_RESET%
echo %_fBBlue%^> %_RESET%User         : %_fBGreen%%isLoginUser%%_RESET%
echo %_fBBlue%^> %_RESET%Client       : %_fBGreen%%isSelectedClient%%_RESET%
echo %blueLine%