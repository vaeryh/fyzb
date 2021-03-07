-- ***************************************************************************************************************************
-- * 背包的功能系统
-- * 一键分解
-- * 一键整理
-- ******************************************************************
local mt = {}
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 一键整理：二维降一维
function BagButtonB_Actions()
    local N = 0
    local whichItem
    local Num
    local temp
    local tempItem
    local lopA = 1

    for i = 1, 42 do
        N = N + 1
        whichItem[N] = Bag1_BarItem[lopA]
    end
    ----------------------------------------------------------------------------

    for i = 1, 42 do
        if whichItem[lopA] == nil then
            Num[lopA] = 999999
        else
            Num[lopA] = GetObjItemInt(whichItem[lopA], "prio") * 10000 + GetObjItemInt(whichItem[lopA], "Level") * 10 +
                            GetObjItemInt(whichItem[lopA], "oldLevel")
        end
    end
    -- 冒泡排序
    for i = 1, 42 do
        for j = 1, 42 - i do
            if Num[j] > Num[j + 1] then
                -- 数字调整
                temp = Num[j + 1]
                Num[j + 1] = Num[j] -- 冒泡排序，值越大排在越后面
                -- 冒泡排序，值越大排在越后面
                -- 冒泡排序，值越大排在越后面
                Num[j] = temp
                -- 物品顺序调换
                tempItem = whichItem[j + 1]
                whichItem[j + 1] = whichItem[j]
                whichItem[j] = tempItem
            end
        end
    end
    ----------------------------------------------------------------------------
    for i = 1, N do
        Bag1_BarItem[lopA] = whichItem[lopA]
    end
    ----------------------------------------------------------------------------
end

function BagButtonB_Conditions()
    if gDz.GetTriggerKeyPlayer() == GetLocalPlayer() then
        BagButtonB_Actions()
    end
end
-- 一键整理
function Init_Actions_B()
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagButtonB", 0), 1, BagButtonB_Conditions, false) -- 设置按钮触发
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 开启一键分解
function BagButtonA_Actions()
    if gDz.GetTriggerKeyPlayer() == GetLocalPlayer() then
        if gDz.FrameGetEnable(gDz.FrameFindByName("BagButtonB1", 0)) == false then
            gDz.FrameSetEnable(gDz.FrameFindByName("BagButtonB1", 0), true)
            gDz.FrameShow(gDz.FrameFindByName("BagBackdropA", 0), true)
        else
            gDz.FrameSetEnable(gDz.FrameFindByName("BagButtonB1", 0), false)
            gDz.FrameShow(gDz.FrameFindByName("BagBackdropA", 0), false)
        end
    end
end
-- 关闭一键分解
function BagButtonB1_Actions()
    if gDz.GetTriggerKeyPlayer() == GetLocalPlayer() then
        gDz.FrameShow(gDz.FrameFindByName("BagBackdropA", 0), false)
        gDz.FrameSetEnable(gDz.FrameFindByName("BagButtonB1", 0), false) -- 配合一键整理可以单独开关
    end
end
---------------------------------------------------------------------------------------
function BagBarFenJCl(R0, R1, R2)
    if FenJie[R0] == 1 and ItemLev >= R1 and ItemLev <= R2 then
        gold = gold + GetItemCharges(whichItem) * GetObjItemInt(whichItem, "goldcost")
        gDz.SyncData("RemoveItem", I2S(GetHandleId(whichItem))) -- 删除物品同步
        Bag1_BarItem[lopA] = nil -- 置空
    end
end
-- 一键分解:材料
function BagButtonA1_Actions_2()
    local whichItem
    local ItemLev
    local lopA
    local gold = 0
    for i = 1, 42 do
        whichItem = Bag1_BarItem[lopA]
        ItemLev = GetObjItemInt(whichItem, "Level") -- 获取等级

        if GetObjItemStr(whichItem, "class") == "材料" then
            -- ! runtextmacro BagBarFenJCl("1","1","4")--普通
            -- ! runtextmacro BagBarFenJCl("2","5","8")--稀有
            -- ! runtextmacro BagBarFenJCl("3","9","12")--完美
            -- ! runtextmacro BagBarFenJCl("4","13","16")--史诗
            -- ! runtextmacro BagBarFenJCl("5","17","19")--传说
            -- ! runtextmacro BagBarFenJCl("6","20","20")--神话
        end
    end
    -- 结算金币
    gDz.SyncData("AddGold", I2S(gold))
