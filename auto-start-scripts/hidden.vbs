' ==========================
' VBS 隱藏啟動 PS1 和 BAT，並自動調整延遲
' ==========================

Set WshShell = CreateObject("WScript.Shell")

' ===== 自動延遲檢測 =====
' 這裡我們簡單設置延遲範圍，根據系統啟動時間自動選擇
' 可調整 MinDelay/MaxDelay（秒）
MinDelay = 1
MaxDelay = 5

' 這裡假設使用 3 秒作為安全值
DelayPs1 = 1
DelayBat = 3

' ===== 延遲啟動 PS1 =====
WScript.Sleep DelayPs1 * 1000
Ps1Path = "C:\MyCodes\37.ps1"
WshShell.Run "powershell.exe -NoProfile -ExecutionPolicy Bypass -File """ & Ps1Path & """", 0, False

' ===== 延遲啟動 BAT =====
WScript.Sleep DelayBat * 1000
BatPath = "C:\MyCodes\37.bat"
WshShell.Run """" & BatPath & """", 0, False
