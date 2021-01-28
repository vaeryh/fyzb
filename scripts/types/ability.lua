local japi = require 'jass.japi'

-- 技能
local mt = {}

ABILITY_DATA = {
    -- 冷却时间-- real
    COOLDOWN = 1,
    -- 目标-- integer
    TARGS = 100,
    -- 施放时间-- real
    CAST = 101,
    -- 持续时间(普通)-- real
    DUR = 102,
    -- 持续时间(英雄)-- real
    HERODUR = 103,
    -- 魔法消耗 -- integer
    COST = 104,
    -- 施放间隔-- real
    COOL = 105,
    -- 影响区域
    AREA = 106, -- real
    -- 施放距离
    RNG = 107, -- real
    -- 数据A
    DATA_A = 108, -- real
    -- 数据B
    DATA_B = 109, -- real
    -- 数据C
    DATA_C = 110, -- real
    -- 数据D
    DATA_D = 111, -- real
    -- 数据E
    DATA_E = 112, -- real
    -- 数据F
    DATA_F = 113, -- real
    -- 数据G
    DATA_G = 114, -- real
    -- 数据H
    DATA_H = 115, -- real
    -- 数据I
    DATA_I = 116, -- real
    -- 单位类型
    UNITID = 117, -- integer
    -- 热键
    HOTKET = 200, -- integer
    -- 关闭热键
    UNHOTKET = 201, -- integer
    -- 学习热键
    RESEARCH_HOTKEY = 202, -- integer
    -- 名字
    NAME = 203, -- string
    -- 图标
    ART = 204, -- string
    -- 目标效果
    TARGET_ART = 205, -- string
    -- 施法者效果
    CASTER_ART = 206, -- string
    -- 目标点效果
    EFFECT_ART = 207, -- string
    -- 区域效果
    AREAEFFECT_ART = 208, -- string
    -- 投射物效果
    MISSILE_ART = 209, -- string
    -- 特殊效果
    SPECIAL_ART = 210, -- string
    -- 闪电效果
    LIGHTNING_EFFECT = 211, -- string
    -- buff提示
    BUFF_TIP = 212, -- string
    -- buff提示(扩展)
    BUFF_UBERTIP = 213, -- string
    -- 学习提示
    RESEARCH_TIP = 214, -- string
    -- 提示
    TIP = 215, -- string
    -- 关闭提示
    UNTIP = 216, -- string
    -- 学习提示(扩展)
    RESEARCH_UBERTIP = 217, -- string
    -- 提示(扩展)
    UBERTIP = 218, -- string
    -- 关闭提示(扩展)
    UNUBERTIP = 219, -- string
    -- 暗图标
    UNART = 220 -- string
}
-- 设置单位技能属性 实数
function mt.setAbiDataReal(unit, id, abiLev, data_type, value)
    local abi = japi.EXGetUnitAbility(unit, gYh.s2id(id))
    japi.EXSetAbilityDataReal(abi, abiLev, data_type, value)
end

-- 设置单位技能属性 整数
function mt.setAbiDataInteger(unit, id, abiLev, data_type, value)
    local abi = japi.EXGetUnitAbility(unit, gYh.s2id(id))
    japi.EXSetAbilityDataInteger(abi, abiLev, data_type, value)
end

-- 设置技能 冷却时间：1
function mt.setAbiDataInteger(unit, id, data_type, value)
    local abi = japi.EXGetUnitAbility(unit, gYh.s2id(id))
    japi.EXSetAbilityState(abi, data_type, value)
end
return mt
