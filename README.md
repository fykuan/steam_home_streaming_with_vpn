#在 macOS 下透過 OpenVPN 及 Steam home streaming 遠端串流遊戲

這篇記錄作法，以免過一陣子忘記了

## 事前準備

* 用來實際跑遊戲的 Windows 機器一台
  * 安裝好 Steam
  * AnyDesk 遠端桌面軟體並設定好（也可用其他取代，但是 Microsoft Remote Desktop 不行，原因後述）
* OpenVPN Server
  * 我是用 ASUSwrt-Merlin 上的 OpenVPN
* 用來玩遊戲的 macOS 機器方面
  * 一樣安裝好 Steam
  * OpenVPN Client
    * 在 macOS 下就用 Tunnelblick 囉

## 設定

* 先來處理 OpenVPN server，
  * ASUSwrt-Merlin 上直接有 GUI 可以設定。要注意的是要用 TAP 而不能用 TUN
  * 設定好直接匯出設定檔，假設叫做 `client1.ovpn`
* 在 macOS 上的 Tunnelblick 把 `client1.ovpn` 匯入，然後連線
* 用 AnyDesk 連線到 Windows 機器，打開或是重新啟動 Steam
  * 不知道為什麼不重開一次伺服器端的 Steam，Client 會找不到它
* 關掉 AnyDesk
* 在 macOS 端執行 `sudo steam_forwarder.sh`
  * 請先編輯好檔案內的 `${SERVER}` 變數，設定 Steam server 的 IP address
  * 用途在檔案內的參考資料連結有說明
* 打開 macOS 端的 Steam，這時候應該就可以看到你的遊戲出現「串流」選項了

