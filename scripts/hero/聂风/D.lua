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
    local lev = GetUnitAbilityLevel(harmu, 'NfR0')

    if GetRandomInt(1, 100) <= (15 + (GetUnitLevel(harmu) / 10)) then -- 满足概率发动冰心诀
        bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(harmu), 'yhmj', GetUnitX(trgu), GetUnitY(trgu), 270) -- 创建新单位马甲
        UnitAddAbility(bj_lastCreatedUnit, 'NfD1') -- 添加马甲霜冻新星技能
        YDWESetUnitAbilityDataReal(bj_lastCreatedUnit, 'NfD1', 1, 108, Nf_Agi * 3) -- 设置 (马甲)的聂风 D冰心诀（真） 第1级的数据A为(harm)
        YDWESetUnitAbilityDataReal(bj_lastCreatedUnit, 'NfD1', 1, 109, Nf_Agi * 1)
        IssueTargetOrder(bj_lastCreatedUnit, "frostnova", trgu) -- 发布 不死族巫妖 - 霜冻新星 命令到目标: 敌人

        -- 聂风魔化且满足概率即造成目标额外神圣伤害
        if LoadBoolean(Nf_Hash, GetHandleId(harmu), 0) == true then
            -- 单位 - 命令 (harmu) 对 (trgu) 造成 敏捷值*1/2/3点伤害(不是 攻击伤害, 不是远程攻击) 攻击类型: 法术 伤害类型: 神圣 武器类型: 无
            UnitDamageTarget(harmu, trgu, Nf_Agi * lev, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_DIVINE,
                WEAPON_TYPE_WHOKNOWS)
        end
    end

    -- 魔化开始
    if LoadBoolean(Nf_Hash, GetHandleId(harmu), 0) == true then -- 聂风魔化吸血
        SetUnitState(harmu, UNIT_STATE_LIFE, GetUnitState(harmu, UNIT_STATE_LIFE) + GetEventDamage() * 0.1 * lev) -- 魔化攻击吸血10/20/30%
        -- 漂浮文字
        CreateTextTagUnit("+" + R2S(GetEventDamage() * 0.1 * lev), 0.025, harmu, 0, 1.33, 51, 255, 102, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 120)
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
        if gU.isHaveAbi(source, mt.id) then
            mt.Actions(source, trgU)
        end
    end
end)

return mt
