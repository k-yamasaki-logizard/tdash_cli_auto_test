@echo off
REM 引数1:syncを配置したディレクトリ
REM 引数2:テストランの名称
REM ※暫定：syncを配置したディレクトリは、C:\Users\kanri02\Desktop\T-DASH負荷テスト\sync-20251110 全て 固定

REM 変数を諸々設定
REM 実行日付
set YYYY=%DATE:~0,4%
set MM=%DATE:~5,2%
set DD=%DATE:~8,2%

REM 実行時刻
set HH=%TIME:~0,2%
set HH=%HH: =0%
set mm=%TIME:~3,2%
set ss=%TIME:~6,2%

REM パス関連
set CURRENT_PATH=%~dp0
set LOG_PATH=%CURRENT_PATH%\tdash_test_logs
set OUTPUT_REPORT_DIR_PATH=%CURRENT_PATH%\output_report_dir

REM 必要なディレクトリを作る
mkdir %LOG_PATH% /
mkdir %OUTPUT_REPORT_DIR_PATH% /

REM 絶対パスでログファイル(形式：tdash_test_logs\yyyyMMdd_HHmmss.txt)
set LOGFILE=%LOG_PATH%\%YYYY%%MM%%DD%_%HH%%mm%%ss%.txt

REM T-DASHインストールディレクトリへ移動(ここからの実行でないと、test_runが失敗する)
cd %USERPROFILE%\AppData\Local\Programs\T-DASH

REM tdashが起動している場合、起動中のtdash.exeを強制終了
taskkill /F /IM tdash.exe >> "%LOGFILE%" 2>&1

REM テストラン実行
tdash.exe testrun "全て" --sync "C:\Users\kanri02\Desktop\T-DASH負荷テスト\sync-20251110" --background --silent --output_report_dir_path "%OUTPUT_REPORT_DIR_PATH%" >> "%LOGFILE%" 2>&1

REM 元のパスに戻る
cd %CURRENT_PATH%