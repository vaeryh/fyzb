--***************************************************************************************************************************
--* 背包的UI界面系统
--* UI初始化
--* 背包拾取
--*	背包打开
--******************************************************************
scope Bag1 initializer Init

globals
	public hashtable Hash = InitHashtable()--库哈希表
	public item array BarItem --记录背包所有物品数据
endglobals
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--动作
 function HashSave_OrderItem_Actions()
	 SaveItemHandle(Hash, GetHandleId(GetOrderTargetItem()), 0, GetOrderTargetItem())--保存该物品到Hash表
end
--命令：右键点击物品
function HashSave_OrderItem_Conditions takes nothing returns boolean
	return OrderId2String(GetIssuedOrderId()) == "smart" and GetObjItemInt(GetOrderTargetItem(), "powerup") == 0--状态-捡取时自动使用
end
--拾取
 function HashSave_PickItem_Actions()
	 SaveItemHandle(Hash, GetHandleId(GetManipulatedItem()), 0, GetManipulatedItem())--保存该物品到Hash表
end
--获取物品是存Hash
 function Init_D_Actions()
	 RegAllPlayerUnitEvent(nil, function HashSave_PickItem_Actions, EVENT_PLAYER_UNIT_PICKUP_ITEM)--注册触发动作
	 RegAllPlayerUnitEvent(Condition(function HashSave_OrderItem_Conditions), function HashSave_OrderItem_Actions, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
end
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--刷新物品栏每一格的物品数据
 function Refresh_ItemBar_Timer_Actions()
	local integer frame
	local item whichItem
	local integer lopA
	--=====================================================================================
	if DzFrameGetEnable(DzFrameFindByName("BagButtonX", 0)) == false then
		 DzFrameSetAbsolutePoint(DzFrameFindByName("BagButtonNum01", 0), 0, 0.517, -0.3)
		 DestroyTimer(GetExpiredTimer() )
	else
		 DzFrameSetAbsolutePoint(DzFrameFindByName("BagButtonNum01", 0), 0, 0.517, 0.1121)
	end
	--=====================================================================================
	 lopA = 1
	loop
	exitwhen lopA > 6
		 frame = DzFrameFindByName("BagGridNum0" + I2S(lopA), 0)
		 whichItem = UnitItemInSlot(Hero[pid], lopA -1)
		--刷新格子是否有物品存在，存在即显示图标
		if whichItem == nil then
			 DzFrameShow(frame, false)
		else
			 DzFrameShow(frame, true)
			 DzFrameSetTexture(frame, GetObjItemStr(whichItem, "Art"), 0)
		end
		--刷新格子是否有可叠加物品存在（如：药水，材料
		 frame = DzFrameFindByName("BagMinGridNum0" + I2S(lopA), 0)
		if GetItemCharges(whichItem) >= 1 then--s叠加数量最大为99，限制再拾取时设置
			 DzFrameShow(frame, true)
			 DzFrameSetText(DzFrameFindByName("BagMinGridTextNum0" + I2S(lopA), 0), I2S(GetItemCharges(whichItem)) )
		else
			 DzFrameShow(frame, false)
		end

		 lopA = lopA + 1
	endloop
	--=====================================================================================
	 whichItem = nil
end
--刷新物品栏每一格的物品数据
 function Refresh_Timer_Actions()
	local integer frame
	local integer fath = 0
	local integer ch = 0
	local integer lopA
	--=====================================================================================
	if DzFrameGetEnable(DzFrameFindByName("BagButtonX", 0)) == false then
		 DzFrameSetAbsolutePoint(DzFrameGetItemBarButton(0), 0, 0.517, 0.1121)
		 DzFrameSetAbsolutePoint(DzFrameGetItemBarButton(1), 0, 0.556, 0.1121)
		 DzFrameSetAbsolutePoint(DzFrameGetItemBarButton(2), 0, 0.517, 0.0735)
		 DzFrameSetAbsolutePoint(DzFrameGetItemBarButton(3), 0, 0.556, 0.0735)
		 DzFrameSetAbsolutePoint(DzFrameGetItemBarButton(4), 0, 0.517, 0.0349)
		 DzFrameSetAbsolutePoint(DzFrameGetItemBarButton(5), 0, 0.556, 0.0349)
		 DestroyTimer(GetExpiredTimer() )
	else
		 lopA = 0
		loop
		exitwhen lopA > 5
			 frame = DzFrameGetItemBarButton(lopA)
			 DzFrameSetAbsolutePoint(frame, 0, 0.4 + lopA * 0.03, 0.3)
			 lopA = lopA + 1
		endloop
	end
	--=====================================================================================
	 fath = 1
	 lopA = 1
	loop
	exitwhen lopA > 42

		if ModuloInteger(lopA, 6) == 0 then
			 ch = 6
		else
			 ch = ModuloInteger(lopA, 6)
		end

		-- Debug( I2S(fath)+"-"+I2S(ch)+"-"+I2S(lopA) )
		 frame = DzFrameFindByName("BagGridNum" + I2S(fath)+ I2S(ch), 0)
		--刷新格子是否有物品存在，存在即显示图标
		if BarItem[lopA] == nil then
			 DzFrameShow(frame, false)
		else
			 DzFrameShow(frame, true)
			 DzFrameSetTexture(frame, GetObjItemStr(BarItem[lopA], "Art"), 0)
		end

		--刷新格子是否有可叠加物品存在（如：药水，材料）
		if GetItemCharges(BarItem[lopA]) >= 1 then--s叠加数量最大为99，限制再拾取时设置
			 DzFrameShow(DzFrameFindByName("BagMinGridNum" + I2S(fath)+ I2S(ch), 0), true)
			 DzFrameSetText(DzFrameFindByName("BagMinGridTextNum" + I2S(fath)+ I2S(ch), 0), I2S(GetItemCharges(BarItem[lopA])) )
		else
			 DzFrameShow(DzFrameFindByName("BagMinGridNum" + I2S(fath)+ I2S(ch), 0), false)
		end

		if ModuloInteger(lopA, 6) == 0 then
			 fath = fath + 1
		end

		 lopA = lopA + 1
	endloop
	--=====================================================================================
	if UI_Item == nil then
		 TriggerExecute(UI_Leave)--运行离开背包的触发
	else
		 TriggerExecute(UI_Enter)--运行进入背包的触发
	end
	--=====================================================================================
end

 function OnOff_Keyboard_Actions()
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		if DzFrameGetEnable(DzFrameFindByName("BagButtonX", 0)) == false then
			 DzFrameSetEnable(DzFrameFindByName("BagButtonX", 0), true)
			 DzFrameShow(DzFrameFindByName("BagBackdrop", 0), true)
			--开启计时器
			 TimerStart(CreateTimer(), 0.01, true, function Refresh_Timer_Actions)
			 TimerStart(CreateTimer(), 0.01, true, function Refresh_ItemBar_Timer_Actions)
		else
			 DzFrameSetEnable(DzFrameFindByName("BagButtonX", 0), false)
			 DzFrameShow(DzFrameFindByName("BagBackdrop", 0), false)
		end
	end
end
--打开背包
 function Init_C_Actions()
	 TriggerAddAction(Trig_KeyBoard_F5, function OnOff_Keyboard_Actions)--注册触发动作
end
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
---------------------------------------------------------------------------------------
--叠加：动作
 function Add_Actions takes item newItem, integer index returns nothing
	local integer lopB
	 lopB = 1
	loop
	exitwhen lopB > 42

		if GetItemTypeId(BarItem[lopB]) == GetItemTypeId(newItem) and BarItem[lopB] ~= newItem then
			 SetItemCharges(BarItem[lopB], GetItemCharges(BarItem[lopB]) + GetItemCharges(newItem))
			 BarItem[index] = nil
		exitwhen true
		end

		 lopB = lopB + 1
	endloop
end
--叠加入口：条件-本地化
public function Add_Conditions takes item whichItem, integer lopA returns nothing
	local string class = GetObjItemStr(whichItem, "class")
	--可叠加
	if class == "消耗" or class == "权能" or class == "材料" or class == "货币" or class == "宝箱" or class == "礼包" or class == "灵魄" then
		 Add_Actions(whichItem, lopA)
	end
	 class = nil
end
---------------------------------------------------------------------------------------
 function Pick_Save_Actions takes item whichItem returns nothing
	local integer num = 0
	local integer lopA
	local integer lopB

	--检查物品重复信息
	 lopB = 1
	loop
	exitwhen lopB > 42

		if whichItem == BarItem[lopB] then
			return
		end

		 lopB = lopB + 1
	endloop
	--保存到背包空格
	 lopA = 1
	loop
	exitwhen lopA > 42

		if BarItem[lopA] == nil then
			 BarItem[lopA] = whichItem
			 Add_Conditions(whichItem, lopA)--判断是否可以叠加

		exitwhen true
		else
			 num = num + 1
		end

		 lopA = lopA + 1
	endloop

	if num == 42 then
		 DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, "背包已满，请先清理背包！")
		 DzSyncData("DropItem", I2S(GetHandleId(whichItem)) )--同步丢弃物品
	end
