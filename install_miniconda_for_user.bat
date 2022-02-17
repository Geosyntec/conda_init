@echo off
echo Checking if miniconda3 already exists for this user...
if exist %UserProfile%\miniconda3 (
	echo miniconda3 already exists for this user, exiting without modifying the system...
	pause
	EXIT /B
)
else (
	echo installing conda...
	start /wait "" Miniconda3-latest-Windows-x86_64.exe /InstallationType=JustMe /RegisterPython=0 /AddToPath=1 /S /D=%UserProfile%\miniconda3
	echo installation complete.
)
pause