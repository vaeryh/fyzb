local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'NfE0'

-- 技能名称
mt.name = "风神腿"

-- 技能介绍
mt.tip = "增加移动速度5-30%、攻击速度10-50%、闪避率8-40%"

-- E
function mt.Actions(hero)
    local Elev = gAbi.getLevel(hero, mt.id)
    --
    if gAbi.getLevel(hero, 'NfE1') == 0 then
        gAbi.add(hero, 'NfE1')
        gAbi.add(hero, 'NfE2')
    end
    gAbi.setLevel(hero, 'NfE1', Elev)
    gAbi.setLevel(hero, 'NfE2', Elev)
end

-- 触发+条件
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.HERO_SKILL, function()
    if GetLearnedSkill() == gYh.s2id(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
