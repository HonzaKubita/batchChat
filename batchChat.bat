@echo off
title batchChat
mode 50,30

echo --------------------------------------------------
echo         	Welcome to chat batchChat
echo --------------------------------------------------
echo loading config file...
call config.bat
echo connecting to server...
cd /D %server%
md ahoj
pause