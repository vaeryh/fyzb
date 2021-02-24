local japi = require 'jass.japi'

local mt = {}

-- 攻击类型
ATTACK_TYPE = {
    -- 法术
    NORMAL = ATTACK_TYPE_NORMAL,
    -- 普通
    MELEE = ATTACK_TYPE_MELEE,
    -- 穿刺
    PIERCE = ATTACK_TYPE_PIERCE,
    -- 攻城
    SIEGE = ATTACK_TYPE_SIEGE,
    -- 魔法
    MAGIC = ATTACK_TYPE_MAGIC,
    -- 混乱
    CHAOS = ATTACK_TYPE_CHAOS,
    -- 英雄
    HERO = ATTACK_TYPE_HERO
}

-- 伤害类型
DAMAGE_TYPE = {
    -- 未知的
    UNKNOWN = DAMAGE_TYPE_UNKNOWN,
    -- 普通
    NORMAL = DAMAGE_TYPE_NORMAL,
    -- 强化
    ENHANCED = DAMAGE_TYPE_ENHANCED,
    -- 火焰
    FIRE = DAMAGE_TYPE_FIRE,
    -- 冰冻
    COLD = DAMAGE_TYPE_COLD,
    -- 闪电
    LIGHTNING = DAMAGE_TYPE_LIGHTNING,
    -- 毒药
    POISON = DAMAGE_TYPE_POISON,
    -- 疾病
    DISEASE = DAMAGE_TYPE_DISEASE,
    -- 神圣
    DIVINE = DAMAGE_TYPE_DIVINE,
    -- 魔法
    MAGIC = DAMAGE_TYPE_MAGIC,
    -- 音速
    SONIC = DAMAGE_TYPE_SONIC,
    -- 酸性
    ACID = DAMAGE_TYPE_ACID,
    -- 力量
    FORCE = DAMAGE_TYPE_FORCE,
    -- 死亡
    DEATH = DAMAGE_TYPE_DEATH,
    -- 精神
    MIND = DAMAGE_TYPE_MIND,
    -- 植物
    PLANT = DAMAGE_TYPE_PLANT,
    -- 防御
    DEFENSIVE = DAMAGE_TYPE_DEFENSIVE,
    -- 破坏
    DEMOLITION = DAMAGE_TYPE_DEMOLITION,
    -- 慢性中毒
    SLOW_POISON = DAMAGE_TYPE_SLOW_POISON,
    -- 灵魂锁链
    SPIRIT_LINK = DAMAGE_TYPE_SPIRIT_LINK,
    -- 暗影突袭
    SHADOW_STRIKE = DAMAGE_TYPE_SHADOW_STRIKE,
    -- 通用
    UNIVERSAL = DAMAGE_TYPE_UNIVERSAL
}

-- 武器类型
WEAPON_TYPE = {
    -- 无
    WHOKNOWS = WEAPON_TYPE_WHOKNOWS,
    -- 金属轻砍
    METAL_LIGHT_CHOP = WEAPON_TYPE_METAL_LIGHT_CHOP,
    -- 金属中砍
    METAL_MEDIUM_CHOP = WEAPON_TYPE_METAL_MEDIUM_CHOP,
    -- 金属重砍
    METAL_HEAVY_CHOP = WEAPON_TYPE_METAL_HEAVY_CHOP,
    -- 金属轻切
    METAL_LIGHT_SLICE = WEAPON_TYPE_METAL_LIGHT_SLICE,
    -- 金属中切
    METAL_MEDIUM_SLICE = WEAPON_TYPE_METAL_MEDIUM_SLICE,
    -- 金属重切
    METAL_HEAVY_SLICE = WEAPON_TYPE_METAL_HEAVY_SLICE,
    -- 金属中击
    METAL_MEDIUM_BASH = WEAPON_TYPE_METAL_MEDIUM_BASH,
    -- 金属重击
    METAL_HEAVY_BASH = WEAPON_TYPE_METAL_HEAVY_BASH,
    -- 金属中刺
    METAL_MEDIUM_STAB = WEAPON_TYPE_METAL_MEDIUM_STAB,
    -- 金属重刺
    METAL_HEAVY_STAB = WEAPON_TYPE_METAL_HEAVY_STAB,
    -- 木头轻切
    WOOD_LIGHT_SLICE = WEAPON_TYPE_WOOD_LIGHT_SLICE,
    -- 木头中切
    WOOD_MEDIUM_SLICE = WEAPON_TYPE_WOOD_MEDIUM_SLICE,
    -- 木头重切
    WOOD_HEAVY_SLICE = WEAPON_TYPE_WOOD_HEAVY_SLICE,
    -- 木头轻击
    WOOD_LIGHT_BASH = WEAPON_TYPE_WOOD_LIGHT_BASH,
    -- 木头中击
    WOOD_MEDIUM_BASH = WEAPON_TYPE_WOOD_MEDIUM_BASH,
    -- 木头中击
    WOOD_HEAVY_BASH = WEAPON_TYPE_WOOD_HEAVY_BASH,
    -- 木头轻刺
    WOOD_LIGHT_STAB = WEAPON_TYPE_WOOD_LIGHT_STAB,
    -- 木头中刺
    WOOD_MEDIUM_STAB = WEAPON_TYPE_WOOD_MEDIUM_STAB,
    -- 爪轻切
    CLAW_LIGHT_SLICE = WEAPON_TYPE_CLAW_LIGHT_SLICE,
    -- 爪中切
    CLAW_MEDIUM_SLICE = WEAPON_TYPE_CLAW_MEDIUM_SLICE,
    -- 爪重切
    CLAW_HEAVY_SLICE = WEAPON_TYPE_CLAW_HEAVY_SLICE,
    -- 斧头中砍
    AXE_MEDIUM_CHOP = WEAPON_TYPE_AXE_MEDIUM_CHOP,
    -- 岩石重击
    ROCK_HEAVY_BASH = WEAPON_TYPE_ROCK_HEAVY_BASH
}


