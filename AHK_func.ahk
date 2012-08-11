; C-x が押されると1になる
is_pre_x = 0

; C-Space が押されると1になる
is_pre_spc = 0

delete_char()
{
	Send {Del}
	global is_pre_spc = 0
	Return
}
delete_backward_char()
{
	Send {BS}
	global is_pre_spc = 0
	Return
}
kill_line()
{
	Send {ShiftDown}{END}{SHIFTUP}
	Sleep 10 ;[ms]
	Send ^x
	global is_pre_spc = 0
	Return
}
open_line()
{
	Send {END}{Enter}{Up}
	global is_pre_spc = 0
	Return
}
quit()
{
	Send {ESC}
	global is_pre_spc = 0
	Return
}
newline()
{
	Send {Enter}
	global is_pre_spc = 0
	Return
}
indent_for_tab_command()
{
	Send {Tab}
	global is_pre_spc = 0
	Return
}
newline_and_indent()
{
	Send {Enter}{Tab}
	global is_pre_spc = 0
	Return
}
isearch_forward()
{
	Send ^f
	global is_pre_spc = 0
	Return
}
isearch_backward()
{
	Send ^f
	global is_pre_spc = 0
	Return
}
kill_region()
{
	Send ^x
	global is_pre_spc = 0
	Return
}
kill_ring_save()
{
	Send ^c
	global is_pre_spc = 0
	Return
}
yank()
{
	Send ^v
	global is_pre_spc = 0
	Return
}
undo()
{
	Send ^z
	global is_pre_spc = 0
	Return
}
find_file()
{
	Send ^o
	global is_pre_x = 0
	Return
}
save_buffer()
{
	Send, ^s
	global is_pre_x = 0
	Return
}
kill_emacs()
{
	Send !{F4}
	global is_pre_x = 0
	Return
}
 
move_beginning_of_line()
{
	global
	if is_pre_spc
		Send +{HOME}
	Else
		Send {HOME}
	Return
}
move_end_of_line()
{
	global
	if is_pre_spc
		Send +{END}
	Else
		Send {END}
	Return
}
previous_line()
{
	global
	if is_pre_spc
		Send +{Up}
	Else
		Send {Up}
		Sleep 5 ;[ms]
	Return
}
next_line()
{
	global
	if is_pre_spc
		Send +{Down}
	Else
		Send {Down}
		Sleep 5 ;[ms]
	Return
}
forward_char()
{
	global
	if is_pre_spc
		Send +{Right}
	Else
		Send {Right}
	Return
}
backward_char()
{
	global
	if is_pre_spc
		Send +{Left} 
	Else
		Send {Left}
	Return
}
scroll_up()
{
	global
	if is_pre_spc
		Send +{PgUp}
	Else
		Send {PgUp}
	Return
}
scroll_down()
{
	global
	if is_pre_spc
		Send +{PgDn}
	Else
		Send {PgDn}
	Return
}
back_page()
{
       Send !{Left}
       global is_pre_spc = 0
       Return
}
