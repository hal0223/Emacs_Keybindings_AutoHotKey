; autohotkey�𖳌��ɂ������E�B���h�E�ꗗ ineffective window list
is_target()
{
	if WinActive("ahk_class PuTTY")
	|| WinActive("ahk_class Emacs") 
	|| WinActive("ahk_class MEADOW")
	|| WinActive("ahk_class Putty")
	|| WinActive("ahk_class mintty")
;	|| WinActive("ahk_class wndclass_desked_gsk") ;VisualStudio
;	|| WinActive("ahk_class XEmacs") ;Cygwin���XEmacs
;	|| WinActive("ahk_class Vim");Windows���GVIM 
;	|| WinActive("ahk_class SunAwtFrame")
;	|| WinActive("ahk_class cygwin/x X rl-xterm-XTerm-0")
    Return 1
	Return 0
}

; �u���E�U�����̃E�B���h�E�ꗗ
; [ctrl+w]�𖳌��A�؂����[ctrl+q]�ōs��
is_browser()
{
	If WinActive("ahk_class ahk_class ExploreWClass")  ;;WindowsXP Explorer
	|| WinActive("ahk_class ahk_class WindowsForms10.Window.8.app.0.378734a")
	|| WinActive("ahk_class CabinetWClass")
	|| WinActive("ahk_class TXFinder.UnicodeClass") ;Finder
	|| WinActive("ahk_class MozillaWindowClass")
	|| WinActive("ahk_class Chrome_WidgetWin_1")
	|| WinActive("ahk_class Chrome_WidgetWin_0")
	Return 1
	Return 0
}
