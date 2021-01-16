//***************************************************************************************************************************
//* 
//******************************************************************
scope Keyboard initializer Init

globals
	trigger Trig_KeyBoard_F2_Down = CreateTrigger()
	trigger Trig_KeyBoard_F3_Down = CreateTrigger()
	trigger Trig_KeyBoard_F4_Down = CreateTrigger()
	trigger Trig_KeyBoard_F5_Down = CreateTrigger()
	trigger Trig_KeyBoard_F9_Down = CreateTrigger()
	trigger Trig_KeyBoard_Z_Down = CreateTrigger()
	trigger Trig_KeyBoard_X_Down = CreateTrigger()
	trigger Trig_KeyBoard_C_Down = CreateTrigger()
	trigger Trig_KeyBoard_V_Down = CreateTrigger()
	trigger Trig_KeyBoard_1_Up = CreateTrigger()//非小键盘
	trigger Trig_KeyBoard_2_Up = CreateTrigger()//非小键盘
	trigger Trig_KeyBoard_3_Up = CreateTrigger()//非小键盘
	trigger Trig_KeyBoard_4_Up = CreateTrigger()//非小键盘
	trigger Trig_KeyBoard_5_Up = CreateTrigger()//非小键盘
	trigger Trig_KeyBoard_6_Up = CreateTrigger()//非小键盘
endglobals
//-----------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------
private function Init_Actions takes nothing returns nothing
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_F2_Down, 1, DzI2K(113) )//F2
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_F3_Down, 1, DzI2K(114) )//F3
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_F4_Down, 1, DzI2K(115) )//F4
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_F5_Down, 1, DzI2K(116) )//F5
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_F9_Down, 1, DzI2K(120) )//F9
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_Z_Down, 1, 'Z' )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_X_Down, 1, 'X' )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_C_Down, 1, 'C' )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_V_Down, 1, 'V' )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_1_Up, 0, DzI2K(49) )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_2_Up, 0, DzI2K(50) )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_3_Up, 0, DzI2K(51) )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_4_Up, 0, DzI2K(52) )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_5_Up, 0, DzI2K(53) )
	call DzTriggerRegisterKeyEventTrg(Trig_KeyBoard_6_Up, 0, DzI2K(54) )
endfunction

private function Init takes nothing returns nothing //    
	call Init_Actions( )
endfunction

endscope