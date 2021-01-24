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
function mt.setUpHeroLevel(hero, level, bol)
    SetHeroLevel(hero, level, bol)
end

-- 设置降低英雄等级
function mt.setDownHeroLevel(hero, level)
    UnitStripHeroLevel(hero, level)
end

-- 获取英雄等级
function mt.getHeroLevel(hero)
    return GetHeroLevel(hero)
end

-- 获取单位
function mt:get()
    return self.handle
end
-- 删除单位
function mt:remove()
    return jass.RemoveUnit(self.handle)
end
-- 获得属性
function mt:getStr()
    return jass.GetHeroStr(self.handle, true)
end

function mt:getAgi()
    return jass.GetHeroAgi(self.handle, true)
end

function mt:getInt()
    return jass.GetHeroInt(self.handle, true)
end

-- 设置属性
function mt:setStr(n)
    jass.SetHeroStr(self.handle, n, true)
end

function mt:setAgi(n)
    jass.SetHeroAgi(self.handle, n, true)
end

function mt:setInt(n)
    jass.SetHeroInt(self.handle, n, true)
end

-- 创建英雄
function mt:create(x, y)
    local x, y = x, y or 0, 0
    self.handle = CreateUnit(Player(15), yh.s2id(self.id), x, y, 270)
    return self.handle
end

-- 暂停经验获取
function mt.SuspendHeroXP(hero, bol)
    SuspendHeroXP(hero, bol)
end


return mt
