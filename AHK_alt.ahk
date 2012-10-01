+^d::
	IfWinActive,ahk_class SunAwtFrame ;Astah
		Send ^d
    Return

!w::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		kill_ring_save()
	Return
;;;1画面上へ
!v::
	If is_ineffective()
		Send %A_ThisHotkey%
	Else
		scroll_up()
	Return
!f::
   If is_browser()
      {
       Send !{Right}
       Return
      }
   Else
		Send %A_ThisHotkey%
   Return
!b::
   If is_browser()
      {
       Send !{Left}
       Return
      }
   Else
		Send %A_ThisHotkey%
   Return
