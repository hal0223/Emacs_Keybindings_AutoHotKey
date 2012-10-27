;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;;
; Emacsキー定義                               ;;
;                                             ;;
; WindowsでEmacs風キーバインド - Usipedia 
; http://usi3.com/index.php?title=Windows%E3%81%A7Emacs%E9%A2%A8%E3%82%AD%E3%83%BC%E3%83%90%E3%82%A4%E3%83%B3%E3%83%89
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^vk20sc039::   ;[Ctrl+Spaceキー]
	pre_space()
	Return
^x::
	pre_x()
	Return 
!a::
	select_all()
	Return
!k::
	kill_buffer()
	Return
!f::
 	next_page()
        Return
!b::
	prev_page()
        Return
!p::
	parent_dir()
        Return
!v::
	scroll_up()
	Return
!w::
	save_region()
	Return
^c::
        kill_emacs()
	Return  
^d::
	delete_char()
	Return

^h::
	delete_backward_char()
	Return
^k::
	kill_line()
	Return
^o::
	open_line()
	Return
^g::
	quit()
	Return
^j::
	newline_and_indent()
	Return
^m::
	newline()
	Return
^i::
	indent_for_tab_command()
	Return
^s::
	If is_pre_x
		save_buffer()
	Else
		isearch_forward()
	Return
^w::
	kill_region()
	Return
^y::
	yank()
	Return
 
^a::
	move_beginning_of_line()
	Return
^e::
	move_end_of_line()
	Return
^f::
	If is_pre_x
		find_file()
	Else
		forward_char()
	Return  
^b::
	backward_char()
	Return
^p::
	previous_line()
	Return
^n::
	next_line()
	Return
^v::
	scroll_down()
	Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;;
; Emacs関数定義                               ;;
;                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;グローバル変数;;;;;;;;;;;;;
; C-x の押し下げフラグ
is_pre_x = 0

; C-Space の押し下げフラグ
is_pre_spc = 0

;;;;;;関数;;;;;;;;;;;;;;;;;;;;;;
pre_space()
{
	global
	If is_ineffective(){
		Send {CtrlDown}{Space}{CtrlUp}
	}Else{
		If is_pre_spc
			is_pre_spc = 0
		Else
			is_pre_spc = 1
	}
}

pre_x()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		is_pre_x = 1
	}
}

next_page()	
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send !{Right}
		is_pre_spc = 0
	}
}

prev_page()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
	        Send !{Left}
		is_pre_spc = 0
	}
}

parent_dir()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send !{Up}
		is_pre_spc = 0
	}
}

;一行上へ移動
previous_line()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		if is_pre_spc
			Send +{Up}
		else
			Send {Up}
	}
}
;一行下へ移動
next_line()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		if is_pre_spc
			Send +{Down}
		else
			Send {Down}
	}
}

move_beginning_of_line()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
	if is_pre_spc
		Send +{HOME}
	Else
		Send {HOME}
	Return
	}
}
move_end_of_line()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
	if is_pre_spc
		Send +{END}
	Else
		Send {END}
	}
}
forward_char()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
	if is_pre_spc
		Send +{Right}
	Else
		Send {Right}
	}
}
backward_char()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
	if is_pre_spc
		Send +{Left} 
	Else
		Send {Left}
	Return
	}
}

scroll_up()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		if is_pre_spc
		   Send +{PgUp}
		Else
		   Send {PgUp}
	}
}

scroll_down()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		if is_pre_spc
		   Send +{PgDn}
		Else
		   Send {PgDn}
	}
}

select_all()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^{a}
		is_pre_spc = 0
	}
}

kill_buffer()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^{w}
		is_pre_spc = 0
	}
}


;後一文字削除
delete_char()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send {Del}
		is_pre_spc = 0
	}
}
;前一文字削除
delete_backward_char()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send {BS}
		is_pre_spc = 0
	}
}
;カーソル後ろから行末まで切り取り
kill_line()
{
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send {ShiftDown}{END}{SHIFTUP}
		Sleep 10 ;[ms]
		Send ^x
		is_pre_spc = 0
	}
}
;下一行挿入
open_line()
{
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send {END}{Enter}{Up}
		global is_pre_spc = 0
	}
}
quit()
{
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send, {ESC}
		Send, {Left}
		Send, {Right}
		global is_pre_spc = 0
	}
}
newline()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send {Enter}
		is_pre_spc = 0
	}
}
indent_for_tab_command()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send {Tab}
		is_pre_spc = 0
	}
}
newline_and_indent()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send {Enter}{Tab}
		is_pre_spc = 0
	}
}
isearch_forward()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^f
		is_pre_spc = 0
	}
}
isearch_backward()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^f
		is_pre_spc = 0
	}
}

kill_region()
{
	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^x
		global is_pre_spc = 0
	}
}

save_region()
{
	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^c
		global is_pre_spc = 0
	}
}

yank()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^v
		is_pre_spc = 0
	}
}
undo()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^z
		is_pre_spc = 0
	}
}
find_file()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send ^o
		s_pre_x = 0
	}
}

save_buffer()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
		Return
	}Else{
		Send, ^s
		is_pre_x = 0
		Return
	}
	Return
}

kill_emacs()
{
	global
 	If is_ineffective(){
		Send %A_ThisHotkey%
	}Else{
		Send !{F4}
		is_pre_x = 0
	}
}
