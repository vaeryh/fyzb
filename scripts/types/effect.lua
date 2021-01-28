local mt = {}

-- 类型
mt.type = "effect"

-- 点目标效果
mt.EFFECT_TYPE_EFFECT = EFFECT_TYPE_EFFECT
-- 目标效果
mt.EFFECT_TYPE_TARGET = EFFECT_TYPE_TARGET
-- 施法者效果
mt.EFFECT_TYPE_CASTER = EFFECT_TYPE_CASTER
--特殊效果
mt.EFFECT_TYPE_SPECIAL = EFFECT_TYPE_SPECIAL
--区域效果
mt.EFFECT_TYPE_AREA_EFFECT = EFFECT_TYPE_AREA_EFFECT
--投射物效果
mt.EFFECT_TYPE_MISSILE = EFFECT_TYPE_MISSILE
--闪电效果
mt.EFFECT_TYPE_LIGHTNING = EFFECT_TYPE_LIGHTNING

-- 删除特效
function mt.remove(eff)
    DestroyEffect(eff)
end

-- 新建特效(指定技能，创建到坐标)
function mt.addAbiEffXY(id, type, x, y)
    return AddSpellEffectById(gYh.s2id(id), type, x, y)
end
-- 新建特效(指定技能，创建到点)
function mt.addAbiEffLoc(id, type, loc)
    return AddSpellEffectByIdLoc(gYh.s2id(id), type, loc)
end
-- 新建特效(指定技能，创建到单位)
function mt.addAbiEffTar(id, type, target, attachPoint)
    return AddSpellEffectTargetById(gYh.s2id(id), type, target, attachPoint)
end

-- 新建特效，创建到坐标
function mt.addEffXY(path, x, y)
    return AddSpecialEffect(path, x, y)
end
-- 新建特效，创建到点
function mt.addEffLoc(path, loc)
    return AddSpecialEffectLoc(path, loc)
end
-- 新建特效，创建到单位
function mt.addEffTar(path, target, attachPoint)
    return AddSpecialEffectTarget(path, target, attachPoint)
end

return mt
