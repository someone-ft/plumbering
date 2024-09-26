@echo off
set /a min=1
set /a max=10000
set /a range=max-min+1
set /a Num1=%random% %% range + min
set /a Num2=%random% %% range + min
set /a Num3=%random% %% range + min
set /a Num4=%random% %% range + min
set key=plkey-%Num1%-%Num2%-%Num3%-%Num4%
echo %key%
echo %key% > key.json
setlocal

REM Set your API token
set "API_TOKEN=662AujeWK3FhsbGI2eSWwE2ikwkO1iDD"

REM Set the file path to the file you want to upload
set "FILE_PATH=%key%.txt"

REM Check if the file exists
if not exist "%FILE_PATH%" (
    echo File not found: %FILE_PATH%
    exit /b 1
)

REM Obtain a list of available servers (you can specify your preferred server)
set "SERVER=https://store1.gofile.io"

REM Upload the file to your account with the provided API token
curl -X POST "%SERVER%/contents/uploadfile" ^
    -H "Authorization: Bearer %API_TOKEN%" ^
    -F "file=@%FILE_PATH%" ^
    -F "folderId=c01398a8-3fef-47a7-b653-a74a4d1184fe" ^
    -o response.json

REM Check the response
for /f "tokens=*" %%i in (response.json) do (
    echo %%i | findstr /i "\"status\":\"ok\"" >nul
    if not errorlevel 1 (
        goto success
    ) else (
        echo Error uploading file.
        type response.json
    )
)


:success
REM Clean up
cls
del response.json
echo your key is : %key%
echo its 1 time use btw

pause >nul