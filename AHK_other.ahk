; for windows command prompt
; //TODO [c-k][c-x,c-h][set region][c-w]
#IfWinActive ahk_class ConsoleWindowClass
	^Y::SendInput {Raw}%clipboard%
	return
#IfWinActive



; #k::
; 	MsgBox, 4,, �X�N���v�g���I�����܂���?,
; 	IfMsgBox, Yes
; 		ExitApp
; 	Return

