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
#InstallKeybdHook
#InstallMouseHook
#UseHook
#MaxHotkeysPerInterval 300   ;指定時間の間に実行できる最大のホットキー数のホットキー数
#HotkeyInterval 500          ;指定時間の間に実行できる最大のホットキー数の指定時間(ms)
#MaxThreadsBuffer Off
Process, Priority, , High    ; Autohotkeyを優先度高へ
SetKeyDelay, -1

;;;;;;;;;;;;
; 定数設定
;;;;;;;;;;;;
PDIC_WIN_NAME = Personal Dictionary
PDIC_EXE_PATH = "C:\Program Files (x86)\Personal Dictionary (Unicode)\PDICU.EXE"
CHROME_CLASS_NAME = ahk_class Chrome_WidgetWin_1
CHROME_EXE_PATH = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
EMACS_WIN_NAME = emacs
EMACS_EXE_PATH = "C:\usr\emacs\emacs-24.2\bin\runemacs.exe"

;;;;;;;;;;;;;;;;;;;;;;;;;;
; 各コンピュータ毎の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;
EnvGet , COMP_NAME, COMPUTERNAME ;コンピュータ名の取得
if COMP_NAME = LPC11
{
    PDIC_EXE_PATH = "C:\Program Files\Personal Dictionary (Unicode)\PDICU.EXE"
    CHROME_EXE_PATH = "C:\Program Files\Google\Chrome\Application\chrome.exe"
}
else if COMP_NAME = MC07
{
    EMACS_EXE_PATH = "D:\usr\emacs\emacs-24.2\bin\runemacs.exe"
}
else if COMP_NAME = ZEN12
{
}
if Done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Exit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; "C-@" でスクリプトを読み込み
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^@::Reload

;;;;;;;;;;;;;;;;;;;;;;;;
;; キー置き換え
;;;;;;;;;;;;;;;;;;;;;;;;
;; ひらがな/カタカナキー→半角/全角キー
vkF2sc070::vkF3sc029

;; 無変換キー→Altキー
vk1Dsc07B::LAlt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; autohotkeyを無効にしたいウィンドウ一覧 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
is_ineffective()
{
	if WinActive("ahk_class PuTTY")
	|| WinActive("ahk_class Emacs") 
	|| WinActive("ahk_class Putty")
	|| WinActive("ahk_class mintty")
;	|| WinActive("ahk_class wndclass_desked_gsk") ;VisualStudio
;	|| WinActive("ahk_class Vim");Windows上のGVIM 
;	|| WinActive("ahk_class cygwin/x X rl-xterm-XTerm-0")
    {   
        Return 1
    }
   	Return 0
}
 
;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacsキー定義読み込み
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_emacs_key.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; その他のキー定義読み込み
;;;;;;;;;;;;;;;;;;;;;;;;J
#Include AHK_other_key.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [AutoHotkeyJp]                              
;      https://sites.google.com/site/autohotkeyjp/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

