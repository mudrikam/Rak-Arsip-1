rem Array of 50 colors
set colors[0]=#0d6efd
set colors[1]=#6610f2
set colors[2]=#6f42c1
set colors[3]=#d63384
set colors[4]=#dc3545
set colors[5]=#fd7e14
set colors[6]=#ffc107
set colors[7]=#198754
set colors[8]=#20c997
set colors[9]=#0dcaf0

rem Generate a random index between 0 and 49
set /a "randIndex=%random% %% 10"

rem Assign the random color to the variable
set color_Text=!colors[%randIndex%]!