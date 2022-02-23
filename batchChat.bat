@echo off
cls
title batchChat
mode 50,30

set PREVMESSAGE=
set MESSAGE=

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m

echo loading config file...

ping 127.0.0.1 -n 2 > nul

if exist config.bat (
  echo [32m  -Config file found[0m
  call config.bat
) else (
  echo [101;93mError: Missing config file![0m
  pause
  exit
)

ping 127.0.0.1 -n 2 > nul

echo connecting to server...
if exist %SERVER% (
  cd /D %SERVER%
) else (
  echo [101;93mError: Server %SERVER% not found! [0m
  pause
  exit
)

ping 127.0.0.1 -n 2 > nul

if exist chat (
  echo [32m  -Server running[0m
) else (
  echo [33m  -Server not running[0m
  ping 127.0.0.1 -n 2 > nul
  echo [33m  -Starting server[0m
  mkdir chat
)
cd chat

ping 127.0.0.1 -n 2 > nul

:menu

cls

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m
echo [45mMenu[0m
echo [45m  1. Create new chat room[0m
echo [45m  2. Join chat room      [0m
echo [45m  3. Use config to join  [0m

set /p CHOICE=">"

if %CHOICE% == 1 (
  goto createRoom
)
if %CHOICE% == 2 (
  goto joinChat
)
if %CHOICE% == 3 (
  goto joinWithConfig
)

:createRoom
cls
:GenerateRoomID
set RANDOMID=%RANDOM%
if exist %RANDOMID% (
  goto GenerateRoomID
)
set CHATROOMID=%RANDOMID%
mkdir %CHATROOMID%
cd %CHATROOMID%
echo [44mSERVER: Chat started>"messages.txt"

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m
echo [44mPlease pick your username[0m
set /p NICKNAME=">"

cls

set PREVMESSAGE=a
set MESSAGE=SERVER: Chat started

:joinSuccess

cls

start %~dp0chatInput.bat %SERVER% %CHATROOMID% %NICKNAME%

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m
echo [42mYour chat room id is %CHATROOMID%[0m
echo [42mYour nickname is %NICKNAME%[0m

:chatLoop

set /p MESSAGE=<messages.txt

if "%PREVMESSAGE%" == "%MESSAGE%" (
  goto noMessage
) else (
  goto newMessage
)

:newMessage

echo %MESSAGE%
set PREVMESSAGE=%MESSAGE%

:noMessage

ping 127.0.0.1 -n 2 > nul
goto chatLoop

:joinChat

cls

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m
echo [44mPlease enter chat room ID[0m
set /p CHATROOMID=">"

if not exist %CHATROOMID% (
  echo [101;93mError: Chat room id %CHATROOMID% doesn't exist! [0m
  pause
  goto joinChat
)

cd %CHATROOMID%

cls

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m
echo [44mPlease pick your username[0m
set /p NICKNAME=">"

echo [44mSERVER: %NICKNAME% joined the chat![0m>"messages.txt"

goto joinSuccess

:joinWithConfig

cls

echo [7m--------------------------------------------------[0m
echo [7m                    batchChat                     [0m
echo [7m--------------------------------------------------[0m
echo [33mSaved nickname: %CONFIGNICKNAME%[0m
echo [33mSaved chatroom id: %CONFIGCHATROOMID%[0m
echo [33mContinue?[0m
pause

set NICKNAME=%CONFIGNICKNAME%
set CHATROOMID=%CONFIGCHATROOMID%

if not exist %CHATROOMID% (
  echo [101;93mError: Chat room id %CHATROOMID% doesn't exist! [0m
  pause
  goto menu
)

cd %CHATROOMID%
echo [44mSERVER: %NICKNAME% joined the chat![0m>"messages.txt"

goto joinSuccess