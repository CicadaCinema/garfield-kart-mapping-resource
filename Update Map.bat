:start

:: Delete the two files which will be replaced
del ".\Garfield Kart\Maps\test\test.unity3d"
del ".\Garfield Kart\Maps\test.gkmap"

:: Move the compiled map file together with the two other necessary files
move ".\Unity project\New Resource.unity3d" ".\Garfield Kart\Maps\test\test.unity3d"

:: Compress the three files, save the archive in the correct place and change the file extension for GKML
"D:\Software\7zip\7za.exe" a ".\Garfield Kart\Maps\test.zip" ".\Garfield Kart\Maps\test\*"
rename ".\Garfield Kart\Maps\test.zip" "test.gkmap"

:: Go back to the beginning if the map file needs to be replaced again
pause
goto start