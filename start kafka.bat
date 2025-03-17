@echo off
:: Set the target folder path
set "TARGET_FOLDER=C:\apps\kafka\bin\windows"
set "DELAY=5"  :: Delay in seconds before starting second script
set "ZOOKEEPER_PORT=2181"  :: Define the port to kill processes on
set "KAFKA_PORT=9092"  :: Define the port to kill processes on


:: Kill process using the defined port
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%ZOOKEEPER_PORT%') do taskkill /PID %%a /F

:: Kill process using the defined port
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%KAFKA_PORT%') do taskkill /PID %%a /F

:: Open Windows Terminal with the first script
wt.exe new-tab --title "zookeeper" cmd /k "cd /d %TARGET_FOLDER% && zookeeper-server-start.bat ..\..\config\zookeeper.properties"  

:: Wait for specified seconds
timeout /t %DELAY% /nobreak

:: Open a second tab for the second script
wt.exe new-tab --title "kafka" cmd /k "cd /d %TARGET_FOLDER% && kafka-server-start.bat ..\..\config\server.properties"
