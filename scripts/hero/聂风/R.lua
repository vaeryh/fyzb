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
    local agi, Rlev = gH.getAgi(hero), gU.getAbiLev(hero, mt.id)
    local collT = YDWEGetUnitAbilityDataReal(hero, 'NfR0', Rlev, 103)
    local tmr = CreateTimer()
    -- 设置冰心诀额外神圣伤害允许
    SaveBoolean(Nf_Hash, GetHandleId(hero), 0, true)
    -- [系统]-设置(单位)的附加攻击增加敏捷值*1/2/3的攻击力
    YDWEGeneralBounsSystemUnitSetBonus(hero, 3, 0, agi * Rlev)
    -- 魔化替换黑颜色
    SetUnitVertexColor(hero, 30, 30, 30, 240)
    -- 单位尺寸
    SetUnitScale(hero, 1.2, 1.2, 1.2)

    TimerStart(tmr, collT, false, function()
        SetUnitVertexColor(hero, 255, 255, 255, 255) -- 魔化替换黑颜色
        SetUnitScale(hero, 1, 1, 1) -- 单位尺寸
        YDWEGeneralBounsSystemUnitSetBonus(hero, 3, 0, -agi * Rlev)
        SaveBoolean(Nf_Hash, GetHandleId(hero), 0, false) -- 设置冰心诀额外神圣伤害禁止

        gT.remove()
    end)
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if GetSpellAbility() == gYh.s2id(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
