//***************************************************************************************************************************
//* 
//* 测试
//*
//******************************************************************
scope Test initializer Init

globals
	//private hashtable Hash = InitHashtable()//库哈希表
endglobals    
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
private function Chat_Actions takes nothing returns nothing
	local string str = GetEventPlayerChatString()
	call DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, str)
	//local string class = SubString(str, 0, 2)
	//local integer num = S2I(SubString(str, 2, 9))
	if str == "开启全图" then
		call FogEnable(false)
		call FogMaskEnable(false)
	endif
	
	if str == "关闭全图" then
		call FogEnable(true)
		call FogMaskEnable(true)
	endif
	set str = null
endfunction

private function Init_Chat_Actions takes nothing returns nothing
	call RegUserPlayerChatEvent(null, function Chat_Actions)
endfunction
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  
private function Keyboard takes nothing returns nothing
	local integer pid = GetPlayerId(DzGetTriggerKeyPlayer())
	if DzGetTriggerKey() == 'Z' then
		call Debug("Z")
		//call SetUnitPosition(Hero[pid], DzGetMouseTerrainX(), DzGetMouseTerrainY() )
		//<? SetUnitPosition(Hero[Player(0)], DzGetMouseTerrainX(), DzGetMouseTerrainY() ) ?>
	elseif DzGetTriggerKey() == 'X' then
		
	elseif DzGetTriggerKey() == 'C' then
		call CreateUnit(Player(11), ChooseRandomCreep(1), DzGetMouseTerrainX(), DzGetMouseTerrainY(), bj_UNIT_FACING)
		call CreateUnit(Player(11), ChooseRandomCreep(1), DzGetMouseTerrainX(), DzGetMouseTerrainY(), bj_UNIT_FACING)
		call CreateUnit(Player(11), ChooseRandomCreep(1), DzGetMouseTerrainX(), DzGetMouseTerrainY(), bj_UNIT_FACING)
		call CreateUnit(Player(11), ChooseRandomCreep(1), DzGetMouseTerrainX(), DzGetMouseTerrainY(), bj_UNIT_FACING)
	elseif DzGetTriggerKey() == 'V' then           
		//call SaveReal( LzTable_Hash, GetHandleId(UI_Item), 666, LoadReal( LzTable_Hash, GetHandleId(UI_Item), 666 )+1 )
	endif
	
endfunction  

private function Init_Keyboard_Actions takes nothing returns nothing
	call TriggerAddAction(Trig_KeyBoard_Z, function Keyboard)
	call TriggerAddAction(Trig_KeyBoard_X, function Keyboard)
	call TriggerAddAction(Trig_KeyBoard_C, function Keyboard)
	call TriggerAddAction(Trig_KeyBoard_V, function Keyboard)
endfunction
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
private function Init_Actions takes nothing returns nothing //    
	call Init_Keyboard_Actions()
	call Init_Chat_Actions( )
endfunction

private function Init takes nothing returns nothing //    
	call Init_Actions()
endfunction

endscope
