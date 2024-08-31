@echo off
REM Create a new user account
net user NewUsername NewPassword /add

REM Add the new user to the Administrators group
net localgroup Administrators NewUsername /add

REM Enable Remote Desktop
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

REM Allow Remote Desktop through Windows Firewall
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

REM Start the Remote Desktop service
sc config TermService start=auto
net start TermService

echo User account created and Remote Desktop enabled.
pause
