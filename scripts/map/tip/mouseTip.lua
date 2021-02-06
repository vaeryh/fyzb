local mt ={}

function mt.Enter_Actions()
	local  id = GetHandleId(UI_Item)
	local  n = 0

	DzFrameSetText(DzFrameFindByName("MouseTipsTextA0", 0), GetItemName(UI_Item) )
	DzFrameSetText(DzFrameFindByName("MouseTipsTextA1", 0), GetObjItemStr(UI_Item, "Level")+"阶" )

    for i = 1, 50 do
        if LoadBoolean(Equip_Hash, id, lopB) == true then
			n = n + 1
			DzFrameSetText(DzFrameFindByName("MouseTipsTextB" + I2S(n), 0), LoadStr(Equip_Hash, id, i) )
		end
    end

	--描述
	DzFrameSetText(DzFrameFindByName("MouseTipsTextC1", 0), GetObjItemStr(UI_Item, "Ubertip") )

	DzFrameShow(DzFrameFindByName("MouseTipsBackdrop", 0), true)
end
--条件
function mt.Enter_Conditions_A(class)

	if DP_IsItemClass(UI_Item, "武器") then
		mt.Enter_Actions()
	end

	if class == "防具" or class == "鞋子" then
		mt.Enter_Actions()
	end

	if DP_IsItemClass(UI_Item, "饰品") then
		mt.Enter_Actions()
	end

	if class == "Task" then
		mt.Enter_Actions()
	end

	mt.Enter_Actions()
end
--本地化
function mt.Enter_Conditions()
	if GetLocalPlayer() == GetLocalPlayer() then
		Enter_Conditions_A(GetObjItemStr(UI_Item, "class") )
	end
end
--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
function mt.Leave_Actions()
	DzFrameShow(DzFrameFindByName("MouseTipsBackdrop", 0), false)

	DzFrameSetText(DzFrameFindByName("MouseTipsTextA0", 0), "")
    DzFrameSetText(DzFrameFindByName("MouseTipsTextA1", 0), "")
    for i = 1, 6 do
        DzFrameSetText(DzFrameFindByName("MouseTipsTextB" + I2S(i), 0), "")
    end
end

function mt.Leave_Conditions ()
	if GetLocalPlayer() == GetLocalPlayer() then
		Leave_Actions()
	end
end

function mt.Init_Actions()
	DzCreateFrame("MouseTipsFrame", DzGetGameUI(), 0)
	DzFrameShow(DzFrameFindByName("MouseTipsBackdrop", 0), false)

	DzFrameSetPoint(DzFrameFindByName("MouseTipsBackdrop", 0), 8, DzFrameFindByName("BagBackdrop", 0), 6, -0.002, 0.00)

	TriggerAddAction(UI_Enter,  mt.Enter_Conditions)
	TriggerAddAction(UI_Leave,  mt.Leave_Conditions)
end

return mt
