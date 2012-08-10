;;//////////////////////////////////////////////////////////////////////
;;//////////////////////////////////////////////////////////////////////
;;//////////////////////////////////////////////////////////////////////
;;��@�\�����ǊȌ��Ȃ��
;;
;;��̂��͋@�\�I�ɂ͗��܂����C�\�[�X�R�[�h�͌��₷���ł��D
;;���N�g���Ă����̂œ�����m���ł��D
;;�X�N���v�g
;;
;; Emacs���L�[�o�C���h
;;

; �I�����[�h���L���Ȃ�1�A�����Ȃ�0
mode = 0

; Emacs���L�[�o�C���h�𖳌��ɂ������E�B���h�E
; �K�v�̖��������̓R�����g�A�E�g���ĉ�����
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

;	IfWinActive,ahk_class Vim ;Windows���GVIM
;		Return 1
;	IfWinActive,ahk_class Xming X
;		Return 1
;	IfWinActive,ahk_class SunAwtFrame
;		Return 1
;	IfWinActive,ahk_class XEmacs ;Cygwin���XEmacs
;		Return 1
	Return 0
}

; crsr��func�̋��ʕ���
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

; key��func�̋@�\�����蓖�Ă�
; �J�[�\��(cursor)�ړ��n
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

; �@�\(func)�n
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


;C-Space��mode���g�O��
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


; �J�[�\���ړ� + �I��
$^p::crsr(A_ThisHotkey,"UP")
$^n::crsr(A_ThisHotkey,"Down")
$^b::crsr(A_ThisHotkey,"Left")
$^f::crsr(A_ThisHotkey,"Right")
$^a::crsr(A_ThisHotkey,"HOME")
$^e::crsr(A_ThisHotkey,"END")
$^v::crsr(A_ThisHotkey,"PgDn")
$!v::crsr(A_ThisHotkey,"PgUp")

; �@�\�L�[
$^i::func(A_ThisHotkey,"Tab")
$^m::func(A_ThisHotkey,"Return")
$^g::func(A_ThisHotkey,"ESC")
$^h::func(A_ThisHotkey,"BS")
$^d::func(A_ThisHotkey,"DEL")
$^y::func(A_ThisHotkey,"^v")
$^s::func(A_ThisHotkey,"^f")
$^/::func(A_ThisHotkey,"^z")
$!w::func(A_ThisHotkey,"^c")

;��O�L�[�o�C���h
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
	MsgBox, 4,, �X�N���v�g���I�����܂���?,
	IfMsgBox, Yes
		ExitApp
	Return

;;;googleIME�w�͂̐�
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
