local mt = {}

-- 判断物品类别
function IsItemClass(whichItem, name)
    local class = GetObjItemStr(whichItem, "class")
    if name == "武器" then
        if class == "枪" or class == "扇" or class == "弓" or class == "刀" or class == "剑" or class == "机关" then
            return true
        end
    elseif name == "防具" then
        if class == "防具" then
            return true
        end
    elseif name == "鞋子" then
        if class == "鞋子" then
            return true
        end
    elseif name == "饰品" then
        if class == "手镯" or class == "项链" or class == "玉佩" then
            return true
        end
    end
    return false
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 计算属性
function StepThree_Actions(whichUnit, proName, numR)
    local numReal
    -- 基础
    if proName == "外功" then
        UnitData_Change("攻击力", whichUnit, numR)
    elseif proName == "护甲" then
        UnitData_Change("护甲", whichUnit, numR)
    end
    -- 速度类
    if proName == "出招速度" then
        UnitData_Change("攻击速度", whichUnit, numR)
    elseif proName == "出招间隔" then
        UnitData_Change("攻击间隔", whichUnit, numR)
    elseif proName == "移动速度" then
        UnitData_Change("移动速度", whichUnit, numR)
    end
    -- 恢复类
    if proName == "气血" then
        UnitData_Change("生命值", whichUnit, numR)
    elseif proName == "气血恢复" then
        UnitData_Change("生命值回复", whichUnit, numR)
    elseif proName == "内力" then
        UnitData_Change("魔法值", whichUnit, numR)
    elseif proName == "内力恢复" then
        UnitData_Change("魔法值回复", whichUnit, numR)
    end
    -- 英雄属性
    if proName == "招式" then
        UnitData_Change("力量", whichUnit, numR)
    elseif proName == "身法" then
        UnitData_Change("敏捷", whichUnit, numR)
    elseif proName == "心法" then
        UnitData_Change("智力", whichUnit, numR)
    elseif proName == "全属性" then
        UnitData_Change("全属性", whichUnit, numR)
    end
    -- 相性
    if proName == "风相性" then -- 风相性：提升风相性*身法* 0.002%的出招速度，风相性*身法* 0.005的移动速度。
        numReal = GetHeroAgi(whichUnit, true)
        UnitData_Change("攻击速度", whichUnit, numR * numReal * 0.002)
        UnitData_Change("移动速度", whichUnit, numR * numReal * 0.005)
    elseif proName == "云相性" then -- 云相性：提升云相性*招式* 0.5的气血和云相性*招式* 0.01 /秒的气血恢复；
        numReal = GetHeroStr(whichUnit, true)
        UnitData_Change("生命值", whichUnit, numR * numReal * 0.5)
        UnitData_Change("生命值回复", whichUnit, numR * numReal * 0.002)
    elseif proName == "火相性" then -- 火相性：提升火相性*主属性*0.02的外功；
        numReal = HeroPrimary(whichUnit)
        UnitData_Change("攻击力", whichUnit, numR * numReal * 0.002)
    elseif proName == "地相性" then -- 地相性：提升地相性*身法* 0.005的防御和伤害减免；
        numReal = GetHeroAgi(whichUnit, true) * numR * 0.005
        SaveReal(Equip_Hash, GetHandleId(whichUnit), StringHash("护甲"),
            LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash("护甲")) + numReal)
        SaveReal(Equip_Hash, GetHandleId(whichUnit), StringHash("减伤率"),
            LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash("减伤率")) + numReal)
    elseif proName == "雷相性" then -- 雷相性：提升雷相性*主属性*0.02的内功和雷相性*主属性*0.1的内力；
        numReal = HeroPrimary(whichUnit)
        SaveReal(Equip_Hash, GetHandleId(whichUnit), StringHash("内功"),
            LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash("内功")) + numR * numReal * 0.1)
        UnitData_Change("魔法值", whichUnit, numR * numReal * 0.02)
    end

end
-- 整合相同数据
function StepTwo_Actions(sign, whichUnit, whichItem)
    local A
    local numR
    local proName
    for i = 1, 50 do
        if LoadBoolean(Equip_Hash, GetHandleId(whichItem), A) == true then
            proName = LoadStr(Equip_Hash, GetHandleId(whichItem), A + 51)
            numR = LoadReal(Equip_Hash, GetHandleId(whichItem), A) * sign
            print("DP：" + proName + R2S(numR))
            -- 附加到单位身上
            SaveReal(Equip_Hash, GetHandleId(whichUnit), StringHash(proName),
                LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash(proName)) + numR)
            StepThree_Actions(whichUnit, proName, numR)
        end
    end
end
-- 装备类才有属性
function StepOne_Actions(sign, whichUnit, whichItem)
    if DP_IsItemClass(whichItem, "武器") then
        StepTwo_Actions(sign, whichUnit, whichItem)
    elseif DP_IsItemClass(whichItem, "防具") then
        StepTwo_Actions(sign, whichUnit, whichItem)
    elseif DP_IsItemClass(whichItem, "饰品") then
        StepTwo_Actions(sign, whichUnit, whichItem)
    elseif DP_IsItemClass(whichItem, "鞋子") then
        StepTwo_Actions(sign, whichUnit, whichItem)
    end
end
-- 动作：用户单位拾取装备
function Pick_Actions()
    StepOne_Actions(1, GetTriggerUnit(), GetManipulatedItem())
end
-- 动作：用户单位丢弃装备
function Drop_Actions()
    StepOne_Actions(-1, GetTriggerUnit(), GetManipulatedItem())
end
-- 动作：单位贩卖装备
-- 计时器函数
function Sell_Timer()
    local whichItem = LoadItemHandle(Hash_TY, GetHandleId(GetExpiredTimer()), 0)
    print(GetItemName(whichItem) + "即将被清除Equip_Hash!")
    FlushChildHashtable(Equip_Hash, GetHandleId(whichItem))
    FlushChildHashtable(Hash_TY, GetHandleId(GetExpiredTimer()))
    DestroyTimer(GetExpiredTimer())
end

function Sell_Actions()
    StepOne_Actions(-1, GetSellingUnit(), GetSoldItem())
    YhTimerStart(5.00, false, Sell_Timer)
    SaveItemHandle(Hash_TY, GetHandleId(bj_lastStartedTimer), 0, GetSoldItem())
end
-- 条件：触发单位类型=英雄
function PickDrop_Conditions()
    return IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true
end
-- 触发：用户玩家事件
function Init_Actions_A()
    RegUserPlayerUnitEvent(Condition(PickDrop_Conditions), Pick_Actions, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    RegUserPlayerUnitEvent(Condition(PickDrop_Conditions), Drop_Actions, EVENT_PLAYER_UNIT_DROP_ITEM)
    RegAnyPlayerUnitEvent(Condition(PickDrop_Conditions), Sell_Actions, EVENT_PLAYER_UNIT_PAWN_ITEM) -- 贩卖物品
end
