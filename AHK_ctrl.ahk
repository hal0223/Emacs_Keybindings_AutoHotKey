Ctrl::return
LCtrl::return
RCtrl::return

^vk20sc039::
	If is_target()
		Send {CtrlDown}{Space}{CtrlUp}
	Else
	{
		If is_pre_spc
			is_pre_spc = 0
		Else
			is_pre_spc = 1
	}
	Return


^x::
	If is_target()
		Send %A_ThisHotkey%
	Else
		is_pre_x = 1
	Return 
^c::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_x
		kill_emacs()
	}
	Return  
^d::
	If is_target()
		Send %A_ThisHotkey%
    Else
		delete_char()
	Return

!^d::
    If WinActive("ahk_class SunAwtFrame")  ;;Astah
		Send ^d
    Return

^h::
	If is_target()
		Send %A_ThisHotkey%
	Else
		delete_backward_char()
	Return
^k::
	If is_target()
		Send %A_ThisHotkey%
	Else
		kill_line()
	Return
^o::
	If is_target()
		Send %A_ThisHotkey%
	Else
		open_line()
	Return
^g::
	If is_target()
		Send %A_ThisHotkey%
	Else
		quit()
	Return
^j::
	If is_target()
		Send %A_ThisHotkey%
	Else
		newline_and_indent()
	Return
^m::
	If is_target()
		Send %A_ThisHotkey%
	Else
		newline()
	Return
^i::
	If is_target()
		Send %A_ThisHotkey%
	Else
		indent_for_tab_command()
	Return
^s::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_x
			save_buffer()
		Else
			isearch_forward()
	}
	Return
^r::
	If is_target()
		Send %A_ThisHotkey%
	Else
		isearch_backward()
	Return
^w::
	If is_target()
		Send %A_ThisHotkey%
	Else If is_browser()
		Send %A_ThisHotkey%
	Else
		kill_region()
	Return
^q::
    If is_browser()
		kill_region()
	Else
		Send %A_ThisHotkey%
	Return
^y::
	If is_target()
		Send %A_ThisHotkey%
	Else
		yank()
	Return
 
^@::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_spc
			is_pre_spc = 0
		Else
			is_pre_spc = 1
	}
	Return
^a::
	If is_target()
		Send %A_ThisHotkey%
	Else
		move_beginning_of_line()
	Return
^e::
	If is_target()
		Send %A_ThisHotkey%
	Else
		move_end_of_line()
	Return
;;;1•¶šŸ‚Ö
^f::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_x
		find_file()
		Else
		forward_char()
	}
	Return  
;;;ˆê•¶š‘O‚Ö
^b::
	If is_target()
		Send %A_ThisHotkey%
	Else
		backward_char()
	Return
;;;ˆêsã‚Ö
^p::
	If is_target()
		Send %A_ThisHotkey%
	Else
		previous_line()
	Return
;;;ˆês‰º‚Ö
^n::
	If is_target()
		Send %A_ThisHotkey%
	Else
		next_line()
	Return
;;;1‰æ–Ê‰º‚Ö
^v::
	If is_target()
		Send %A_ThisHotkey%
	Else
		scroll_down()
	Return

; ^@::
; 	If is_target()
; 		Send %A_ThisHotkey%
; 	Else
; 	{
; 		If is_pre_spc
; 			is_pre_spc = 0
; 		Else
; 			is_pre_spc = 1
; 	}
; 	Return

