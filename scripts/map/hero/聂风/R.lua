local unitdata = require 'scope.unitdata'
local japi = require 'jass.japi'

local mt = {}

-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能id
mt.id = 'NfR0'

-- 技能名称
mt.name = "入魔"

-- 技能介绍
mt.tip = [[
    "受到15/30/45%的额外伤害，增加50/100/150%攻击速度，10/20/30%移动速度，10/20/30%攻击吸血，敏捷值*1/2/3的攻击力。
    使冰心决对攻击目标造成额外敏捷值*1/2/3的神圣伤害。"
]]
-- R
function mt.Actions(hero)
    local agi, Rlev = gH.getAgi(hero), gAbi.getLevel(hero, mt.id)
    local heroDur = gAbi.getDataReal(hero, mt.id, Rlev, ABILITY_DATA.HERODUR)
    -- 设置冰心诀额外神圣伤害允许
    mt.enable = true
    -- [系统]-设置(单位)的附加攻击增加敏捷值*1/2/3的攻击力
    unitdata.adjustAtk(hero, agi * Rlev)
    -- YDWEGeneralBounsSystemUnitSetBonus(hero, 3, 0, agi * Rlev)
    -- 魔化替换黑颜色
    gU.setVertexColor(hero, 30, 30, 30, 240)
    -- 魔化单位尺寸
    gU.setScale(hero, 1 + 0.1 * Rlev)

    TimerStart(gT.create(), heroDur, false, function()
        -- 魔化结束，还原颜色
        gU.setVertexColor(hero, 255, 255, 255, 255)
        -- 还原单位尺寸
        gU.setScale(hero, 1.0)
        unitdata.adjustAtk(hero, -agi * Rlev)
        -- YDWEGeneralBounsSystemUnitSetBonus(hero, 3, 0, -agi * Rlev)
        -- 设置冰心诀额外神圣伤害禁止
        mt.enable = false

        gT.remove()
    end)
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
