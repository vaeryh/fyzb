local mt = {}

-- 类型
mt.unit = "unit"

-- 单位类型
mt.unit_type = 'unit'

-- 句柄
mt.handle = 0

-- 所有者
mt.owner = nil

-- 物编Id
mt.id = "hfoo"

-- 单位状态
mt.UNIT_STATE = {
    -- 生命值
    LIFE = UNIT_STATE_LIFE,
    -- 最大生命值
    MAX_LIFE = UNIT_STATE_MAX_LIFE,
    -- 魔法值
    MANA = UNIT_STATE_MANA,
    -- 最大魔法值
    MAX_MANA = UNIT_STATE_MAX_MANA,
    -- 护甲
    ARMOR = ConvertUnitState(0x20),
    -- 攻击范围
    ATK_Range = ConvertUnitState(0x16),
    -- 攻击间隔
    ATK_INTERVAL = ConvertUnitState(0x25),
    -- 攻击速度
    ATK_SPEED = ConvertUnitState(0x51),
    -- 基础伤害
    BASIC_DAMAGE = ConvertUnitState(0x12),
    -- 附加伤害
    ADD_DAMAGE = ConvertUnitState(0x13),
    -- 骰子数量
    DICE_NUM = ConvertUnitState(0x10),
    -- 骰子面数
    DICE_MNUM = ConvertUnitState(0x11)
}

-- 单位列表
mt.listUnit = {}

-- 创建单位
function mt.create(p, id, x, y, face)
    local u = CreateUnit(p, gYh.s2id(id), x, y, face)
    if u == nil then
        log.error(id, gYh.s2id(id))
    end
    table.insert(mt.listUnit, u)
    return u
end

-- 创建N个单位
function mt.createNum(num, p, id, x, y, face)
    local face = face or 270
    for i = 1, num do
        mt.create(p, id, x, y, face)
    end
    return u
end

-- 删除单位
function mt.remove(handle)
    RemoveUnit(handle)
end

-- 单位是否存活
function mt.is_alive(handle)
    return GetUnitState(handle, UNIT_STATE_LIFE) > 0
end

-- 返回单位坐标
function mt.getXY(u)
    return GetUnitX(u), GetUnitY(u)
end
-- 获取单位X坐标
function mt.getX(u)
    return GetUnitX(u)
end
-- 获取单位Y坐标
function mt.getY(u)
    return GetUnitY(u)
end

-- 立即移动单位到坐标
function mt.setUnitPosition(u, x, y)
    SetUnitPosition(u, x, y)
end

-- 设置单位坐标（不打断单位当前动作）
function mt.setXY(u, x, y)
    SetUnitX(u, x)
    SetUnitY(u, y)
end

-- 获取单位状态
function mt.getState(u, unitState)
    return gDz.GetUnitState(u, unitState)
end

-- 设置单位状态
function mt.setState(u, unitState, delta)
    -- SetUnitState(u, unitState, delta)
    gDz.SetUnitState(u, unitState, delta)
end

-- 调整单位状态
function mt.adjustState(u, unitState, delta)
    local oldstate = mt.getState(u, unitState)
    if oldstate + delta then

    end
    mt.setState(u, unitState, oldstate + delta)
end

-- 设置单位颜色
function mt.setUnitColor(u, red, green, blue, alpha)
    SetUnitVertexColor(u, red, green, blue, alpha)
end

-- 矩形是否包含坐标
function mt.RectContainsCoords(r, x, y)
    return GetRectMinX(r) <= x and x <= GetRectMaxX(r) and GetRectMinY(r) <= y and y <= GetRectMaxY(r)
end

-- 矩形是否包含点
function mt.RectContainsLoc(r, loc)
    return mt.RectContainsCoords(r, GetLocationX(loc), GetLocationY(loc))
end

-- 矩形是否包含单位
function mt.RectContainsUnit(r, unit)
    return mt.RectContainsCoords(r, GetUnitX(whichUnit), GetUnitY(whichUnit))
end

-- 获取单位技能等级
function mt.getAbiLev(unit, id)
    return GetUnitAbilityLevel(unit, gYh.s2id(id))
end

return mt
