@echo off
cls
title batchChat
mode 50,30

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m

echo loading config file...

ping 127.0.0.1 -n 2 > nul

if exist config.bat (
  echo [32m  -Config file found[0m
  call config.bat
) else (
  echo [101;93m  config file not found! [0m
  pause
  exit
)

ping 127.0.0.1 -n 2 > nul

echo connecting to server...
if exist %server% (
  cd /D %server%
) else (
  echo [101;93m  server not found! [0m
  pause
  exit
)

ping 127.0.0.1 -n 2 > nul

if exist chat (
  echo [32m  -Server running[0m
) else (
  echo [33m  -Server not running[0m
  echo [33m    -Starting server[0m
  mkdir chat
)
cd chat

ping 127.0.0.1 -n 2 > nul

cls

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m
echo Please