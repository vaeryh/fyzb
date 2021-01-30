local abiQ = require 'hero.断浪.Q'

local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'DlW0'

-- 技能名称
mt.name = "血劫爪"

-- 技能介绍
mt.tip = [[
    开启后每秒消耗0.5/1/1.5/2/2.5点魂魄。
    获得10%/20%/30%/40%/50%的吸血、攻速、攻击力、闪避、防御。
    免疫控制（不计算火麟剑增加的攻击力和防御力。）
    可马上关闭，关闭后冷却10秒。
]]

--血劫爪标记
mt.mask = 1

-- W
function mt.Actions(hero)
    local Wlev = gAbi.getLevel(hero, mt.id)
    mt.mask = mt.mask * -1
    if mt.mask == 1 then
        gAbi.setDataString(hero, mt.id, nil, ABILITY_DATA.ART, "ReplaceableTextures\\CommandButtons\\BTNImmolationOff.blp")
        gAbi.setDataReal(hero, mt.id, Wlev, ABILITY_DATA.COOL, 0)
        gAbi.add(hero, 'DlW1')
        gAbi.setLevel(hero, 'DlW1', Wlev)
        gAbi.add(hero, 'DlW2')
        gAbi.setLevel(hero, 'DlW2', Wlev)
        gAbi.add(hero, 'DlW3')
        gAbi.setLevel(hero, 'DlW3', Wlev)



        TimerStart(gT.create(), 1, true, function()
            if abiQ.soul >= Wlev then
                abiQ.soul = abiQ.soul - Wlev
            end

            if abiQ.soul <= 0 or mt.mask == -1 then
                mt.mask = -1

                gAbi.setDataReal(hero, 'DlW0', Wlev, ABILITY_DATA.COOL, 0)
                gAbi.remove(hero, 'DlW1')
                gAbi.remove(hero, 'DlW2')
                gAbi.remove(hero, 'DlW3')

                gT.remove()
            end
        end)
    else
        gAbi.setDataReal(hero, 'DlW0', Wlev, ABILITY_DATA.COOL, 10)
        gAbi.remove(hero, 'DlW1')
        gAbi.remove(hero, 'DlW2')
        gAbi.remove(hero, 'DlW3')
    end

end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_CAST, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(hero)
    end
end)

return mt
