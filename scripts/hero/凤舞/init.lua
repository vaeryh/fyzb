local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄触发
mt.hero_scripter = '上岸的鱼'

-- 物编ID
mt.id = 'Fw00'
-- 英雄
mt.hero = nil

-- 等级
mt.level = 0

-- 技能等级
mt.abiLev = 0

-- 力量
mt.str = 0

-- 敏捷
mt.agi = 0

-- 智力
mt.int = 0

function mt.getUnitData(AbiID)
    mt.abiLev = GetUnitAbilityLevel(mt.hero, AbiID)
    mt.str = gH.getStr(mt.hero)
    mt.agi = gH.getAgi(mt.hero)
    mt.int = gH.getInt(mt.hero)
end
-- 注册英雄事件
gTrg.RegUserPlayerUnitEvent(gTrg.EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if GetUnitTypeId(GetChangingUnit()) ~= gYh.s2id('Fw00') then
        return
    end
    mt.hero = GetTriggerUnit()
    -- 伤害事件
    gTrg.RegAnyUnitDamage(function()
        local hero = GetTriggerUnit()
        local foe = GetEventDamageSource()
        print(GetUnitName(hero), GetUnitName(foe), GetEventDamage())

        -- if YDWEIsEventAttackDamage() == true and IsUnitAlly(GetEventDamageSource(), GetTriggerPlayer()) == false then -- 普攻
        -- 	if GetEventDamageSource() == Hero then -- 判断伤害来源
        -- 		FwHarm_Abi_D_Actions(GetTriggerUnit()) -- D
        -- 		if GetUnitAbilityLevel(Hero, 'FwQ0') >= 1 then
        -- 			FwHarm_Abi_Q_Actions(GetTriggerUnit()) -- Q
        -- 		end

        -- 		FwHarm_Abi_W_Actions() -- W
        -- 		FwHarm_Abi_E_Actions() -- E
        -- 		FwHarm_Abi_R_Actions() -- R
        -- 	end

        -- 	if GetTriggerUnit() == Hero then -- 判断伤害来源

        -- 	end
        -- end
    end)

    -- 释放技能事件
    gTrg.RegUnitEvent(mt.hero, gTrg.EVENT_UNIT.SPELL_EFFECT, function()
        mt.getUnitData(GetSpellAbilityId())

    end)
    -- 学习技能事件
    gTrg.RegUnitEvent(mt.hero, gTrg.EVENT_UNIT.HERO_SKILL, function()
        local abiW = require 'hero.凤舞.凤魂'
        local abiR = require 'hero.凤舞.凤舞九天'
        mt.getUnitData(GetLearnedSkill())
        abiW.Actions(mt.hero)
        abiR.Actions(mt.hero)
    end)

    gTrg.remove()
end)

return mt
