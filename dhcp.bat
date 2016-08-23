@ECHO OFF 

ECHO Resetting IP Address and Subnet Mask For DHCP 
netsh int ip set address name = "Local Area Connection" source = dhcp

ipconfig /renew

ECHO Here are the new settings for %computername%: 
netsh int ip show config

pause 
