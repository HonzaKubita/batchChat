@echo off
title batchChat - Input window %3
mode 50,3

cd /D %1
cd chat
cd %2

:mainLoop

set /p MESSAGE=">"
set MESSAGE=%3: %MESSAGE%
echo %MESSAGE%
echo %MESSAGE%>"messages.txt"

cls

ping 127.0.0.1 -n 2 > nul

goto mainLoop
