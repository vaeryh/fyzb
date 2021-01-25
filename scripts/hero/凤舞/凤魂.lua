local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能介绍
mt.tip = "凤舞的攻击与攻击距离增加50/100/150/200/250点"

-- W
function mt.Actions(hero)
    -- 增加攻击范围
    gU.setState(hero, gU.UNIT_STATE.ATK_Range, 50)
    -- 增加攻击力
    gU.setState(hero, gU.UNIT_STATE.BASIC_DAMAGE, 50)
    --SetUnitState(Fw_Hero, ConvertUnitState(0x16), GetUnitState(Fw_Hero, ConvertUnitState(0x16)) + 50) -- 攻击范围
    --SetUnitState(Fw_Hero, ConvertUnitState(0x12), GetUnitState(Fw_Hero, ConvertUnitState(0x12)) + 50) -- 攻击力
end

return mt
