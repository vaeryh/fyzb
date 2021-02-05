local japi = require 'jass.japi'

-- 技能
local mt = {}

ABILITY_DATA = {
    -- 冷却时间real
    COOLDOWN = 1,
    -- 目标integer
    TARGS = 100,
    -- 施放时间real
    CAST = 101,
    -- 持续时间(普通)real
    DUR = 102,
    -- 持续时间(英雄)real
    HERODUR = 103,
    -- 魔法消耗 integer
    COST = 104,
    -- 施放间隔real
    COOL = 105,
    -- 影响区域real
    AREA = 106,
    -- 施放距离real
    RNG = 107,
    -- 数据Areal
    DATA_A = 108,
    -- 数据Breal
    DATA_B = 109,
    -- 数据Creal
    DATA_C = 110,
    -- 数据Dreal
    DATA_D = 111,
    -- 数据Ereal
    DATA_E = 112,
    -- 数据Freal
    DATA_F = 113,
    -- 数据Greal
    DATA_G = 114,
    -- 数据Hreal
    DATA_H = 115,
    -- 数据Ireal
    DATA_I = 116,
    -- 单位类型integer
    UNITID = 117,
    -- 热键integer
    HOTKET = 200,
    -- 关闭热键integer
    UNHOTKET = 201,
    -- 学习热键integer
    RESEARCH_HOTKEY = 202,
    -- 名字string
    NAME = 203,
    -- 图标string
    ART = 204,
    -- 目标效果string
    TARGET_ART = 205,
    -- 施法者效果string
    CASTER_ART = 206,
    -- 目标点效果string
    EFFECT_ART = 207,
    -- 区域效果string
    AREAEFFECT_ART = 208,
    -- 投射物效果string
    MISSILE_ART = 209,
    -- 特殊效果string
    SPECIAL_ART = 210,
    -- 闪电效果string
    LIGHTNING_EFFECT = 211,
    -- buff提示string
    BUFF_TIP = 212,
    -- buff提示(扩展)string
    BUFF_UBERTIP = 213,
    -- 学习提示string
    RESEARCH_TIP = 214,
    -- 提示string
    TIP = 215,
    -- 关闭提示string
    UNTIP = 216,
    -- 学习提示(扩展)string
    RESEARCH_UBERTIP = 217,
    -- 提示(扩展)string
    UBERTIP = 218,
    -- 关闭提示(扩展)string
    UNUBERTIP = 219,
    -- 暗图标string
    UNART = 220
}

-- 获取单位技能code
function mt.getUnitAbility(unit, id)
    if type(id) == "number" then
        return japi.EXGetUnitAbility(unit, id)
    elseif type(id) == "string" then
        return japi.EXGetUnitAbility(unit, gYh.s2id(id))
    end
end

-- ================================================================

-- 设置单位技能属性 实数
function mt.setDataReal(unit, id, abiLev, data_type, value)
    local abi = mt.getUnitAbility(unit, id)
    local abiLev = abiLev or mt.getLevel(unit, id)
    japi.EXSetAbilityDataReal(abi, abiLev, data_type, value)
end

-- 设置单位技能属性 整数
function mt.setDataInteger(unit, id, abiLev, data_type, value)
    local abi = mt.getUnitAbility(unit, id)
    local abiLev = abiLev or mt.getLevel(unit, id)
    japi.EXSetAbilityDataInteger(abi, abiLev, data_type, value)
end

-- 设置单位技能属性 字符串
function mt.setDataString(unit, id, abiLev, data_type, value)
    local abi = mt.getUnitAbility(unit, id)
    local abiLev = abiLev or mt.getLevel(unit, id)
    japi.EXSetAbilityDataString(abi, abiLev, data_type, value)
end

-- 设置技能 冷却时间：1
function mt.setDataState(unit, id, data_type, value)
    local abi = mt.getUnitAbility(unit, id)
    japi.EXSetAbilityState(abi, data_type, value)
end

-- ================================================================

-- 获取单位技能属性 实数
function mt.getDataReal(unit, id, abiLev, data_type)
    local abi = mt.getUnitAbility(unit, id)
    local abiLev = abiLev or mt.getLevel(unit, id)
    return japi.EXGetAbilityDataReal(abi, abiLev, data_type)
end

-- 获取单位技能属性 整数
function mt.getDataInteger(unit, id, abiLev, data_type)
    local abi = mt.getUnitAbility(unit, id)
    local abiLev = abiLev or mt.getLevel(unit, id)
    return japi.EXGetAbilityDataInteger(abi, abiLev, data_type)
end

-- 获取单位技能属性 字符串
function mt.getDataString(unit, id, abiLev, data_type)
    local abi = mt.getUnitAbility(unit, id)
    local abiLev = abiLev or mt.getLevel(unit, id)
    return japi.EXGetAbilityDataString(abi, abiLev, data_type)
end

-- 获取技能 冷却时间：1
function mt.getDataState(unit, id, data_type)
    local abi = mt.getUnitAbility(unit, id)
    return japi.EXGetAbilityState(abi, data_type)
end

-- ================================================================

-- 设置玩家单位技能允许性
function mt.setAvailable(p, id, bol)
    SetPlayerAbilityAvailable(p, gYh.s2id(id), bol)
end

-- ================================================================

-- 单位是否拥有技能
function mt.isHave(unit, id)
    return mt.getLevel(unit, id) > 0
end

-- 单位添加技能
function mt.add(u, id)
    UnitAddAbility(u, gYh.s2id(id))
end

-- 单位添加技能一定时间
function mt.addTimer(u, id, time)
    gAbi.add(u, id)
    gT.wait(time, function()
        gAbi.remove(u, id)
    end)
end

-- 单位移除技能
function mt.remove(u, id)
    UnitRemoveAbility(u, gYh.switch(id))
end

-- 设置单位技能等级
function mt.setLevel(unit, id, lev)
    SetUnitAbilityLevel(unit, gYh.switch(id), lev)
end

-- 获取单位技能等级
function mt.getLevel(unit, id)
    return GetUnitAbilityLevel(unit, gYh.switch(id))
end

return mt