-- ===============================================================================================

-- 伤害事件数据
EVENT_DAMAGE_DATA = {
    -- 有效的
    VAILD = 0,
    -- 物理伤害
    IS_PHYSICAL = 1,
    -- 攻击伤害
    IS_ATTACK = 2,
    -- 远程伤害
    IS_RANGED = 3,
    -- 伤害类型
    DAMAGE_TYPE = 4,
    -- 武器类型
    WEAPON_TYPE = 5,
    -- 攻击类型
    ATTACK_TYPE = 6
}

-- 单位伤害目标
function mt.target(unit, enemy, harm, attack, ranged, attackType, damageType, weaponType)
    local attack = attack or false -- 默认不是攻击伤害
    local ranged = ranged or false -- 默认不是远程攻击伤害
    local attackType = attackType or ATTACK_TYPE.NORMAL
    local damageType = damageType or DAMAGE_TYPE.NORMAL
    local weaponType = weaponType or WEAPON_TYPE.WHOKNOWS
    gTrg.setClose()
    UnitDamageTarget(unit, enemy, harm, attack, ranged, attackType, damageType, weaponType)
    gTrg.setOpen()
end

-- 单位伤害区域
function mt.area(unit, delay, radius, x, y, harm, attack, ranged, attackType, damageType, weaponType)
    local attack = attack or false -- 默认不是攻击伤害
    local ranged = ranged or false -- 默认不是远程攻击伤害
    local attackType = attackType or ATTACK_TYPE.NORMAL
    local damageType = damageType or DAMAGE_TYPE.NORMAL
    local weaponType = weaponType or WEAPON_TYPE.WHOKNOWS
    UnitDamagePoint(unit, delay, radius, x, y, harm, attack, ranged, attackType, damageType, weaponType)
end

-- 获取伤害事件数据
-- native EXGetEventDamageData takes integer edd_type returns integer
function mt.getDamageData(edd_type)
    return japi.EXGetEventDamageData(edd_type)
end

-- 是否物理伤害
function mt.isPhysicalDamage()
    return 0 ~= mt.getDamageData(EVENT_DAMAGE_DATA.IS_PHYSICAL)
end

-- 是否攻击伤害
function mt.isAttackDamage()
    return 0 ~= mt.getDamageData(EVENT_DAMAGE_DATA.IS_ATTACK)
end

-- 是否远程伤害
function mt.isRangedDamage()
    return 0 ~= mt.getDamageData(EVENT_DAMAGE_DATA.IS_RANGED)
end

-- 是否伤害类型
function mt.isDamageType(damageType)
    return damageType == ConvertDamageType(mt.getDamageData(EVENT_DAMAGE_DATA.DAMAGE_TYPE))
end

-- 是否武器类型
function mt.isWeaponType(weaponType)
    return weaponType == ConvertWeaponType(mt.getDamageData(EVENT_DAMAGE_DATA.WEAPON_TYPE))
end

-- 是否攻击类型
function mt.isAttackType(attackType)
    return attackType == ConvertAttackType(mt.getDamageData(EVENT_DAMAGE_DATA.ATTACK_TYPE))
end

-- 设置伤害值
-- native EXSetEventDamage takes real amount returns boolean
function mt.setDamage(amount)
    return japi.EXSetEventDamage(amount)
end

-- 任意单位伤害系统
function mt.Init_A()
    -- 注册数量
    local Number = 0
    -- 触发队列
    local Queue = {}
    -- 注册触发器
    local yd_Trigger = nil

    -- 过滤器
    local function filter()
        if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then
            TriggerRegisterUnitEvent(yd_Trigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
        end
        return false
    end

    -- 伤害系统注册
    function mt.RegistSyStemTrigger(trg)
        if trg == nil then
            return
        end
        -- 初始化
        if Number == 0 then
            yd_Trigger = CreateTrigger()
            TriggerAddAction(yd_Trigger, function()
                for i = 0, Number do
                    -- 触发器存在，触发器可以运行，触发器条件成立
                    if Queue[i] ~= nil and IsTriggerEnabled(Queue[i]) and TriggerEvaluate(Queue[i]) then
                        TriggerExecute(Queue[i])
                    end
                end
            end)
            local t, r, g = CreateTrigger(), CreateRegion(), CreateGroup()
            -- 把矩形添加进区域
            RegionAddRect(r, GetWorldBounds())
            -- 注册进入区域事件
            TriggerRegisterEnterRegion(t, r, Condition(filter))
            -- 选取矩形内单位
            GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(filter))

            DestroyGroup(g)
        end

        Queue[Number] = trg
        Number = Number + 1
    end
end

-- 初始化
function mt.Init()
    mt.Init_A()
end

mt.Init()

return mt
