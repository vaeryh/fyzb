local mt = {}

-- 判断物品类别
function mt.IsItemClass(whichItem, name)
    local class = gSlk.getItemString(whichItem, "class")
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
function mt.StepThree(whichUnit, proName, numR)
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
function mt.StepTwo(sign, whichUnit, whichItem)
    local pro = require 'equip.pro'
    local it = pro:getTab(whichItem)
    for i = 1, 50 do
        if it[i] then
            local proName = it.name
            local numR = it.vaule * sign
            print("DP：" + proName + R2S(numR))
            mt.StepThree(whichUnit, proName, numR)
        end
    end
end
-- 装备类才有属性
function mt.StepOne(sign, whichUnit, whichItem)
    if mt.IsItemClass(whichItem, "武器") then
        mt.StepTwo(sign, whichUnit, whichItem)
    elseif mt.IsItemClass(whichItem, "防具") then
        mt.StepTwo(sign, whichUnit, whichItem)
    elseif mt.IsItemClass(whichItem, "饰品") then
        mt.StepTwo(sign, whichUnit, whichItem)
    elseif mt.IsItemClass(whichItem, "鞋子") then
        mt.StepTwo(sign, whichUnit, whichItem)
    end
end
-- 动作：用户单位拾取装备
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
    if gU.isType(GetTriggerUnit(), UNIT_TYPE.HERO) then
        mt.StepOne(1, GetTriggerUnit(), GetManipulatedItem())
    end
end)
-- 动作：用户单位丢弃装备
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.DROP_ITEM, function()
    if gU.isType(GetTriggerUnit(), UNIT_TYPE.HERO) then
        mt.StepOne(-1, GetTriggerUnit(), GetManipulatedItem())
    end
end)
-- 动作：单位贩卖装备
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELL_ITEM, function()
    if gU.isType(GetTriggerUnit(), UNIT_TYPE.HERO) then
        mt.StepOne(-1, GetSellingUnit(), GetSoldItem())
    end
    gT.wait(5.00, function()
        print(GetItemName(GetSoldItem()) + "即将被清除Equip_Hash!")
    end)
end)

return mt
