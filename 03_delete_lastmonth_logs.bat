@echo off
REM 先月のログを削除するバッチ
REM tdash_test_logs と output_report_dir から先月のディレクトリを削除

REM 今月のYYYYMMを取得し、00を末尾に付ける
set YYYY=%DATE:~0,4%
set MM=%DATE:~5,2%
set THRESHOLD=%YYYY%%MM%00

REM パス関連
set CURRENT_PATH=%~dp0
set LOG_DIR_PATH=%CURRENT_PATH%\tdash_test_logs
set OUTPUT_REPORT_DIR_PATH=%CURRENT_PATH%\output_report_dir

for %%D in (%LOG_DIR_PATH% %OUTPUT_REPORT_DIR_PATH%) do (
    for /d %%F in ("%%D\*") do (
        if "%%~nxF" lss "%THRESHOLD%" (
            echo 削除: %%F
            rd /s /q "%%F"
        )
    )
)
