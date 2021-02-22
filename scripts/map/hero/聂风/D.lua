local abiR = require 'map.hero.聂风.R'

local mt = {}
-- 技能位置
mt.Buttonpos = "D"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'NfD0'

-- 技能名称
mt.name = "冰心诀"

-- 技能介绍
mt.tip = [[
    "每次普攻有10%（英雄每10级+1%）的几率触发冰冻伤害，
    造成200范围内敏捷*3的伤害并减速敌人2秒"
]]

-- D动作
function mt.Actions(hero, enemy)
    local Rlev, agi = gAbi.getLevel(hero, 'NfR0'), gH.getAgi(hero)

    if GetRandomReal(1, 100) <= 15 + (gH.getLevel(hero) / 10) then -- 满足概率发动冰心诀
        local mj = gU.create(gU.getOwner(hero), 'yhmj', GetUnitX(hero), GetUnitY(hero), 270) -- 创建新单位马甲
        -- 添加马甲霜冻新星技能
        gAbi.add(mj, 'NfD1')
        -- 设置 (马甲)的聂风 D冰心诀（真） 第1级的数据A为(harm)
        gAbi.setDataReal(mj, 'NfD1', 1, ABILITY_DATA.DATA_A, agi * 3)
        gAbi.setDataReal(mj, 'NfD1', 1, ABILITY_DATA.DATA_B, agi)
        -- 发布 不死族巫妖 - 霜冻新星 命令到目标: 敌人
        gU.issueOrderTar(mj, "frostnova", enemy)
        -- 聂风魔化且满足概率即造成目标额外神圣伤害
        if abiR.enable then
            -- 单位 - 命令 (harmu) 对 (hero) 造成 敏捷值*1/2/3点伤害(不是 攻击伤害, 不是远程攻击) 攻击类型: 法术 伤害类型: 神圣 武器类型: 无
            local harm = gH.getAgi(hero) * Rlev
            UnitDamageTarget(hero, enemy, harm, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_DIVINE,
                WEAPON_TYPE_WHOKNOWS)
        end
    end

    -- 魔化开始
    if abiR.enable then -- 聂风魔化吸血
        local addLife = string.format('%.f', GetEventDamage() * 0.1 * Rlev)
        gU.adjustState(hero, UNIT_STATE.LIFE, addLife) -- 魔化攻击吸血10/20/30%
        -- 漂浮文字
        gTag.newUnit("|cff03f50f+" .. addLife, 0.025, hero, 1.33, 64, 120)
    end
    -- 魔化结束
end

-- 触发+条件
gTrg.RegAnyUnitDamageEvent(function()
    if not gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
        return
    end

    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()

    if IsEventAttackDamage() then -- 普攻
        -- 伤害来源拥有技能
        if gAbi.isHave(source, mt.id) then
            mt.Actions(source, trgU)
        end
    end
end)

return mt