end
--动作
public function Pick_Enter_Actions takes item whichItem returns nothing
	 SetItemVisible(whichItem, false)--隐藏

	if GetLocalPlayer() == Player(pid) then
		 Pick_Save_Actions(whichItem)
	end
end

 function Pick_Timer_Actions() --单位绑定计时器
	local unit whichUnit = LoadUnitHandle(Hash, GetHandleId(GetExpiredTimer()), 0)
	local item whichItem = LoadItemHandle(Hash, GetHandleId(GetExpiredTimer()), 1)
	local real distance = LoadReal(Hash, GetHandleId(GetExpiredTimer()), 0)
	local real thisDistance = YhDistanceCoordinate(GetUnitX(whichUnit), GetUnitY(whichUnit), GetItemX(whichItem), GetItemY(whichItem) )
	--单位远离物品
	if distance <= thisDistance and distance ~= 0 then
		 FlushChildHashtable(Hash, GetHandleId(GetExpiredTimer()) )
		 DestroyTimer(GetExpiredTimer() )
	else
		 SaveReal(Hash, GetHandleId(GetExpiredTimer()), 0, thisDistance)
	end
	--靠近物品马上拾取
	if distance <= 200 and distance ~= 0 then
		 Pick_Enter_Actions(whichItem)
		 FlushChildHashtable(Hash, GetHandleId(GetExpiredTimer()) )
		 DestroyTimer(GetExpiredTimer() )
	end

	 whichUnit = nil
	 whichItem = nil
