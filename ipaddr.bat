@ECHO off
cls
:start
ECHO.
ECHO 1. Change Ethernet Static IP 
ECHO 2. Obtain an IP address automatically
ECHO 3. Exit
set choice=
set /p choice=Type the number to print text.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto autosearch
if '%choice%'=='3' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:con1
ECHO Connecting Ethernet
netsh interface ip set address "Ethernet 2" static 172.22.1.94 255.255.255.128 172.22.1.3
netsh interface ip set dns "Ethernet 2" static 192.168.240.18
goto end

:autosearch
ECHO obtaining auto IP
netsh interface ip set address "Ethernet 2" dhcp
netsh interface ip set dns "Ethernet 2" dhcp
goto end

:bye
ECHO BYE
goto end

:end
