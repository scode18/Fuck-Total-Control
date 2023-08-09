@echo off
chcp 65001 >nul
for /f "tokens=4 delims= " %%i in ('systeminfo ^| find /i "Total Physical Memory"') do (set mem=%%i)
for /f "tokens=1 delims= " %%i in ('echo.%mem%') do (set mem_gb=%%i)
set /a "mem_kb=%mem_gb%*1024*1024"
reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "%mem_kb%" /f >nul
exit /b