end
---------------------------------------------------------------------------------------
-- 一键分解:灵装
function BagButtonA1_Actions_1()
    local whichItem
    local ItemLev
    local lopA
    local num
    local gold = 0

    for i = 1, 42 do
        whichItem = Bag1_BarItem[lopA]
        ItemLev = GetObjItemInt(whichItem, "Level") -- 获取等级
        if SubString(GetObjItemStr(whichItem, "class"), 0, 6) == "灵装" then

            -- ! textmacro BagBarFenJLz takes R0,R1,R2
            --    if FenJie[$R0$] == 1 and ItemLev >= $R1$ and ItemLev <= $R2$ then
            -- 		gold = gold + LoadInteger(LzTable_Hash, 1, ItemLev)
            -- 		num[$R0$] = num[$R0$] + LoadInteger(LzTable_Hash, 2, ItemLev)
            -- 		gDz.SyncData("RemoveItem", I2S(GetHandleId(whichItem)) )--删除物品同步
            -- 		Bag1_BarItem[lopA] = nil--置空
            --    end
            -- ! endtextmacro

            -- ! runtextmacro BagBarFenJLz("1","1","15")--普通
            -- ! runtextmacro BagBarFenJLz("2","20","35")--稀有
            -- ! runtextmacro BagBarFenJLz("3","40","55")--完美
            -- ! runtextmacro BagBarFenJLz("4","60","75")--史诗
            -- ! runtextmacro BagBarFenJLz("5","80","95")--传说
            -- ! runtextmacro BagBarFenJLz("6","100","100")--神话
        end
    end
    -- 金币结算
    gDz.SyncData("AddGold", I2S(gold))
    Debug("gold:" + I2S(gold))
    -- 材料结算
    -- ! textmacro BagBarFenJLzCaiL takes R0,R1
    -- if num[$R0$] ~= 0 then
    -- 	 gDz.SyncData("CreateItem", I2S($R1$) )--创建物品
    -- 	 gDz.SyncData("SetItemCharges", I2S(num[$R0$]) )--设置使用次数
    -- end
    -- ! endtextmacro

    -- ! runtextmacro BagBarFenJLzCaiL("1","'I101'")--普通灵魄
    -- ! runtextmacro BagBarFenJLzCaiL("2","'I102'")--稀有灵魄
    -- ! runtextmacro BagBarFenJLzCaiL("3","'I103'")--完美灵魄
    -- ! runtextmacro BagBarFenJLzCaiL("4","'I104'")--史诗灵魄
    -- ! runtextmacro BagBarFenJLzCaiL("5","'I105'")--传说灵魄
    -- ! runtextmacro BagBarFenJLzCaiL("6","'I106'")--神话灵魄
end
-- 一键分解选择的品质：动作
function BagButtonA1_Actions()
    -- 灵装
    if FenJie[8] == 1 then
        BagButtonA1_Actions_1()
    end
    -- 材料
    if FenJie[7] == 1 then
        BagButtonA1_Actions_2()
    end
end
-- 分解选择的品质物品:条件
function BagButtonA1_Conditions()
    if gDz.GetTriggerKeyPlayer() == GetLocalPlayer() then
        if FenJie[7] == -1 and FenJie[8] == -1 then
            DisplayTimedTextToPlayer(gDz.GetTriggerKeyPlayer(), 0, 0, 10, "请至少选择一种分解类型！")
        else
            if FenJie[1] == -1 and FenJie[2] == -1 and FenJie[3] == -1 and FenJie[4] == -1 and FenJie[5] == -1 and
                FenJie[6] == -1 then
                DisplayTimedTextToPlayer(gDz.GetTriggerKeyPlayer(), 0, 0, 10, "请至少选择一种分解品质！")
            else
                BagButtonA1_Actions()
            end
        end
    end
end
-- 选择记录 普通-神话-材料-灵装
function BagCheckboxN_Actions()
    local num
    if gDz.GetTriggerKeyPlayer() == GetLocalPlayer() and gDz.GetMouseFocus() ~= 0 then
        num = S2I(SubString(gDz.FrameGetName(gDz.GetMouseFocus()), 11, 12))
        FenJie[num] = FenJie[num] * -1
    end
end
-- 一键分解
function Init_Actions_A()
    -- 设置按钮触发
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagButtonA", 0), 1, BagButtonA_Actions, false) -- 一键分解
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagButtonB1", 0), 1, BagButtonB1_Actions, false) -- 取消
    gDz.FrameSetEnable(gDz.FrameFindByName("BagButtonB1", 0), false) -- 取消按钮禁用
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagButtonA1", 0), 1, BagButtonA1_Conditions, false) -- 确定分解

    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagCheckbox1", 0), 4, BagCheckboxN_Actions, false) -- 普通
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagCheckbox2", 0), 4, BagCheckboxN_Actions, false) -- 稀有
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagCheckbox3", 0), 4, BagCheckboxN_Actions, false) -- 完美
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagCheckbox4", 0), 4, BagCheckboxN_Actions, false) -- 史诗
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagCheckbox5", 0), 4, BagCheckboxN_Actions, false) -- 传说
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagCheckbox6", 0), 4, BagCheckboxN_Actions, false) -- 神话
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagCheckbox7", 0), 4, BagCheckboxN_Actions, false) -- 材料
    gDz.FrameSetScriptByCode(gDz.FrameFindByName("BagCheckbox8", 0), 4, BagCheckboxN_Actions, false) -- 灵装
end

return mt
