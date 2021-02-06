--***************************************************************************************************************************
--* 背包的功能系统
--* 一键分解
--* 一键整理
--*
--*
--*
--******************************************************************
scope Bag3 initializer Init

globals
	 integer array FenJie
endglobals
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--一键整理：二维降一维
 function BagButtonB_Actions()
	--local integer pid = GetPlayerId(DzGetTriggerKeyPlayer())
	local integer lopB
	local integer N = 0
	local item array whichItem
	local integer array Num		--优先权
	local integer temp
	local item tempItem
	local integer lopA = 1

	 lopA = 1
	loop
	exitwhen lopA > 42
		 N = N + 1
		 whichItem[N] = Bag1_BarItem[lopA]

		 lopA = lopA + 1
	endloop
	-- Debug("N:"+I2S(N))
	----------------------------------------------------------------------------
	 lopA = 1
	loop
	exitwhen lopA > 42
		if whichItem[lopA] == nil then
			 Num[lopA] = 999999
		else
			 Num[lopA] = GetObjItemInt(whichItem[lopA], "prio")* 10000 + GetObjItemInt(whichItem[lopA], "Level")* 10 + GetObjItemInt(whichItem[lopA], "oldLevel")
		end

		 lopA = lopA + 1
	endloop

	/* Debug("==============================")
	 lopA = 1
	loop
	exitwhen lopA > N
		 Debug("A："+I2S(Num[lopA]))
		 lopA = lopA + 1
	endloop*/

	--冒泡排序
	 lopA = 1
	loop
	exitwhen lopA > 42
		 lopB = 1
		loop
		exitwhen lopB > 42 -lopA
			if Num[lopB] > Num[lopB + 1] then
				--数字调整
				 temp = Num[lopB + 1]
				 Num[lopB + 1] = Num[lopB]--冒泡排序，值越大排在越后面
				 Num[lopB] = temp
				--物品顺序调换
				 tempItem = whichItem[lopB + 1]
				 whichItem[lopB + 1] = whichItem[lopB]
				 whichItem[lopB] = tempItem
			end
			 lopB = lopB + 1
		endloop
		 lopA = lopA + 1
	endloop

	/* Debug("==============================")
	 lopA = 1
	loop
	exitwhen lopA > N
		 Debug("B："+I2S(Num[lopA]))
		 lopA = lopA + 1
	endloop*/
	----------------------------------------------------------------------------
	 lopA = 1
	loop
	exitwhen lopA > N
		 Bag1_BarItem[lopA] = whichItem[lopA]

		 lopA = lopA + 1
	endloop
	----------------------------------------------------------------------------
end

 function BagButtonB_Conditions()
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		 BagButtonB_Actions()
	end
end
--一键整理
 function Init_Actions_B()
	 DzFrameSetScriptByCode(DzFrameFindByName("BagButtonB", 0), 1, function BagButtonB_Conditions, false)--设置按钮触发
end
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--开启一键分解
 function BagButtonA_Actions()
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		if DzFrameGetEnable(DzFrameFindByName("BagButtonB1", 0)) == false then
			 DzFrameSetEnable(DzFrameFindByName("BagButtonB1", 0), true)
			 DzFrameShow(DzFrameFindByName("BagBackdropA", 0), true)
		else
			 DzFrameSetEnable(DzFrameFindByName("BagButtonB1", 0), false)
			 DzFrameShow(DzFrameFindByName("BagBackdropA", 0), false)
		end
	end
end
--关闭一键分解
 function BagButtonB1_Actions()
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		 DzFrameShow(DzFrameFindByName("BagBackdropA", 0), false)
		 DzFrameSetEnable(DzFrameFindByName("BagButtonB1", 0), false)--配合一键整理可以单独开关
	end
