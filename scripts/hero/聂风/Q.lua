local mt = {}

-- 技能位置
mt.Buttonpos = "Q"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'NfQ0'

-- 技能名称
mt.name = "创刀"

-- 技能介绍
mt.tip = "对敌方造成撕裂效果，减少敌人10%敏捷的护甲，每秒造成敏捷*1-5的伤害。"

-- 凤回闪计数
mt.count = 0

-- 动作
function mt.Actions(hero, enemy)
    local agi, Qlev = gH.getAgi(hero), gU.getAbiLev(hero, mt.id)
    -- 减少护甲。数据C
    YDWESetUnitAbilityDataReal(hero, 'NfQ0', Qlev, 110, Qlev * 3)
    -- 目标伤害.数据D
    YDWESetUnitAbilityDataReal(hero, 'NfQ0', Qlev, 111, agi * Qlev * 0.3)
    -- 周围伤害.数据E
    YDWESetUnitAbilityDataReal(hero, 'NfQ0', Qlev, 112, agi * Qlev * 0.2)
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if GetSpellAbility() == gYh.s2id(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
