local mt = {}
setmetatable(mt, oIt)
mt.__index = mt

-- 等级
mt.level = 0

-- 类别
mt.class = "装备"

-- 获取属性颜色
mt.color = {'|cFFFFFFFF', '|cFFFFFF00', '|cFFF1A4E0', '|cFFFF0000'}

-- 黄属性
mt.yellowPro = {{'招式', 100, 300}, {'身法', 100, 300}, {'心法', 100, 300}}

-- 红属性
mt.redPro = {{'风相性', 1, 9}, {'云相性', 1, 9}, {'火相性', 1, 9}, {'地相性', 1, 9}, {'雷相性', 1, 9},
             {'全属性', 1, 9}}

-- 持有者(英雄)
mt.holder = 0

-- 所属玩家
mt.owner = Player(15)

-- 数量是否超限
function mt.holdlimit_PickNum()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        local class = gSlk.getItemString(item, "class")
        local classnum = gIt.getSameClassNum(hero, class)

        if mt:isItemClass(item, mt.class) and classnum > 1 then
            -- print('数量', classnum, mt.class, mt:inherit(item).class)
            local text = class .. "只能携带一件"
            gP.disTimedText(gU.getOwner(hero), 15.00, text)
            gIt.drop(hero, item)
        end
    end)
end

-- 持有等级限制 英雄等级>=物品等级
function mt.holdlimit_HeroLevel()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        if mt:isItemClass(item, mt.class) then
            local ItemLevel = gSlk.getItemInt(item, "Level")

            if gH.getLevel(hero) < (ItemLevel - 1) * 10 then
                -- print('持有等级限制', (ItemLevel - 1) * 10, gH.getLevel(hero))
                local text = "您的英雄等级还不足以穿戴" .. GetItemName(item)
                gP.disTimedText(gU.getOwner(hero), 15.00, text)
                gIt.drop(hero, item)
            end
        end
    end)
end

-- 判断物品类别
function mt:isItemClass(item, name)
    local class = gSlk.getItemString(item, "class")
    if name == "武器" then
        local wq = {"枪", "扇", "弓", "刀", "剑", "机关"}
        for k, v in ipairs(wq) do
            if v == class then
                return true
            end
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
    elseif name == "装备" then
        local equip = {"枪", "扇", "弓", "刀", "剑", "机关", "防具", "鞋子", "手镯", "项链", "玉佩"}
        for k, v in pairs(equip) do
            if v == class then
                return true
            end
        end
    end
    return false
end

-- 计算属性
function mt:adjustUnitPro_Action(hero, proName, value)
    print(proName, value)
    -- 基础
    if proName == "外功" then
        gUnitdata.adjustPro("攻击值", hero, value)
    elseif proName == "护甲" then
        gUnitdata.adjustPro("护甲值", hero, value)
    end
    -- 速度类
    if proName == "出招速度" then
        gUnitdata.adjustPro("攻击速度", hero, value)
    elseif proName == "出招间隔" then
        gUnitdata.adjustPro("攻击间隔", hero, value)
    elseif proName == "移动速度" then
        gUnitdata.adjustPro("移动速度", hero, value)
    end
    -- 恢复类
    if proName == "气血" then
        gUnitdata.adjustPro("生命值", hero, value)
    elseif proName == "气血恢复" then
        gUnitdata.adjustPro("生命值回复", hero, value)
    elseif proName == "内力" then
        gUnitdata.adjustPro("魔法值", hero, value)
    elseif proName == "内力恢复" then
        gUnitdata.adjustPro("魔法值回复", hero, value)
    end
    -- 英雄属性
    if proName == "招式" then
        gUnitdata.adjustStr("力量", hero, value)
    elseif proName == "身法" then
        gUnitdata.adjustAgi("敏捷", hero, value)
    elseif proName == "心法" then
        gUnitdata.adjustInt("智力", hero, value)
    elseif proName == "全属性" then
        gUnitdata.adjustStr("力量", hero, value)
        gUnitdata.adjustAgi("敏捷", hero, value)
        gUnitdata.adjustInt("智力", hero, value)
    end
    -- 相性
    local str = gH.getStr(hero)
    local agi = gH.getAgi(hero)
    local int = gH.getInt(hero)
    local main = gH.getMain(hero)
    if proName == "风相性" then -- 风相性：提升风相性*身法* 0.002%的出招速度，风相性*身法* 0.005的移动速度。
        gUnitdata.adjustPro("攻击速度", hero, value * agi * 0.002)
        gUnitdata.adjustPro("移动速度", hero, value * agi * 0.005)
    elseif proName == "云相性" then -- 云相性：提升云相性*招式* 0.5的气血和云相性*招式* 0.01 /秒的气血恢复；
        gUnitdata.adjustPro("生命值", hero, value * str * 0.5)
        gUnitdata.adjustPro("生命值再生", hero, value * str * 0.002)
    elseif proName == "火相性" then -- 火相性：提升火相性*主属性*0.02的外功；
        gUnitdata.adjustPro("攻击值", hero, value * main * 0.002)
    elseif proName == "地相性" then -- 地相性：提升地相性*身法* 0.005的防御和伤害减免；
        local num = agi * value * 0.005
        gUnitdata.adjustPro("护甲值", hero, value * main * 0.002)
        -- 未做
    elseif proName == "雷相性" then -- 雷相性：提升雷相性*主属性*0.02的内功和雷相性*主属性*0.1的内力；
        local num = value * main * 0.1
        -- 未做
        gUnitdata.adjustPro("魔法值", hero, value * main * 0.02)
    end
end

-- 增减属性
function mt:adjustUnitPro_Trg()
    -- 增加属性
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        if mt:isItemClass(item, "装备") then
            local tab = oIt:inherit(item)
            gYh.pairs(tab)
            -- for k, v in pairs(tab) do
            --     mt:takeEffect_Action(hero, k, v)
            -- end
        end
    end)
    -- 减少属性
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.DROP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        if mt:isItemClass(item, "装备") then
            -- local tab = oIt:inherit(item)
            -- for k, v in pairs(tab) do
            --     mt:takeEffect_Action(hero, k, -v)
            -- end
        end
    end)
end
-- 自身初始化
function mt.selfInit()
    -- 打印
    mt:printParentClass()
    --
    mt.holdlimit_HeroLevel()
    mt.holdlimit_PickNum()
    mt:adjustUnitPro_Trg()
end

return mt
