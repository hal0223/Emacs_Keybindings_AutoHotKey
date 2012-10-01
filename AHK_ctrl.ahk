^x::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		is_pre_x = 1
	Return 
^c::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
	{
        kill_emacs()
	}
	Return  
^d::
	If is_ineffective()
		Send %A_ThisHotkey%
    Else
		delete_char()
	Return

!^d::
    If WinActive("ahk_class SunAwtFrame")  ;;Astah
		Send ^d
    Return

^h::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		delete_backward_char()
	Return
^k::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		kill_line()
	Return
^o::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		open_line()
	Return
^g::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		quit()
	Return
^j::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		newline_and_indent()
	Return
^m::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		newline()
	Return
^i::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		indent_for_tab_command()
	Return
^s::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_x
			save_buffer()
		Else
			isearch_forward()
	}
    Return
^9::
    ActivateProgram(Personal Dictionary, "C:\Program Files (x86)\Personal Dictionary (Unicode)\PDICU.EXE")
	Return

^2:: 
    If is_browser()
        previous_tab()
    else
		Send %A_ThisHotkey%
	Return
^r::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		isearch_backward()
	Return
^w::
	If is_ineffective()
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
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		yank()
	Return
 
^@::
	If is_ineffective()
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
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		move_beginning_of_line()
	Return
^e::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		move_end_of_line()
	Return
;;;1文字次へ
^f::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_x
		find_file()
		Else
		forward_char()
	}
	Return  
;;;一文字前へ
^b::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		backward_char()
	Return
;;;一行上へ
^p::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		previous_line()
	Return
;;;一行下へ
^n::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		next_line()
	Return
;;;1画面下へ
^v::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		scroll_down()
	Return


