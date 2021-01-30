local japi = require 'jass.japi'

local mt = {}

-- 类型
mt.type = "effect"

EFFECT_TYPE = {
    -- 点目标效果
    EFFECT = EFFECT_TYPE_EFFECT,
    -- 目标效果
    TARGET = EFFECT_TYPE_TARGET,
    -- 施法者效果
    CASTER = EFFECT_TYPE_CASTER,
    -- 特殊效果
    SPECIAL = EFFECT_TYPE_SPECIAL,
    -- 区域效果
    AREA_EFFECT = EFFECT_TYPE_AREA_EFFECT,
    -- 投射物效果
    MISSILE = EFFECT_TYPE_MISSILE,
    -- 闪电效果
    LIGHTNING = EFFECT_TYPE_LIGHTNING
}

-- 删除特效
function mt.remove(eff)
    DestroyEffect(eff)
end

-- 定时删除特效
function mt.removeTimer(timeout, eff)
    TimerStart(gT.create(), timeout, false, function()
        mt.remove(eff)
        gT.remove()
    end)
end

-- 新建特效(指定技能，创建到坐标)
function mt.addAbiXY(id, type, x, y)
    return AddSpellEffectById(gYh.s2id(id), type, x, y)
end
-- 新建特效(指定技能，创建到点)
function mt.addAbiLoc(id, type, loc)
    return AddSpellEffectByIdLoc(gYh.s2id(id), type, loc)
end
-- 新建特效(指定技能，创建到单位)
function mt.addAbiTarget(id, type, target, attachPoint)
    return AddSpellEffectTargetById(gYh.s2id(id), type, target, attachPoint)
end

-- 新建特效，创建到坐标
function mt.addXY(path, x, y)
    return AddSpecialEffect(path, x, y)
end
-- 新建特效，创建到点
function mt.addLoc(path, loc)
    return AddSpecialEffectLoc(path, loc)
end
-- 新建特效，创建到单位
function mt.addTarget(path, target, attachPoint)
    return AddSpecialEffectTarget(path, target, attachPoint)
end

---------------------------------------------------------------
-- 设置特效X轴缩放[ 1.00 ]，Y轴缩放[ 1.00 ]，Z轴缩放[ 1.00 ]
function mt.setScale(eff, x, y, z)
    local y = y or x
    local z = z or x
    japi.EXEffectMatScale(eff, x, y, z)
end

-- 设置特效动画播放速度
function mt.setSpeed(eff, speed)
    japi.EXSetEffectSpeed(eff, speed)
end

return mt
