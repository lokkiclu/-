@echo off
setlocal
rem ===== 延遲 3 秒（等待背景程序啟動完畢） =====
timeout /t 2 /nobreak >nul

rem ===== 防重複開啟 Obsidian 在此添加程序=====
tasklist /FI "IMAGENAME eq Obsidian.exe" | find /I "Obsidian.exe" >nul
if errorlevel 1 (
    start "" "D:\PCENV\Obsidian\Obsidian.exe"
)

endlocal
exit
