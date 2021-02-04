local jump = require 'scope.jump'
local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'NfW0'

-- 技能名称
mt.name = "傲寒六绝"

-- 技能介绍
mt.tip = "挥舞大刀向前冲出，落地造成范围敏捷*1-5伤害"

-- W
function mt.Actions(hero)
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local x, y = gU.getXY(hero)
    local distance = gYh.distanceXY(x, y, spellX, spellY)
    local angle = gYh.angleXY(x, y, spellX, spellY)
    -- jump函数
    YDWEJumpTimer(hero, angle, distance, 0.30, 0.01, 210)
    local color = 255
    TimerStart(gT.create(), 0.02, true, function()
        local Wlev, agi = gAbi.getLevel(hero, 'NfW0'), gH.getAgi(hero, true)
        -- 创建马甲
        local mj = gU.create(gU.getOwner(hero), 'yhmj', x, y, angle)
        gDz.SetUnitModel(mj, "units\\orc\\HeroBladeMaster\\HeroBladeMaster.mdl")
        gU.setLifeTime(mj, 0.5)
        YDWEJumpTimer(mj, angle, distance, 0.30, 0.01, 210) -- 跳跃函数
        color = color - 11
        gU.setVertexColor(mj, color, color, color, color)

        if color <= 0 then
            -- 地震区域效果
            gEff.remove(gEff.addXY("Abilities\\Spells\\Orc\\EarthQuake\\EarthQuakeTarget.mdl", spellX, spellY))
            -- 战争践踏效果
            gEff.addXY("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", spellX, spellY)
            -- 创建马甲
            local mj = gU.create(gU.getOwner(hero), 'yhmj', spellX, spellY, angle)
            gAbi.add(mj, 'NfW1')
            -- 减少护甲。数据A
            gAbi.setDataReal(mj, 'NfW1', 1, 108, agi * Wlev)
            -- 影响区域
            gAbi.setDataReal(mj, 'NfW1', 1, 106, Wlev * 30 + 250)
            gU.issueOrder(mj, "stomp")

            gT.remove()
        end
    end)

end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_CAST, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
