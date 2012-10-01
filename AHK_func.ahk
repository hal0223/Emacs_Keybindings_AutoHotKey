;;;;グローバル変数;;;;;;;;;;;;;
; C-x が押されると1になる
is_pre_x = 0

; C-Space が押されると1になる
is_pre_spc = 0
           
;マウス停止フラグ
MousePauseFlg := True

;;;;;;ラベル;;;;;;;;;;;;;;;;;;;
;無効化処理
DoNothing:
Return

;;;;;;関数;;;;;;;;;;;;;;;;;;;;;;
;左クリック
LeftClick()
{
   global MousePauseFlg
   if (MousePauseFlg)
   { 
     MouseClick, Left
   }
}
;右クリック
RightClick()
{
   global MousePauseFlg
   if (MousePauseFlg)
   { 
     MouseClick, Right
   }
}
;マウスクリック有効/無効切り替え
MouseClickPause()
{
   global MousePauseFlg
   if (MousePauseFlg)   ;ポーズ解除
   {     
     Tooltip, , , , 1                  ;Pauseメッセージ非表示
     Hotkey, LButton, DoNothing, Off   ;左クリック再開
     Hotkey, RButton, DoNothing, Off   ;右クリック再開
     MousePauseFlg := False            ;ポーズフラグオフ
   }
   else                  ;ポーズ
   {
     Tooltip, Mouse Click Disable, 100, 0, 1  ;Pauseメッセージ表示
     Hotkey, LButton, DoNothing, On    ;左クリック停止
     Hotkey, RButton, DoNothing, On    ;右クリック停止
     MousePauseFlg := True             ;ポーズフラグオン
    }
    Return
}
;左のタブへ移動ShiftCtrlAlt
previous_tab()
{
    Send +^{Tab}
	Return
}
;プロセスが存在すれば呼び出し、存在しなければ起動する
ActivateProgram(ProcName, ProcExePath)
{
    IfWinExist, %ProcName%
    {
      WinActivate, %ProcName%
      return    
    }           
    else        
    {
      Run, %ProcExePath%
      WinActivate, %ProcName%
    }
}                   
;一行上へ移動
previous_line()
{
	global
	if is_pre_spc
		Send +{Up}
	Else
		Send {Up}
	Return
}
;一行下へ移動
next_line()
{
	global
	if is_pre_spc
		Send +{Down}
	Else
		Send {Down}
	Return
}
;後一文字削除
delete_char()
{
	Send {Del}
	global is_pre_spc = 0
	Return
}
;前一文字削除
delete_backward_char()
{
	Send {BS}
	global is_pre_spc = 0
	Return
}
;カーソル後ろから行末まで切り取り
kill_line()
{
	Send {ShiftDown}{END}{SHIFTUP}
	Sleep 10 ;[ms]
	Send ^x
	global is_pre_spc = 0
	Return
}
;下一行挿入
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