end
---------------------------------------------------------------------------------------
--一键分解:材料
 function BagButtonA1_Actions_2()
	local item whichItem
	local integer ItemLev
	local integer lopA
	local integer gold = 0
	 lopA = 1
	loop
	exitwhen lopA > 42

		 whichItem = Bag1_BarItem[lopA]
		 ItemLev = GetObjItemInt(whichItem, "Level")--获取等级

		if GetObjItemStr(whichItem, "class") == "材料" then

			--! textmacro BagBarFenJCl takes R0,R1,R2
			if FenJie[$R0$] == 1 and ItemLev >= $R1$ and ItemLev <= $R2$ then
				 gold = gold + GetItemCharges(whichItem)* GetObjItemInt(whichItem, "goldcost")
				 DzSyncData("RemoveItem", I2S(GetHandleId(whichItem)) )--删除物品同步
				 Bag1_BarItem[lopA] = nil--置空
			end
			--! endtextmacro

			--! runtextmacro BagBarFenJCl("1","1","4")--普通
			--! runtextmacro BagBarFenJCl("2","5","8")--稀有
			--! runtextmacro BagBarFenJCl("3","9","12")--完美
			--! runtextmacro BagBarFenJCl("4","13","16")--史诗
			--! runtextmacro BagBarFenJCl("5","17","19")--传说
			--! runtextmacro BagBarFenJCl("6","20","20")--神话
		end

		 lopA = lopA + 1
	endloop
	--结算金币
	 DzSyncData("AddGold", I2S(gold) )
	 Debug("分解金币："+I2S(gold))
	 whichItem = nil
end
---------------------------------------------------------------------------------------
--一键分解:灵装
 function BagButtonA1_Actions_1()
	local item whichItem
	local integer ItemLev
	local integer lopA
	local integer array num
	local integer gold = 0

	 lopA = 1
	loop
	exitwhen lopA > 42

		 whichItem = Bag1_BarItem[lopA]
		 ItemLev = GetObjItemInt(whichItem, "Level")--获取等级
		if SubString(GetObjItemStr(whichItem, "class"), 0, 6) == "灵装" then

			--! textmacro BagBarFenJLz takes R0,R1,R2
			if FenJie[$R0$] == 1 and ItemLev >= $R1$ and ItemLev <= $R2$ then
				 gold = gold + LoadInteger(LzTable_Hash, 1, ItemLev)
				 num[$R0$] = num[$R0$] + LoadInteger(LzTable_Hash, 2, ItemLev)
				 DzSyncData("RemoveItem", I2S(GetHandleId(whichItem)) )--删除物品同步
				 Bag1_BarItem[lopA] = nil--置空
			end
			--! endtextmacro

			--! runtextmacro BagBarFenJLz("1","1","15")--普通
			--! runtextmacro BagBarFenJLz("2","20","35")--稀有
			--! runtextmacro BagBarFenJLz("3","40","55")--完美
			--! runtextmacro BagBarFenJLz("4","60","75")--史诗
			--! runtextmacro BagBarFenJLz("5","80","95")--传说
			--! runtextmacro BagBarFenJLz("6","100","100")--神话
		end

		 lopA = lopA + 1
	endloop
	--金币结算
	 DzSyncData("AddGold", I2S(gold) )
	 Debug("gold:" + I2S(gold))
	--材料结算
	--! textmacro BagBarFenJLzCaiL takes R0,R1
	if num[$R0$] ~= 0 then
		 DzSyncData("CreateItem", I2S($R1$) )--创建物品
		 DzSyncData("SetItemCharges", I2S(num[$R0$]) )--设置使用次数
	end
	--! endtextmacro

	--! runtextmacro BagBarFenJLzCaiL("1","'I101'")--普通灵魄
	--! runtextmacro BagBarFenJLzCaiL("2","'I102'")--稀有灵魄
	--! runtextmacro BagBarFenJLzCaiL("3","'I103'")--完美灵魄
	--! runtextmacro BagBarFenJLzCaiL("4","'I104'")--史诗灵魄
	--! runtextmacro BagBarFenJLzCaiL("5","'I105'")--传说灵魄
	--! runtextmacro BagBarFenJLzCaiL("6","'I106'")--神话灵魄

	 lopA = 1
	loop
	exitwhen lopA > 6
		 Debug(I2S(lopA)+ ":" + I2S(num[lopA]))
		 lopA = lopA + 1
	endloop

	 whichItem = nil
