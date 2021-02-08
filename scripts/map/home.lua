local map = require 'map.global'
local message = require 'jass.message'

local mt = {}
-- 主基地id
mt.id = 'bas0'

-- 回城矩形
mt.rect_hg = map.rect['回城矩形']
-----------------------------------------------------------------------------
-- 游戏失败条件：基地死亡
function mt.game_fail()
    gTrg.RegPlayerUnitEvent(Player(9), EVENT_PLAYER_UNIT.DEATH, function()
        -- 条件
        if GetUnitTypeId(trgU) == gYh.s2id(mt.id) then
            game.CustomVictory(Player(11), true, false) -- 设置游戏失败
        end
    end)
end

-- 游戏胜利条件：
function mt.game_victory()

end
-----------------------------------------------------------------------------
-- 输入hg 回城
gTrg.RegAnyPlayerChatEvent(GetEventPlayerChatString(), true, function()
    if string.upper(GetEventPlayerChatString()) == "HG" then
        gYh.MoveAndCamera(Hero[trgP], rect.getCenter(mt.rect_hg))
    end
end)
-----------------------------------------------------------------------------
-- 按键F3回城
gDz.TriggerRegisterKeyEvent(114, 0, true, function()
    local p = gDz.GetTriggerKeyPlayer()
    gYh.MoveAndCamera(Hero[p], gRect.getCenter(map.rect['回城矩形']))
end)
-----------------------------------------------------------------------------
-- 黄金换木头(10000:1)
function mt.Gold2Lum(trgP)
    if GetPlayerState(trgP, PLAYER_STATE_RESOURCE_GOLD) >= 10000 then
        gP.adjustState(trgP, PLAYER_STATE_RESOURCE_GOLD, -10000)
        gP.adjustState(trgP, PLAYER_STATE_RESOURCE_LUMBER, 1)
    else
        DisplayTextToPlayer(trgP, 0, 0, "银币不足，不可兑换！")
    end
end

-- 木头换黄金(1:10000)
function mt.Lum2Gold(trgP)
    if GetPlayerState(trgP, PLAYER_STATE_RESOURCE_LUMBER) >= 1 then
        gP.adjustState(trgP, PLAYER_STATE_RESOURCE_GOLD, 10000)
        gP.adjustState(trgP, PLAYER_STATE_RESOURCE_LUMBER, -1)
    else
        DisplayTextToPlayer(trgP, 0, 0, "木头不足，不可兑换！")
    end
end

-- 升级基地
function mt.upBase(trgP, trgU)
    if GetPlayerState(trgP, PLAYER_STATE_RESOURCE_GOLD) >= 5000 then
        gP.adjustState(trgP, PLAYER_STATE_RESOURCE_GOLD, -5000)
        -- 改变护甲生命值
        gU.adjustState(trgU, UNIT_STATE.ARMOR, 10.00)
        gU.adjustState(trgU, UNIT_STATE.MAX_LIFE, 10000.00)
        gU.adjustState(trgU, UNIT_STATE.LIFE, 200.00)
    else
        DisplayTextToPlayer(trgP, 0, 0, "银币不足，升级失败！")
    end
end

-- 无敌
function mt.BaseAvul(trgP, trgU)
    if GetPlayerState(trgP, PLAYER_STATE_RESOURCE_GOLD) >= 50000 then
        gP.adjustState(trgP, PLAYER_STATE_RESOURCE_GOLD, -50000)
        -- 设置单位无敌、可攻击的
        SetUnitInvulnerable(trgU, true)
        -- 解除基地无敌
        TimerStart(CreateTimer(), 30.00, false, function()
            SetUnitInvulnerable(trgU, false) -- 设置单位无敌、不可攻击的
            gT.remove()
        end)
    else
        DisplayTextToPlayer(trgP, 0, 0, "银币不足，无敌失败！")
    end
end

-- 暂停计时器
function mt.PauseBrushTimer(trgP, trgU)
    if GetPlayerState(trgP, PLAYER_STATE_RESOURCE_GOLD) >= 50000 then
        gP.adjustState(trgP, PLAYER_STATE_RESOURCE_GOLD, -50000)
        local atk = require 'map.atk'
        atk.Pause_Actions()
    else
        DisplayTextToPlayer(trgP, 0, 0, "银币不足，停怪失败！")
    end
end

-- 购买物品
gTrg.RegPlayerUnitEvent(Player(9), EVENT_PLAYER_UNIT.SELL_ITEM, function()
    if GetUnitTypeId(GetTriggerUnit()) ~= gYh.s2id(mt.id) then
        return
    end
    local trgU = GetSellingUnit() -- 贩卖单位
    local trgP = GetOwningPlayer(GetBuyingUnit())
    local Item = GetSoldItem()

    if GetItemTypeId(Item) == gYh.s2id('bas1') then -- 黄金换木头
        mt.Gold2Lum(trgP)
    elseif GetItemTypeId(Item) == gYh.s2id('bas2') then -- 木头换黄金
        mt.Lum2Gold(trgP)
    elseif GetItemTypeId(Item) == gYh.s2id('bas3') then -- 升级基地
        mt.upBase(trgP, trgU)
    elseif GetItemTypeId(Item) == gYh.s2id('bas4') then -- 无敌
        mt.BaseAvul(trgP, trgU)
    elseif GetItemTypeId(Item) == gYh.s2id('bas5') then -- 暂停刷兵计时器
        mt.PauseBrushTimer(trgP, trgU)
    end
end)
-----------------------------------------------------------------------------
-- 启用游戏失败触发
mt.game_fail()

return mt
