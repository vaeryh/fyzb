//***************************************************************************************************************************
//* 鼠标点击触发：本地化
//******************************************************************
scope Mouse initializer Init

globals
	public boolean State_Right
	public boolean State_Left
	trigger Trig_MouseRightClick = CreateTrigger()//右键点击
	trigger Trig_MouseRightDisClick = CreateTrigger()//右键释放
	trigger Trig_MouseLeftClick = CreateTrigger()//左键点击
	trigger Trig_MouseLeftDisClick = CreateTrigger()//左键释放
endglobals
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 
//鼠标左键释放：动作
private function LeftDisClick_Actions takes nothing returns nothing
	set State_Left = false
endfunction
//鼠标左键释放：条件
private function LeftDisClick_Conditions takes nothing returns nothing
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		call LeftDisClick_Actions()
	endif
endfunction
//鼠标左键释放
private function Init_D_Actions takes nothing returns nothing
	call DzTriggerRegisterMouseEventTrg( Trig_MouseLeftDisClick, 0, 1 )
	call TriggerAddAction(Trig_MouseLeftDisClick, function LeftDisClick_Conditions)
endfunction
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//鼠标左键点击：动作
private function LeftClick_Actions takes nothing returns nothing
	set State_Left = true
endfunction
//鼠标左键点击：条件
private function LeftClick_Conditions takes nothing returns nothing
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		call LeftClick_Actions()
	endif
endfunction
//鼠标左键点击
private function Init_C_Actions takes nothing returns nothing
	call DzTriggerRegisterMouseEventTrg( Trig_MouseLeftClick, 1, 1 )
	call TriggerAddAction(Trig_MouseLeftClick, function LeftClick_Conditions)
endfunction
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//鼠标右键释放：动作
private function RightDisClick_Actions takes nothing returns nothing
	set State_Right = false
endfunction
//鼠标右键释放：条件
private function RightDisClick_Conditions takes nothing returns nothing
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		call RightDisClick_Actions()
	endif
endfunction
//鼠标右键释放
private function Init_B_Actions takes nothing returns nothing
	call DzTriggerRegisterMouseEventTrg( Trig_MouseRightDisClick, 0, 2 )
	call TriggerAddAction(Trig_MouseRightDisClick, function RightDisClick_Conditions)
endfunction
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//鼠标右键点击：动作
private function RightClick_Actions takes nothing returns nothing
	set State_Right = true
endfunction
//鼠标右键点击：条件
private function RightClick_Conditions takes nothing returns nothing
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		call RightClick_Actions()
	endif
endfunction
//鼠标右键点击
private function Init_A_Actions takes nothing returns nothing
	call DzTriggerRegisterMouseEventTrg( Trig_MouseRightClick, 1, 2 )
	call TriggerAddAction(Trig_MouseRightClick, function RightClick_Conditions)
endfunction
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
private function Init_Actions takes nothing returns nothing
	call Init_A_Actions( )//鼠标右键点击
	call Init_B_Actions( )//鼠标右键释放
	call Init_C_Actions( )//鼠标左键点击
	call Init_D_Actions( )//鼠标左键释放
	
	call DestroyTrigger( GetTriggeringTrigger() )//删除一次性触发
endfunction

private function Init takes nothing returns nothing 
	call Init_Actions(  )
endfunction

endscope
