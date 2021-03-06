local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'DlE0'

-- 技能名称
mt.name = "血火邪罡"

-- 技能介绍
mt.tip = [[
    消耗20点魂魄向前方撒出一片血火邪罡，
    造成力量*5的伤害，并减少敌人（敏捷/200）%的护甲，持续5秒。
]]

-- E
function mt.Actions(hero)
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local Elev = gAbi.getLevel(hero, mt.id)
    local str, agi = gH.getStr(hero), gH.getAgi(hero)
    -- 伤害值
    gAbi.setDataReal(hero, mt.id, Elev, ABILITY_DATA.DATA_A, str * Elev)
    local dur = gAbi.getDataReal(hero, mt.id, Elev, ABILITY_DATA.DUR)

    local dwz = gGroup.getUnitInRange(gU.getX(hero), gU.getY(hero), 800)
    local ang = gYh.angleXY(GetUnitX(hero), GetUnitY(hero), spellX, spellY)
    for i, unit in ipairs(dwz) do
        if gU.isEnemy(unit, gU.getOwner(hero)) and gU.is_alive(unit) and not IsUnitType(unit, UNIT_TYPE.STRUCTURE) then
            local angle = gYh.angleByUnit(hero, unit)
            local abs = math.abs(ang) - math.abs(angle)
            print(GetUnitName(unit), gAbi.getLevel(unit, 'B0E3'))
            if math.abs(abs) < 45 then
                local def = agi / 50
                gUnitdata.adjustDef(unit, -def) -- def
                local t = gT.create()
                local g = {}
                g[t] = unit
                g[unit] = def

                TimerStart(t, dur, false, function()
                    local u = g[GetExpiredTimer()]
                    local def = g[u]

                    gUnitdata.adjustDef(u, def) -- def
                    gT.remove()
                end)
            end
        end
    end
end

-- 触发+条件
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
