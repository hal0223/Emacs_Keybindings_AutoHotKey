;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [add %ProgramFiles%AutohotKey.ini]
; #include D:\Dropbox\.config  ;;current directory full path
; #include AHK.ahk             ;;this file name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Shift+J reload this script.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;+r::Reload

#InstallKeybdHook
#UseHook

;;;;;;;;;;;;;;;;;;;;;;;;
;; App
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_app.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; keySwap
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_keySwap.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNC
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_func.ahk
 
;;;;;;;;;;;;;;;;;;;;;;;;
;; CTRL
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_ctrl.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; ALT
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_alt.ahk

;;;;;;;;;;;;;;;;;;;;;;;;
;; OTHER
;;;;;;;;;;;;;;;;;;;;;;;;
#Include AHK_other.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [ref. AutoHotkeyJp]                              
; https://sites.google.com/site/autohotkeyjp/
; [ref. WindowsでEmacs風キーバインド]
; http://usi3.com/index.php?title=Windows%E3%81%A7Emacs%E9%A2%A8%E3%82%AD%E3%83%BC%E3%83%90%E3%82%A4%E3%83%B3%E3%83%89
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

