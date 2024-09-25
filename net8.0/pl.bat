@echo off
title pl
chcp 65001 >nul
goto lg1
pause

:lg1  
cls                                
echo.
echo                                                  [91m███████████████████████████████████████████████████████████████████
echo [37m             `7MM"""Mq.`7MMF'                    ╔═════════════════════════════════════════════════════════════════╗
echo                MM   `MM. MM                      ║                                                                 ║
echo                MM   ,M9  MM                      ║                             status                              ║
echo                MMmmdM9   MM                      ║                           key needed                            ║
echo                MM        MM      ,               ║                                                                 ║
echo                MM        MM     ,M               ║                                                                 ║
echo              .JMML.    .JMMmmmmMMM               ╚═════════════════════════════════════════════════════════════════╝
echo.
echo.

set /p "keyans=key="
setlocal

rem Set the required variables
set "GofileURL=https://api.gofile.io/contents/search"
set "TOKEN=662AujeWK3FhsbGI2eSWwE2ikwkO1iDD"  rem Replace with your API token
set "CONTENT_ID=c01398a8-3fef-47a7-b653-a74a4d1184fe"  rem Replace with your folder ID
set "SEARCHED_STRING=%keyans%"  rem Replace with your search string

rem Construct the curl command
set "CURL_CMD=curl -H 'Authorization: Bearer %TOKEN%' '%GofileURL%?%CONTENT_ID%&searchedString=%SEARCHED_STRING%.txt'

rem Execute the curl command
echo Searching for content...
set "HTTP_CODE="
for /f "delims=" %%i in ('%CURL_CMD%') do set "HTTP_CODE=%%i"

rem Check the HTTP response code
if "%HTTP_CODE%"=="200" (
    goto main
) else (
    goto lg1
)

endlocal

pause

:main      
del key.txt         
cls               
echo.
echo                                                  [92m███████████████████████████████████████████████████████████████████
echo [37m             `7MM"""Mq.`7MMF'                    ╔═════════════════════════════════════════════════════════════════╗
echo                MM   `MM. MM                      ║                                                                 ║
echo                MM   ,M9  MM                      ║                             status                              ║
echo                MMmmdM9   MM                      ║                          key inserted                           ║
echo                MM        MM      ,               ║                                                                 ║
echo                MM        MM     ,M               ║                                                                 ║
echo              .JMML.    .JMMmmmmMMM               ╚═════════════════════════════════════════════════════════════════╝
echo                                                  ╔═════════════════════════════════════════════════════════════════╗
echo                                                  ║ 1.Flush DNS                                                     ║
echo                                                  ║ 2.Webhook Spammer                                               ║
echo                                                  ║                                                                 ║
echo                                                  ║                                                                 ║
echo                                                  ║                                                                 ║
echo                                                  ║                                                                 ║
echo                                                  ║                                                                 ║
echo                                                  ║                                                                 ║
echo                                                  ║                                                                 ║
echo                                                  ╚═════════════════════════════════════════════════════════════════╝
echo                                                                          status : connected
echo.
echo.
set /p choice="pl-cmd>"
if %choice%==1 goto c1


:c1
cls
echo cleaning
ipconfig /flushdns
echo done
goto :main
