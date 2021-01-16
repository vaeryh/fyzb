-- ***************************************************************************************************************************
-- * 背包的功能系统
-- * 一键整理
-- ******************************************************************
local FenJie = {}

-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 一键整理：二维降一维
local BagButtonB_Actions = function()
    -- local  pid = GetPlayerId(DzGetTriggerKeyPlayer())
    local b
    local N = 0
    local whichItem
    local Num
    local temp
    local tempItem

    for i = 1, 42 do
        N = N + 1
        whichItem[N] = Bag1_BarItem[i]
    end
    ----------------------------------------------------------------------------
    for i = 1, 10 do
        if whichItem[i] == nil then
            Num[i] = 999999
        else
            Num[i] = GetObjItemInt(whichItem[i], "prio") * 10000 + GetObjItemInt(whichItem[i], "Level") * 10 +
                         GetObjItemInt(whichItem[i], "oldLevel")
        end
    end

    -- 冒泡排序
    for a = 1, 42 do
        for b = 1, 42 - a do
            if Num[b] > Num[b + 1] then
                -- 数字调整
                temp = Num[b + 1]
                Num[b + 1] = Num[b] -- 冒泡排序，值越大排在越后面
                -- 冒泡排序，值越大排在越后面
                -- 冒泡排序，值越大排在越后面
                Num[b] = temp
                -- 物品顺序调换
                tempItem = whichItem[b + 1]
                whichItem[b + 1] = whichItem[b]
                whichItem[b] = tempItem
            end
        end
    end
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
end

local BagButtonB_Conditions = function()
    if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
        BagButtonB_Actions()
    end
end
-- 一键整理
local Init_A_Actions = function()
    -- DzFrameSetScriptByCode( DzFrameFindByName("BagButtonB", 0), 1, function BagButtonB_Conditions, false )--设置按钮触发
end

