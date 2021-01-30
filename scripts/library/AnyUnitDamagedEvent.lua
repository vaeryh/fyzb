local japi = require 'jass.japi'
-- 伤害事件
local mt = {}

-- 数量
local Number = 0

-- 队列
local Queue = {}

-- 单位触发器
local yd_Trigger = nil

local function filter()
    if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then
        TriggerRegisterUnitEvent(yd_Trigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
    end
    return false
end

-- 系统注册
function mt.SyStemRegistTrigger(trg)
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
        local t,r,g = CreateTrigger(),CreateRegion(),CreateGroup()
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

--===============================================================================================

local EVENT_DAMAGE_DATA_VAILD = 0
local EVENT_DAMAGE_DATA_IS_PHYSICAL = 1
local EVENT_DAMAGE_DATA_IS_ATTACK = 2
local EVENT_DAMAGE_DATA_IS_RANGED = 3
local EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4
local EVENT_DAMAGE_DATA_WEAPON_TYPE = 5
local EVENT_DAMAGE_DATA_ATTACK_TYPE = 6

-- native EXGetEventDamageData takes integer edd_type returns integer
-- native EXSetEventDamage takes real amount returns boolean
-- 是否物理伤害
function IsEventPhysicalDamage()
    return 0 ~= japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL)
end
-- 是否攻击伤害
function IsEventAttackDamage()
    return 0 ~= japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)
end
-- 是否远程伤害
function IsEventRangedDamage()
    return 0 ~= japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED)
end
-- 伤害类型
function IsEventDamageType(damageType)
    return damageType == ConvertDamageType(japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE))
end
-- 武器类型
function IsEventWeaponType(weaponType)
    return weaponType == ConvertWeaponType(japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE))
end
-- 攻击类型
function IsEventAttackType(attackType)
    return attackType == ConvertAttackType(japi.EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE))
end
-- 设置伤害值
function SetEventDamage(amount)
    return japi.EXSetEventDamage(amount)
end

return mt