end
--start
 function Pick_Actions()
	if SubString(GetObjItemStr(GetOrderTargetItem(), "class"), 0, 4) == "Only" then
		return--专属不进背包
	end
	--命令单位走向物品
	 IssuePointOrder(GetTriggerUnit(), "move", GetItemX(GetOrderTargetItem()), GetItemY(GetOrderTargetItem()) )
	--计时器绑定单位和物品
	 tmr = CreateTimer()
	 TimerStart(tmr, 0.10, true, function Pick_Timer_Actions)
	 SaveUnitHandle(Hash, GetHandleId(tmr), 0, GetTriggerUnit() )
	 SaveItemHandle(Hash, GetHandleId(tmr), 1, GetOrderTargetItem() )
end
--条件
function Pick_Conditions takes nothing returns boolean
	return UnitInventoryCount(GetTriggerUnit()) == 6 and OrderId2String(GetIssuedOrderId()) == "smart" and GetObjItemInt(GetOrderTargetItem(), "powerup") == 0--状态-捡取时自动使用
end
--满格背包拾取
 function Init_B_Actions()
	 RegUserPlayerUnitEvent(Condition(function Pick_Conditions), function Pick_Actions, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
end
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--frame初始化
 function Init_A_Actions()
	 DzCreateFrame("BagFrame", DzGetGameUI(), 0)--创建框架
	--隐藏背包相关背景
	 DzFrameShow(DzFrameFindByName("BagBackdrop", 0), false)
	 DzFrameShow(DzFrameFindByName("BagBackdropA", 0), false)--一键分解
	--吸附UI
	 DzFrameShow(DzCreateFrame("BagAdsorbBackdrop", DzGetGameUI(), 0), false)
	--设置绝对位置
	-- DzFrameSetAbsolutePoint(DzFrameFindByName("BagButtonNum01", 0), 0, 0.517, -0.3)--模拟物品栏0
	 DzFrameSetAbsolutePoint(DzFrameFindByName("BagBackdrop", 0), 0, 0.6, 0.50)
	--关闭按钮禁用
	 DzFrameSetEnable(DzFrameFindByName("BagButtonX", 0), false)
	--X按钮 按键触发
	 DzFrameSetScriptByCode(DzFrameFindByName("BagButtonX", 0), 1, function OnOff_Keyboard_Actions, false)
end
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--初始化动作
 function Init_Actions()
	 Init_A_Actions()--frame初始化
	 Init_B_Actions()--满格背包拾取，存Hash
	 Init_C_Actions()--打开背包
	 Init_D_Actions()--多种方式获取物品时保存到Hash
end

 function Init()
	 Init_Actions( )
end
