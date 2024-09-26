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

set /p key= < key.json
echo %key% | findstr /i "plkey-" >nul
if not errorlevel 1 (
    goto lg2
) else (
    echo false key detected..
    echo stopping the process..
    timeout 1 >nul
    exit

)


:lg2
echo %key%
set /p "keyans=key="
if %keyans%==%key% goto main

goto lg1


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
if %choice%==2 goto c2


:c1
cls
echo cleaning
ipconfig /flushdns
echo done
goto :main
:c2
cls                                
echo.
echo                                                  [92m███████████████████████████████████████████████████████████████████
echo [37m             `7MM"""Mq.`7MMF'                    ╔═════════════════════════════════════════════════════════════════╗
echo                MM   `MM. MM                      ║                                                                 ║
echo                MM   ,M9  MM                      ║                             status                              ║
echo                MMmmdM9   MM                      ║                         webhook spammer                         ║
echo                MM        MM      ,               ║                                                                 ║
echo                MM        MM     ,M               ║                                                                 ║
echo              .JMML.    .JMMmmmmMMM               ╚═════════════════════════════════════════════════════════════════╝
echo.
echo.
set /p WEBHOOK_URL="webhook: "
set /p MESSAGE="message: "

:webhook_spam
SET BODY="{\"username\": \"pl\", \"content\":\"%MESSAGE%\"}"
curl -H "Content-Type: application/json" -d %BODY% %WEBHOOK_URL%
goto webhook_spam
