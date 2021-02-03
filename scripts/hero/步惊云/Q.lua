local mt = {}

-- 技能位置
mt.Buttonpos = "Q"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'BjyQ'

-- 技能名称
mt.name = "排云掌"

-- 技能介绍
mt.tip = [[
    攻击对目标300码范围造成60%的普攻伤害
]]

-- 动作
function mt.Actions(hero, enemy)
    local Qlev,str = gAbi.getLevel(hero, mt.id),gH.getStr(hero)
    local harm = gU.getState(hero, UNIT_STATE.BASIC_DAMAGE)+str/2
    local range = gU.getState(hero, UNIT_STATE.ATK_RANGE) + Qlev * 50
    gAbi.setDataReal(hero, mt.id, nil, ABILITY_DATA.DATA_B, harm) -- 伤害
    gAbi.setDataReal(hero, mt.id, nil, ABILITY_DATA.DATA_C, range) -- 全范围
    gAbi.setDataReal(hero, mt.id, nil, ABILITY_DATA.DATA_D, range + 100) -- 半范围
end

-- 触发+条件
gTrg.RegAnyUnitDamageEvent(function()
    if gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
        if IsEventAttackDamage() then -- 普攻
            -- 伤害来源拥有技能
            if gAbi.isHave(GetEventDamageSource(), mt.id) then
                mt.Actions(GetEventDamageSource(), GetTriggerUnit())
            end
        end
    end
end)

return mt
