# ===== 防止任何報錯中斷腳本 =====
$ErrorActionPreference = "SilentlyContinue"

# ===== 播放短視頻 11 秒作為提示（不阻塞後續流程） =====
$videoPath = "C:\Users\Administrator\Pictures\Saved Pictures\AMV.mp4"  # 視頻路徑
if (Test-Path $videoPath) {
    try {
        Start-Process "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" -ArgumentList "`"$videoPath`" --fullscreen --video-on-top --play-and-exit --run-time=11 --no-video-title-show -I dummy" -WindowStyle Hidden
    } catch {
        Write-Warning "VLC 播放失敗: $_"
    }
} else {
    Write-Warning "視頻檔不存在: $videoPath"
}

Start-Sleep -Seconds 2

# ===== 打開 Chrome 多帳號 + 多網址 ===== 
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# ===== 多帳號 + 多網址設定 =====
$profiles = @(
    @{ Name = "Default"; Urls = @("https://www.youtube.com/@Torontobigface/videos", "https://www.youtube.com/@gongzishen/videos", "https://www.youtube.com/@%E5%B0%8F%E9%84%AD%E5%9C%A8%E6%97%A5%E6%9C%AC/videos", "https://www.youtube.com/@%E5%96%B5%E5%96%B5%E7%9C%8B%E4%B8%80%E7%9C%8B/videos", "https://www.youtube.com/@henren778/videos") },
    @{ Name = "Profile 2"; Urls = @("https://login.cityu.edu.mo/cas/login?ui_locales=zh-MO&service=https%3A//tronclass.cityu.edu.mo/bulletin-list/&locale=zh_MO&ts=1761733062.847921#/") }   # 新增帳號示例【, "https://xxx.xxxxx.com"】
)

# ===== 開啟所有網址 =====
foreach ($profileInfo in $profiles) {
    foreach ($url in $profileInfo.Urls) {
        try {
            Start-Process $chromePath -ArgumentList "--profile-directory=""$($profileInfo.Name)""", $url
            Start-Sleep -Seconds 1  # 每個網址延遲 1 秒
        } catch {
            Write-Warning "無法開啟 $url for $($profileInfo.Name) : $_"
        }
    }
}
