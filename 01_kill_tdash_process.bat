@echo off
REM 実行日時
set YYYY=%DATE:~0,4%
set DATE_MM=%DATE:~5,2%
set DD=%DATE:~8,2%
set HH=%TIME:~0,2%
set HH=%HH: =0%
set TIME_MM=%TIME:~3,2%
set SS=%TIME:~6,2%

REM パス関連
set CURRENT_PATH=%~dp0
set LOG_PATH=%CURRENT_PATH%\tdash_test_logs

REM 必要なディレクトリを作る
mkdir %LOG_PATH% >nul 2>&1

REM ログファイルを設定
set LOGFILE=%LOG_PATH%\%YYYY%%DATE_MM%%DD%_%HH%%TIME_MM%%SS%_kill_tdash_process.txt

REM tdashが起動している場合、起動中のtdash.exeを強制終了
taskkill /F /IM tdash.exe >> "%LOGFILE%" 2>&1
