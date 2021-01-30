local map = require 'map.global'

local mt = {}

-- 练功房矩形1
mt.lgf1 = map.rect['练功房矩形1']
-- 练功房矩形2
mt.lgf2 = map.rect['练功房矩形4']
--------------------------------------------------------------------------
-- 启用玩家可见度
gTrg.RegTimerEvent(5.00, false, function()
    gFog.start(gFog.createFog(Player(0), mt.lgf1))
    gFog.start(gFog.createFog(Player(0), mt.lgf2))
end)
--------------------------------------------------------------------------
-- 英雄瓶颈(逢10)
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.HERO_LEVEL, function()
    local trgP = GetTriggerPlayer()
    local trgU = GetTriggerUnit()
    --
    if Hero[trgP] == trgU then
        local Lev = GetHeroLevel(trgU)
        -- 触发单位满足等级
        if Lev % 10 == 9 then
            DisplayTimedTextToPlayer(trgP, 0, 0, 10.00, "达到境界瓶颈，赶紧去练功房挑战吧！")
            SuspendHeroXP(trgU, true) -- 暂停经验获取，是
        end
    end
end)
--------------------------------------------------------------------------
-- Next
function Actions_C_1(whichHero)
    local Lev = GetHeroLevel(whichHero)
    local trgP = GetOwningPlayer(whichHero)
    -- 判断等级是否满足条件
    if Lev % 9 ~= 9 then
        gP.disTimedText(trgP, 15.00, "未满足挑战要求!")
        return
    end
    -- 传送挑战选手
    gYh.MoveAndCamera(whichHero, GetRectMinX(mt.lgf2) + 450, GetRectMaxY(mt.lgf2) - 500)
    gP.disTimedText(trgP, 15.00, "挑战开始·······!")
    -- 创建挑战对手
    local x, y = gRect.getCenter(mt.lgf2)
    local whichEnemy = gU.create(Player(11), GetUnitTypeId(whichHero), x, y, 270)
    gH.setUpLevel(whichEnemy, Lev * 10, false)
    gU.setUnitColor(whichEnemy, 50, 50, 50, 255)
    -- 绑定挑战英雄
    TimerStart(CreateTimer(), 2.00, true, function()
        -- 敌人死亡
        if not gU.is_alive(whichEnemy) then
            gP.disTimedText(trgP, 15.00, GetUnitName(whichHero) + "挑战成功!奖励提升等级1级。")
            gH.SuspendHeroXP(whichHero, false)
            gH.setUpLevel(whichHero, GetHeroLevel(whichHero) + 1, true)
            -- 传送挑战选手
            gYh.MoveAndCamera(whichHero, GetRectMinX(mt.lgf1) + 450, GetRectMaxY(mt.lgf1) - 500)
        end
        -- 玩家英雄死亡
        if not gU.is_alive(whichHero) then
            gP.disTimedText(trgP, 15.00, GetUnitName(whichHero) + "死亡。挑战失败!请再接再厉！")
            gU.remove(whichEnemy)
        end
        -- 不在指定区域
        if gU.RectContainsUnit(mt.lgf2, whichHero) == false then
            gP.disTimedText(trgP, 15.00, GetUnitName(whichHero) + "逃离挑战区域，视为挑战失败!")
            gU.remove(whichEnemy)
        end
        -- 玩家英雄死亡 或者 不在指定区域 或者 敌人死亡
        if not gU.is_alive(whichHero) or not gU.is_alive(whichEnemy) or gU.RectContainsUnit(mt.lgf2, whichHero) == false then
            gT.remove()
        end
    end)
end
-- 开始挑战
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    local trgP = GetTriggerPlayer()
    local trgU = GetTriggerUnit()
    local gNum = gGroup.getUnitInRect(mt.lgf2)
    if GetUnitTypeId(trgU) == gYh.s2id('tr00') then
        -- 突破
        if GetSpellAbilityId() == gYh.s2id('Tr01') then
            if #gNum == 0 then
                Actions_C_1(Hero[trgP])
            else
                DisplayTimedTextToPlayer(trgP, 0, 0, 15.00, "有人正在挑战中，请稍后······")
            end
        end
    end
end)
--------------------------------------------------------------------------
-- 练功房，F2
gTrg.RegKeyEventByCode(113, 0, function()
    local p = gDz.GetTriggerKeyPlayer()
    gYh.MoveAndCamera(Hero[p], gRect.getCenter(mt.lgf1))
end)
--------------------------------------------------------------------------
-- 及时刷新练功房出兵
gTrg.RegTimerEvent(0.50, true, function()
    local num = 0
    local x, y = gRect.getCenter(mt.lgf1)
    local group = gGroup.getUnitInRect(mt.lgf1)

    for i, unit in ipairs(group) do
        if gP.getOwner(unit) == Player(11) and gU.is_alive(unit) then
            num = num + 1
        end
    end
    -- 区域敌对单位数量为零，则刷兵
    if num == 0 then
        local atk = require 'map.atk'
        local id = string.format('at' .. "%02d", atk.bs)
        gU.createNum(40, Player(11), id, x, y)
    end
end)
