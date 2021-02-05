local mt = {}

-- 句柄
mt.handle = 0

-- 单位类型
mt.unit_type = '英雄'

-- 所有者
mt.owner = nil

-- 存活
mt._is_alive = true

-- 物编Id
mt.id = "Hmkg"

-- 名称
mt.name = "山丘之王"

-- 称谓
mt.propernames = "波尔-碎石者,穆林-铁壁,"

-- 设置提升英雄等级
function mt.setUpLevel(hero, level, bol)
    SetHeroLevel(hero, level, bol)
end

-- 设置降低英雄等级
function mt.setDownLevel(hero, level)
    UnitStripHeroLevel(hero, level)
end

-- 获取英雄等级
function mt.getLevel(hero)
    return GetHeroLevel(hero)
end

-- =============================================================================================

-- 获得属性力量
function mt.getStr(hero)
    return GetHeroStr(hero, true)
end
-- 获得属性敏捷
function mt.getAgi(hero)
    return GetHeroAgi(hero, true)
end
-- 获得属性智力
function mt.getInt(hero)
    return GetHeroInt(hero, true)
end

-- 设置属性力量
function mt.setStr(hero, value)
    SetHeroStr(hero, value, true)
end
-- 设置属性敏捷
function mt.setAgi(hero, value)
    SetHeroAgi(hero, value, true)
end
-- 设置属性智力
function mt.setInt(hero, value)
    SetHeroInt(hero, value, true)
end

-- 调整属性力量
function mt.adjustStr(hero, value)
    local old = mt.getStr(hero)
    SetHeroStr(hero, value, true)
end
-- 调整属性敏捷
function mt.adjustAgi(hero, value)
    SetHeroAgi(hero, value, true)
end
-- 调整属性智力
function mt.adjustInt(hero, value)
    SetHeroInt(hero, value, true)
end

-- 获取主属性
function mt.getMain(hero)
    local main = gSlk.getUnitString(hero, 'Primary')
    if main == "STR" then
        return mt.getStr(hero)
    elseif main == "AGI" then
        return mt.getAgi(hero)
    elseif main == "INT" then
        return mt.getInt(hero)
    end
    return log.warn("单位不是英雄，没主属性")
end

-- 获取三属性
function mt.getThree(hero)
    return mt.getStr(hero) + mt.getAgi(hero) + mt.getInt(hero)
end
-- =============================================================================================

-- 设置经验获取(true:允许)
function mt.SuspendXP(hero, bol)
    SuspendHeroXP(hero, bol)
end

-- 复活英雄(true:复活特效)
function mt.revive(hero, x, y, bol)
    ReviveHero(hero, x, y, bol)
end

return mt
