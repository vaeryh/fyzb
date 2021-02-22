local mt = {}
zb = mt
-- setmetatable(mt, oIt)
mt.__index = mt

-- 等级
mt.level = 0

-- 类别
mt.class = "装备"

-- 持有者(英雄)
mt.holder = 0

-- 所属玩家
mt.owner = Player(15)

-- 装备持有限制
function mt.Init_B()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()

        if mt:isItemClass(item, "装备") then

            -- 持有等级限制
            local ItemLevel = gSlk.getItemInt(item, "Level")
            if gH.getLevel(hero) < (ItemLevel - 1) * 10 then
                local text = "您的英雄等级还不足以穿戴" .. GetItemName(item)
                gP.disTimedText(gU.getOwner(hero), 15.00, text)
                gIt.drop(hero, item)
                return
            end

            -- 持有数量限制
            local class = gSlk.getItemString(item, "class")
            local classnum = gIt.getSameClassNum(hero, class)
            if classnum > 1 then
                gP.disTimedText(gU.getOwner(hero), 15.00, class .. "只能携带一件")
                gIt.drop(hero, item)
                return
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
function mt.adjustUnitPro_Action(hero, item, sign)
    local hero_pro = require 'map.hero.hero_pro'
    --
    local heroT = hero_pro.getHeroProTable(hero)
    local itemT = mt:inherit(item)
    --
    for k, v in pairs(itemT) do
        hero_pro.takeEffect_Action(hero, k, sign * v.value)
        heroT[k] = heroT[k] + sign * v.value
        print(k, sign * v.value)
    end
end

-- 增减属性
function mt.Init_A()
    -- 增加属性
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        if mt:isItemClass(item, "装备") then
            mt.adjustUnitPro_Action(hero, item, 1)
        end
    end)
    -- 减少属性
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.DROP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        if mt:isItemClass(item, "装备") then
            mt.adjustUnitPro_Action(hero, item, -1)
        end
    end)
end

-- 创建UI待用
function mt.FrameInit()
    -- 背包背景
    mt.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.2, 0.5):setSize(0.186, 0.326)
    oUI:setShow(false)
    -- 标题
    mt.title = oUI:createByTag("TEXT", mt.mainBack, "ProTextTemplate")
    -- gDz.FrameSetSize(mt.title, 0.06, 0.01)
    gDz.FrameSetText(mt.title, "|cff31e40d英雄属性")
    gDz.FrameSetPoint(mt.title, 1, mt.mainBack, 1, 0.00, -0.01)
    -- 第一列
    mt.showText1 = oUI:createByTag("TEXT", mt.mainBack, "ProText")
    gDz.FrameSetSize(mt.showText1, 0.09, 0.32)
    gDz.FrameSetText(mt.showText1, "防御+10")
    gDz.FrameSetPoint(mt.showText1, 0, mt.mainBack, 0, 0.01, -0.03)
    -- 第二列
    mt.showText2 = oUI:createByTag("TEXT", mt.mainBack, "ProText")
    gDz.FrameSetSize(mt.showText2, 0.09, 0.32)
    gDz.FrameSetText(mt.showText2, "防御+10")
    gDz.FrameSetPoint(mt.showText2, 0, mt.showText1, 2, 0.0, 0.0)
    -- Tab
    gDz.TriggerRegisterKeyEvent(9, 0, true, function()
        if gTrg.getExecCount() % 2 == 1 then
            gDz.FrameShow(mt.mainBack, true)
            mt.showPro()
        else
            gDz.FrameShow(mt.mainBack, false)
        end
    end)
end

-- 继承：哪里用就继承谁
function mt:inherit(item)
    if not mt[item] then
        mt[item] = {}
        setmetatable(mt[item], mt)
    end
    return mt[item]
end

-- 搜索父类是否存在
function mt:isHaveFather(class)
    local father = getmetatable(self)
    while father do
        if father.class == class then
            return true
        end
        father = getmetatable(father)
    end
    return false
end

-- 打印类别和父类
function mt:printParentClass()
    local text = {}
    text[1] = self.class
    local father = getmetatable(self)
    while father do
        table.insert(text, father.class)
        father = getmetatable(father)
    end
    local str = ""
    for i = #text, 1, -1 do
        str = str .. string.format("%s ", text[i])
    end
    print(str)
end

-- 初始化
function mt.Init()
    -- 打印
    mt:printParentClass()
    --
    mt.Init_A() -- 增减装备属性
    mt.Init_B()
end

mt.Init()

return mt
