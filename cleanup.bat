del C:\Windows\Temp\payload.txt
del C:\Windows\Temp\payload.bat
del C:\Windows\Temp\bomb.bat
reg remove HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v persist 
schtasks /delete /tn bomb
