local mt = {}

-- 玩家挑战区域
mt.rect = {
    [Player(0)] = Rect(4012, -6476, 5194, -6051),
    [Player(1)] = Rect(5407, -6491, 6635, -6061),
    [Player(2)] = Rect(5414, -7107, 6629, -6678),
    [Player(3)] = Rect(6801, -7128, 8036, -6671)
}

-- 挑战
function mt.Init_A()
    -- 记录被挑战
    local death = {}
    -- 记录被挑战单位
    local dr = {}
    -- 选择挑战单位
    gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELL_UNIT, function()
        local trgU, trgP = GetTriggerUnit(), gU.getOwner(GetBuyingUnit())
        if gU.isTypeId(trgU, 'tt11') or gU.isTypeId(trgU, 'tt22') or gU.isTypeId(trgU, 'tt33') or
            gU.isTypeId(trgU, 'tt44') then
            local x, y = gRect.getCenter(mt.rect[trgP])
            gU.setShow(GetSoldUnit(), false)
            -- 中立敌对所属
            gU.setOwner(GetSoldUnit(), Player(PLAYER_NEUTRAL_AGGRESSIVE), true)
            gU.setPosition(GetSoldUnit(), x, y)
            gU.setShow(GetSoldUnit(), true)
            gYh.MoveAndCamera(GetBuyingUnit(), x - 300, y)
            --保存
            death[GetSoldUnit()] = true
            dr[GetBuyingUnit()] = GetSoldUnit()
        end
    end)
    -- 目标单位死亡
    gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.DEATH, function()
        local deathU, trgP = GetTriggerUnit(), GetTriggerPlayer()
        -- 挑战期间英雄死亡，删除被挑战敌人
        if Hero[trgP] == deathU then
            gU.remove(dr[deathU])
            return
        end
        -- 处于指定单位组
        if not death[deathU] then
            return
        end
        local class
        -- 随机一种类别的武器
        if gSlk.getUnitString(deathU, "race") == "武器" then
            local tab = {"剑", "枪", "弓", "扇", "刀"}
            class = tab[GetRandomInt(1, 5)]
        elseif gSlk.getUnitString(deathU, "race") == "防具" then
            class = "防具"
        elseif gSlk.getUnitString(deathU, "race") == "饰品" then
            local tab = {"手链", "手镯", "玉佩"}
            class = tab[GetRandomInt(1, 3)]
        elseif gSlk.getUnitString(deathU, "race") == "鞋子" then
            class = "鞋子"
        end
        -- 随机对应等级的未知物品；位置：完整地图区域左下角
        local randomTypeId, lev = nil, GetUnitLevel(deathU)
        repeat
            randomTypeId = gIt.getRandom(ITEM_TYPE.ANY, lev)
        until gSlk.getItemString(gYh.id2s(randomTypeId), "class") == class
        -- 创建物品
        local it = gIt.create(randomTypeId, gU.getXY(deathU))
        -- 赋予相应属性
        
    end)
    -- 挑战单位离开区域
    for k, v in pairs(mt.rect) do
        gTrg.RegUnitLeaveOrEnterRegion("离开区域", v, function()
            local trgP = gU.getOwner(GetLeavingUnit())
            if GetLeavingUnit() == Hero[trgP] then
                gU.remove(dr[GetLeavingUnit()])
            end
        end)
    end
end

-- 初始化
function mt.Init()
    mt.Init_A()
end

mt.Init()

return mt
