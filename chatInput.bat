@echo off
title batchChat - Input window %3
mode 50,3

cd /D %1
cd chat
cd %2

:mainLoop

cls

set /p MESSAGE=">"
set MESSAGE=%3: %MESSAGE%
echo %MESSAGE%
echo %MESSAGE%>"messages.txt"

goto mainLoop