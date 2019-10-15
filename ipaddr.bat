@ECHO off
cls
:start
ECHO.
:: Options for user to choose
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
:: Change interface_name to your interface and IP to your static IP
netsh interface ip set address "interface_name" static 10.10.100.99 255.255.255.128 10.10.100.2
netsh interface ip set dns "Interface_name" static 192.168.0.20
goto end

:autosearch
ECHO obtaining auto IP
:: Change interface_name to your interface
netsh interface ip set address "interface_name" dhcp
netsh interface ip set dns "interface_name" dhcp
goto end

:bye
ECHO BYE
goto end

:end
