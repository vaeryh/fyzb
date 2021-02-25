//***************************************************************************************************************************
//*
//******************************************************************
scope Mouse initializer Init

globals
	private hashtable Hash = InitHashtable()
	public integer ItemBarSolt //物品栏序号
	public trigger ItemBarLeave = CreateTrigger()//物品栏离开
	public trigger ItemBarEnter = CreateTrigger()//物品栏进入
endglobals
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//离开
private function Leave_Actions takes nothing returns nothing
	set ItemBarSolt = -1
	//运行触发器
	call TriggerExecute(ItemBarLeave)
endfunction
//进入
private function Enter_Actions takes nothing returns nothing
	set ItemBarSolt = LoadInteger(Hash, DzGetTriggerUIEventFrame(), 0)
	//运行触发器
	call TriggerExecute(ItemBarEnter)
endfunction
//鼠标进入、离开物品栏
private function Init_A_Actions takes nothing returns nothing
	local integer lopA
	local integer frame

	set lopA = 0
	loop
	exitwhen lopA > 5
		set frame = DzFrameGetItemBarButton(lopA)
		call SaveInteger(Hash, frame, 0, lopA)//关联序号

		//call DzFrameSetScriptByCode(frame, 1, function Click_Actions, false) // 鼠标点击
		call DzFrameSetScriptByCode(frame, 2, function Enter_Actions, false) // 鼠标进入
		call DzFrameSetScriptByCode(frame, 3, function Leave_Actions, false) // 鼠标离开
		//call DzFrameSetScriptByCode(frame, 12, function DoubleClick_Actions, false)//鼠标双击

		set lopA = lopA + 1
	endloop
endfunction
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
private function Init takes nothing returns nothing
	call Init_A_Actions( )//鼠标进入物品栏
endfunction

endscope
