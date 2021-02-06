--***************************************************************************************************************************
--* 背包同步系统
--******************************************************************
local mt={}
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--增加金币同步
 function AddGold_Actions()
	local N = S2I(DzGetTriggerSyncData() )--获取被同步的信息
	-- Debug( "增加金币同步："+ DzGetTriggerSyncData() )

	 AdjustPlayerStateBJ(N, DzGetTriggerSyncPlayer(), PLAYER_STATE_RESOURCE_GOLD)--增加金币
end
---------------------------------------------------------------------------------------
--玩家类
 function Init_B_Actiosn()
	 RegDzTBEvent("AddGold",  AddGold_Actions)--增加金币同步
end
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--使用物品同步
 function UseItem_Actions()
	local  pid = GetPlayerId(DzGetTriggerSyncPlayer())
	local  whichItem = LoadItemHandle(Bag1_Hash, S2I(DzGetTriggerSyncData() ), 0)
	-- Debug( "使用物品同步："+ DzGetTriggerSyncData()+"物品名称"+GetItemName(whichItem) )

	 UnitUseItem(Hero[pid], whichItem)--使用物品

	 whichItem = nil
end
--给予物品同步
 function GiveItem_Actions()
	local  pid = GetPlayerId(DzGetTriggerSyncPlayer())
	local  whichItem = LoadItemHandle(Bag1_Hash, S2I(DzGetTriggerSyncData() ), 0)
	-- Debug( "给予物品同步："+ DzGetTriggerSyncData()+"物品名称"+GetItemName(whichItem) )
	if UnitInventoryCount(Hero[pid]) == 6 then
		 Bag1_Pick_Enter_Actions(whichItem)--丢入背包
	else
		 UnitAddItem(Hero[pid], whichItem)--给予物品
	end
end
--创建物品同步
 function CreateItem_Actions()
	local  pid = GetPlayerId(DzGetTriggerSyncPlayer())
	local  N = S2I(DzGetTriggerSyncData() )--获取被同步的信息
	-- Debug( "创建物品同步："+ DzGetTriggerSyncData() )
	 SyncItem[pid] = CreateItem(YDWEI2ItemId(N), 0, 0)
	 SaveItemHandle(Bag1_Hash, GetHandleId(SyncItem[pid]), 0, SyncItem[pid])--保存该物品到Hash表
end
--删除物品同步
 function RemoveItem_Actions()
	local item whichItem = LoadItemHandle(Bag1_Hash, S2I(DzGetTriggerSyncData() ), 0)
	--删除物品
	 RemoveItem(whichItem)
end
--丢弃物品同步
 function DropItem_Actions()
	local  pid = GetPlayerId(DzGetTriggerSyncPlayer())
	local  whichItem = LoadItemHandle(Bag1_Hash, S2I(DzGetTriggerSyncData() ), 0)
	--丢弃方式1：设置丢弃物品位置
	 SetItemPosition(whichItem, GetUnitX(Hero[pid])+ 80, GetUnitY(Hero[pid])+ 80)
end
--设置物品同步
 function SetItem_Actions()
	local  pid = GetPlayerId(DzGetTriggerSyncPlayer())
	local  whichItem = LoadItemHandle(Bag1_Hash, S2I(DzGetTriggerSyncData() ), 0)
	-- Debug( "设置物品同步："+ DzGetTriggerSyncData()+"物品名称"+GetItemName(whichItem) )
	--设置
	 SyncItem[pid] = whichItem
end
--设置物品使用次数同步
 function SetItemCharges_Actions()
	local  pid = GetPlayerId(DzGetTriggerSyncPlayer())
	local  N = S2I(DzGetTriggerSyncData() )--获取被同步的信息
	-- Debug( "设置物品使用次数同步："+ DzGetTriggerSyncData() )
	--设置物品使用次数同步
	 SetItemCharges(SyncItem[pid], N)
	 Bag1_Pick_Enter_Actions(SyncItem[pid])--丢入背包
end
----------------------------------------------------------------------------------
--物品类
 function Init_A_Actiosn()
	 RegDzTBEvent("DropItem",  DropItem_Actions)--丢弃物品同步
	 RegDzTBEvent("RemoveItem",  RemoveItem_Actions)--删除物品同步
	 RegDzTBEvent("CreateItem",  CreateItem_Actions)--创建物品同步
	 RegDzTBEvent("UseItem",  UseItem_Actions)--使用物品同步
	 RegDzTBEvent("GiveItem",  GiveItem_Actions)--给予物品同步
	 RegDzTBEvent("SetItem",  SetItem_Actions)--设置物品同步
	 RegDzTBEvent("SetItemCharges",  SetItemCharges_Actions)--设置物品使用次数同步
end

return mt
