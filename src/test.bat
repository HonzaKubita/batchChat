@echo off
:loop

echo ------------------------------------------

@echo off
for /f "tokens=2,10-11" %%a in ('%~dp0/cmdow/bin/Release/cmdow "batchChat"') do (
  set "WIDTH=%%b" & set "HEIGHT=%%c"
)
echo Resolution is %WIDTH%x%HEIGHT%

ping 127.0.0.1 -n 3 > nul
goto loop
