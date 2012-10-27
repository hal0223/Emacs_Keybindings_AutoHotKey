;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;;
; その他キー定義                              ;;
;                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PDICをアクティブ化
!C::
	ActivateProgram(PDIC_WIN_NAME, PDIC_EXE_PATH)
	ControlSetText , Edit1, , Personal Dictionary ;検索文字列をクリア
	Return

;Google Chromeをアクティブ化
!g:: 
        ActivateProgram(CHROME_CLASS_NAME, CHROME_EXE_PATH)
	Return

;Emacsをアクティブ化
!e::
	ActivateProgram(EMACS_WIN_NAME, EMACS_EXE_PATH)
	Return

; [コマンドプロンプト]C-Yで貼り付け
#IfWinActive ahk_class ConsoleWindowClass
	^Y::SendInput {Raw}%clipboard%
#IfWinActive

;Windowsキー
#p::#Up
#n::#Down
#b::#Left
#f::#Right

;Zenbook用スクリプト==================
;[C+F3]タッチパッドでのクリック停止
^F3::
    MouseClickPause()
    Return

;[F3]左クリック
F3::
   if (MousePauseFlg){
       LeftClick()
    }else{
 	Send {F3}
    }
    Return 
;[F4]右クリック
F4::
    RightClick()
    Return
;=======================================

;ポケモンキーボード用スクリプト========
;Alt+数字xキー→Fxキー
!1:: Send {F1}
!2:: Send {F2}
!3:: Send {F3}
!4:: Send {F4}
!5:: Send {F5}
!6:: Send {F6}
!7:: Send {F7}
!8:: Send {F8}
!9:: Send {F9}
^9:: Send {F12}
^0:: Send {F10}
^4:: Send ^{F4}
;=======================================

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; 関数定義
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;グローバル変数;;;;;;;;;;;;;
;マウス停止フラグ
MousePauseFlg := True

;;;;;;ラベル;;;;;;;;;;;;;;;;;;;
;無効化処理
DoNothing:
Return

;;;;;;関数;;;;;;;;;;;;;;;;;;;;;;
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

;クリック有効/無効切り替え
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

