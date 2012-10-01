; コマンドプロンプトで、C-Yで貼り付ける
; //TODO [c-k][c-x,c-h][set region][c-w]
#IfWinActive ahk_class ConsoleWindowClass
	^Y::SendInput {Raw}%clipboard%
	return
#IfWinActive

^vk1Csc079::                ;C+変換キー
    MouseClickPause()       ;タッチパッドでのクリック停止
    Return
vkF2sc070::                 ;ひらがな/カタカナキー
    RightClick()            ;右クリック
    Return
vk1Csc079::                 ;変換キー
    LeftClick()             ;左クリック
	Return 
^vk20sc039::                ;Ctrl+Spaceキー
	If is_ineffective()
		Send {CtrlDown}{Space}{CtrlUp}
	Else
	{
		If is_pre_spc
			is_pre_spc = 0
		Else
			is_pre_spc = 1
	}
	Return
