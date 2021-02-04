local mt = {}

-- 技能位置
mt.Buttonpos = "Q"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'SyQ0'

-- 技能名称
mt.name = "药王神经-饲养"

-- 技能介绍
mt.tip = [[
    神医召唤3/4/5/6/7只用毒物培养的尸蟞来攻击敌人，
    尸蟞攻击造成神医智力*0.05*专属等级的伤害。
]]

-- 动作
function mt.Actions(hero, enemy)
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local int, Qlev = gH.getInt(hero), gAbi.getLevel(hero, mt.id)
    for i = 1, 3 + Qlev do
        local mj = gU.create(gU.getOwner(hero), 'syq1', spellX, spellY, 270)

        gU.setLifeTime(mj, 15 + Qlev * 3) -- 设置生命周期
        gU.setScale(mj, 1 + Qlev * 0.1) -- 尺寸
        local rgb = 255 - Qlev * 10
        gU.setVertexColor(mj, rgb, rgb, rgb, rgb) -- 颜色

        gU.setState(mj, UNIT_STATE.MAX_LIFE, int * 10) -- life
        gU.setState(mj, UNIT_STATE.LIFE, int * 10) -- life
        gUnitdata.adjustAtk(mj, int * 1) -- atk
        gUnitdata.adjustDef(mj, int / 20) -- def

        gAbi.add(mj, 'sbzj') -- 添加重击技能
        gAbi.setDataReal(mj, 'sbzj', 1, ABILITY_DATA.DATA_C, int * 0.5) -- 伤害
    end
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
