local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄代码
mt.hero_scripter = '上岸的鱼'

-- 英雄名称
mt.name = "凤舞"

-- 物编ID
mt.id = 'Fw00'

-- 技能ID
mt.abiId = {'FwD0', 'FwQ0', 'FwW0', 'FwE0', 'FwR0'}

-- 英雄
mt.hero = nil

-- 伤害事件
-- function mt.HeroHarmEvent()
--     gTrg.RegAnyUnitDamageEvent(function()
--         local trgU, damS = GetTriggerUnit(), GetEventDamageSource()
--         local trgP = GetTriggerPlayer()
--         print(GetUnitName(trgU), GetUnitName(damS), GetEventDamage(), trgP)
--         print(gU.isEnemy(damS, trgP), IsEventAttackDamage())
--         if IsEventAttackDamage() and gU.isEnemy(damS, trgP) then -- 普攻
--             if damS == mt.hero then -- 判断伤害来源
--                 mt.abiD.Actions(damS, trgU)
--                 if gAbi.getLevel(damS, 'FwQ0') >= 1 then
--                     mt.abiQ.Actions(damS, trgU)
--                 end
--                 mt.abiE.Actions(damS, trgU)
--             end
--             if GetUnitTypeId(damS) ~= gYh.s2id('Fw01') then
--                 mt.abiD.Actions(damS, trgU)
--                 if gAbi.getLevel(damS, 'FwQ0') >= 1 then
--                     mt.abiQ.Actions(damS, trgU)
--                 end
--             end
--         end
--     end)
-- end

-- 学习技能事件
-- function mt.HeroLearnSkillEvent()
--     gTrg.RegUnitEvent(mt.hero, EVENT_UNIT.HERO_SKILL, function()
--         if GetLearnedSkill() == gYh.s2id('FwW0') then
--             mt.abiW.Actions(mt.hero)
--         elseif GetLearnedSkill() == gYh.s2id('FwR0') then
--             mt.abiW.Actions(mt.hero)
--             mt.abiR.Actions(mt.hero)
--         end
--     end)
-- end

-- 释放技能事件
function mt.HeroSpellSkillEvent()
    -- gTrg.RegUnitEvent(mt.hero, EVENT_UNIT.SPELL_EFFECT, function()

    -- end)
end
-- -- 注册英雄事件
-- gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
--     if GetUnitTypeId(GetChangingUnit()) ~= gYh.s2id(mt.id) then
--         return
--     end
--     mt.hero = GetTriggerUnit()
--     gH.setUpLevel(mt.hero, 100, true)
--     -- 伤害事件
--     gTrg.RegAnyUnitDamageEvent(function()
--         local trgU = GetTriggerUnit()
--         local damS = GetEventDamageSource()
--         local trgP = GetTriggerPlayer()
--         print(GetUnitName(trgU), GetUnitName(damS), GetEventDamage(), trgP)
--         print(gU.isEnemy(damS, trgP), IsEventAttackDamage())
--         if IsEventAttackDamage() and gU.isEnemy(damS, trgP) then -- 普攻
--             if damS == mt.hero then -- 判断伤害来源
--                 abiD.Actions(damS, trgU)
--                 if gAbi.getLevel(damS, 'FwQ0') >= 1 then
--                     abiQ.Actions(damS, trgU)
--                 end
--                 abiE.Actions(damS, trgU)
--             end
--             if GetUnitTypeId(damS) ~= gYh.s2id('Fw01') then
--                 abiD.Actions(damS, trgU)
--                 if gAbi.getLevel(damS, 'FwQ0') >= 1 then
--                     abiQ.Actions(damS, trgU)
--                 end
--             end
--         end
--     end)

--     -- 释放技能事件
--     -- gTrg.RegUnitEvent(mt.hero, EVENT_UNIT.SPELL_EFFECT, function()
--     --     mt.getUnitData(GetSpellAbilityId())

--     -- end)

--     -- 学习技能事件
--     gTrg.RegUnitEvent(mt.hero, EVENT_UNIT.HERO_SKILL, function()
--         mt.getUnitData(GetLearnedSkill())
--         if GetLearnedSkill() == gYh.s2id('FwW0') then
--             abiW.Actions(mt.hero)
--         elseif GetLearnedSkill() == gYh.s2id('FwR0') then
--             abiW.Actions(mt.hero)
--             abiR.Actions(mt.hero)
--         end
--     end)

--     gTrg.remove()
-- end)

gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if gU.isTypeId(GetTriggerUnit(), mt.id) then
        require 'hero.凤舞.D'
        require 'hero.凤舞.Q'
        require 'hero.凤舞.W'
        require 'hero.凤舞.E'
        require 'hero.凤舞.R'
        gTrg.remove()
    end
end)

return mt