end
--一键分解选择的品质：动作
 function BagButtonA1_Actions()
	--灵装
	if FenJie[8] == 1 then
		 BagButtonA1_Actions_1( )
	end
	--材料
	if FenJie[7] == 1 then
		 BagButtonA1_Actions_2( )
	end
end
--分解选择的品质物品:条件
 function BagButtonA1_Conditions()
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
		if FenJie[7] == -1 and FenJie[8] == -1 then
			 DisplayTimedTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, 10, "请至少选择一种分解类型！")
		else
			if FenJie[1] == -1 and FenJie[2] == -1 and FenJie[3] == -1 and FenJie[4] == -1 and FenJie[5] == -1 and FenJie[6] == -1 then
				 DisplayTimedTextToPlayer(DzGetTriggerKeyPlayer(), 0, 0, 10, "请至少选择一种分解品质！")
			else
				 BagButtonA1_Actions()
			end
		end
	end
end
--选择记录 普通-神话-材料-灵装
 function BagCheckboxN_Actions()
	local integer num
	if DzGetTriggerKeyPlayer() == GetLocalPlayer() and DzGetMouseFocus() ~= 0 then
		 num = S2I(SubString(DzFrameGetName(DzGetMouseFocus()), 11, 12))
		 FenJie[num] = FenJie[num] * -1
	end
end
--一键分解
 function Init_Actions_A()
	--设置按钮触发
	 DzFrameSetScriptByCode(DzFrameFindByName("BagButtonA", 0), 1, function BagButtonA_Actions, false)--一键分解
	 DzFrameSetScriptByCode(DzFrameFindByName("BagButtonB1", 0), 1, function BagButtonB1_Actions, false)--取消
	 DzFrameSetEnable(DzFrameFindByName("BagButtonB1", 0), false)--取消按钮禁用
	 DzFrameSetScriptByCode(DzFrameFindByName("BagButtonA1", 0), 1, function BagButtonA1_Conditions, false)--确定分解
	 lopA = 1
	loop
	exitwhen lopA > 8
		 FenJie[lopA] = -1
		 lopA = lopA + 1
	endloop
	 DzFrameSetScriptByCode(DzFrameFindByName("BagCheckbox1", 0), 4, function BagCheckboxN_Actions, false)--普通
	 DzFrameSetScriptByCode(DzFrameFindByName("BagCheckbox2", 0), 4, function BagCheckboxN_Actions, false)--稀有
	 DzFrameSetScriptByCode(DzFrameFindByName("BagCheckbox3", 0), 4, function BagCheckboxN_Actions, false)--完美
	 DzFrameSetScriptByCode(DzFrameFindByName("BagCheckbox4", 0), 4, function BagCheckboxN_Actions, false)--史诗
	 DzFrameSetScriptByCode(DzFrameFindByName("BagCheckbox5", 0), 4, function BagCheckboxN_Actions, false)--传说
	 DzFrameSetScriptByCode(DzFrameFindByName("BagCheckbox6", 0), 4, function BagCheckboxN_Actions, false)--神话
	 DzFrameSetScriptByCode(DzFrameFindByName("BagCheckbox7", 0), 4, function BagCheckboxN_Actions, false)--材料
	 DzFrameSetScriptByCode(DzFrameFindByName("BagCheckbox8", 0), 4, function BagCheckboxN_Actions, false)--灵装
end
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
 function Init_Actions()
	 Init_Actions_A( )--一键分解
	 Init_Actions_B( )--一键整理

	 DestroyTrigger(GetTriggeringTrigger() )--删除一次性触发
end

 function Init()
	 RegTimerEvent(0.00, false, function Init_Actions)
end
