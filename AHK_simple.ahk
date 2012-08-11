;;//////////////////////////////////////////////////////////////////////
;;//////////////////////////////////////////////////////////////////////
;;//////////////////////////////////////////////////////////////////////
;;低機能だけど簡潔なやつ
;;
;;上のよりは機能的には劣りますが，ソースコードは見やすいです．
;;長年使っていたので動作も確実です．
;;スクリプト
;;
;; Emacs風キーバインド
;;

; 選択モードが有効なら1、無効なら0
mode = 0

; Emacs風キーバインドを無効にしたいウィンドウ
; 必要の無い部分はコメントアウトして下さい
is_target()
{
	IfWinActive,ahk_class ConsoleWindowClass ;Cygwin
		Return 1 
	IfWinActive,ahk_class MEADOW ;Meadow
		Return 1 
	IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
		Return 1
	IfWinActive,ahk_class Emacs ;NTEmacs
		Return 1  
	IfWinActive,ahk_class Emacs ;putty
		Return 1  

;	IfWinActive,ahk_class Vim ;Windows上のGVIM
;		Return 1
;	IfWinActive,ahk_class Xming X
;		Return 1
;	IfWinActive,ahk_class SunAwtFrame
;		Return 1
;	IfWinActive,ahk_class XEmacs ;Cygwin上のXEmacs
;		Return 1
	Return 0
}

; crsrとfuncの共通部分
init(ByRef key)
{
	IfInString,key,$
		StringTrimLeft,key,key,1
	if (is_target())
	{
		Send %key%
		Return 0
	}
	else
		Return 1
}

; keyにfuncの機能を割り当てる
; カーソル(cursor)移動系
crsr(key,func)
{
	if(init(key))
	{
		global mode
		if (mode)
			Send +{%func%}
		else
			Send {%func%}
	}
}

; 機能(func)系
func(key,func)
{
	if(init(key))
	{
		global mode
		IfInString,func,^
			Send %func%
		else
			Send {%func%}
		mode = 0    
	}
}


;C-Spaceでmodeをトグル
;$^{Space}::
$^vk20sc039::
	if (is_target())
		Send ^{vk20sc039}
	else
	{
		if (mode)
			mode = 0
		else 
			mode = 1
	}
	Return


; カーソル移動 + 選択
$^p::crsr(A_ThisHotkey,"UP")
$^n::crsr(A_ThisHotkey,"Down")
$^b::crsr(A_ThisHotkey,"Left")
$^f::crsr(A_ThisHotkey,"Right")
$^a::crsr(A_ThisHotkey,"HOME")
$^e::crsr(A_ThisHotkey,"END")
$^v::crsr(A_ThisHotkey,"PgDn")
$!v::crsr(A_ThisHotkey,"PgUp")

; 機能キー
$^i::func(A_ThisHotkey,"Tab")
$^m::func(A_ThisHotkey,"Return")
$^g::func(A_ThisHotkey,"ESC")
$^h::func(A_ThisHotkey,"BS")
$^d::func(A_ThisHotkey,"DEL")
$^y::func(A_ThisHotkey,"^v")
$^s::func(A_ThisHotkey,"^f")
$^/::func(A_ThisHotkey,"^z")
$!w::func(A_ThisHotkey,"^c")

;例外キーバインド
$^k::
	mode = 0
	if (is_target())
		Send ^k
	else 
	{
		Send {SHIFTDOWN}{END}{SHIFTUP}
		Sleep,10 ;[ms]
		Send ^x
	}
	Return  

$^.::
	mode = 0
	if (is_target())
		Send ^.
	else 
		Send {CTRLDOWN}{TAB}{CTRLUP}
	Return

#k::
	MsgBox, 4,, スクリプトを終了しますか?,
	IfMsgBox, Yes
		ExitApp
	Return

;;;googleIME努力の跡
	; IfWinActive,ahk_class GoogleapaneseInputCandidateWindow
	; 	Return 1 
	; IfWinActive,ahk_class GoogleJapaneseInputCompositionWindow
	; 	Return 1 
	; IfWinActive,ahk_class GIMEJaUIWindow
	; 	Return 1 
	; IfWinActive,ahk_class IME
	; 	Return 1 
	; IfWinActive,ahk_class GoogleJapaneseInputCandidateWindowClass
	; 	Return 1 
	; IfWinActive,ahk_class GoogleJapaneseInputCompositionWindowClass
	; 	Return 1 
	; IfWinActive,ahk_class GIMEJaUIWindowClass
	; 	Return 1 
	; IfWinActive,ahk_class IMEClass
	; 	Return 1 
