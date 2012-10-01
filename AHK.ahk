;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [Introduction]
; %ProgramFiles%AutohotKey\AutohotKey.ini に以下の2行を書いて追加
; #include D:\Dropbox\.config  ;;このファイル名を置くディレクトリ
; #include AHK.ahk             ;;このファイル名
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auto-execute Section ;
;;;;;;;;;;;;;;;;;;;;;;;;;;
CoordMode, ToolTip, Screen   ;Tooltipの座標をスクリーン上での絶対位置にする
Exit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; "Shift + r" でスクリプトを読み込み
; 通常はコメントアウトしておく
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;+r::Reload

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Autohotkeyの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#InstallKeybdHook
#InstallMouseHook
#UseHook
#MaxHotkeysPerInterval 300   ;指定時間の間に実行できる最大のホットキー数のホットキー数
#HotkeyInterval 500          ;指定時間の間に実行できる最大のホットキー数の指定時間(ms)
; 当該ホットキーのスレッドの実行数が#MaxThreadsPerHotkeyで指定した上限に達しているときに
; 新たにホットキーが押されたとき、実行可能になるまで後回しにするか、ホットキーを無視するか
#MaxThreadsBuffer Off
Process, Priority, , High    ; Autohotkeyを優先度高へ

;;;;;;;;;;;;;;;;;;;;;;;;
;; 各アプリケーションの設定
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_app.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; キー入れ替え
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_keySwap.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; 関数
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_func.ahk
 
;;;;;;;;;;;;;;;;;;;;;;;;
;; CTRLキーを使ったキー定義
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_ctrl.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; ALTキーを使ったキー定義
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_alt.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; その他のキー定義
;;;;;;;;;;;;;;;;;;;;;;;;J
#Include AHK_other.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [謝辞]
; [AutoHotkeyJp]                              
;      https://sites.google.com/site/autohotkeyjp/
; [WindowsでEmacs風キーバインド]
;      http://usi3.com/index.php?title=Windows%E3%81%A7Emacs%E9%A2%A8%E3%82%AD%E3%83%BC%E3%83%90%E3%82%A4%E3%83%B3%E3%83%89
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

