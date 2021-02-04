local japi = require 'jass.japi'

local mt = {}

ITEM_DATA = {
    -- 提示string
    TIP = 4,
    -- 提示扩展string
    UBERTIP = 3,
    -- 图标string
    ART = 1
}
-- 设置属性
function mt.setDataString(itemcode, data_type, value)
    return japi.EXSetItemDataString(itemcode, data_type, value)
end
-- 获取属性
function mt.getDataString(itemcode, data_type)
    return japi.EXGetItemDataString(itemcode, data_type)
end

-- 创建物品
function mt.create(id, x, y)
    return CreateItem(gYh.s2id(id), x, y)
end
-- 删除物品
function mt.remove(item)
    RemoveItem(item)
end
-- 丢弃物品
function mt.drop(unit, item)
    UnitRemoveItem(unit, item)
end
-- 获取等级
function mt.getLevel(item)
    return GetItemLevel(item)
end
-- 获取类型
function mt.getTypeId(item)
    return GetItemTypeId(item)
end
-- 设置可见度(true:可见)
function mt.remove(item, bol)
    SetItemVisible(item, bol)
end
-- 设置物品坐标
function mt.setPosition(item, x, y)
    SetItemPosition(item, x, y)
end
-- 设置生命值
function mt.setWidgetLife(item, life)
    SetWidgetLife(item, life)
end

-- 设置使用次数
function mt.setCharges(item, num)
    SetItemCharges(item, num)
end
-- 获取使用次数
function mt.getCharges(item)
    return GetItemCharges(item)
end

-- 设置(true:无敌,false:可攻击的)
function mt.setInvulnerable(item, bol)
    SetItemInvulnerable(item, bol)
end
-- 设置抵押(true:可以)
function mt.setPawnable(item, bol)
    SetItemPawnable(item, bol)
end

-- 设置丢弃(true:允许)
function mt.setDroppable(item, bol)
    SetItemDroppable(item, bol)
end
-- 设置持有者死亡掉落
function mt.setDropOnDeath(item, bol)
    SetItemDropOnDeath(item, bol)
end
-- 设置物品所属玩家(true:改变颜色)
function mt.setPlayer(item, p, bol)
    SetItemPlayer(item, p, bol)
end

-- 是否匹配类型ID
function mt.isMatchTypeId(item, id)
    if type(id) == 'number' then
        return GetItemTypeId(item) == id
    elseif type(id) == 'string' then
        return GetItemTypeId(item) == gYh.s2id(id)
    end
end
-- 获取槽位号物品
function mt.getUnitInSlot(unit, index)
    return UnitItemInSlot(unit, index)
end
-- 获取槽位号
function mt.getHaveItemTypeCount(unit, itemId)
    local index = 0
    for i = 0, 5 do
        local indexItem = mt.getUnitInSlot(unit, i)
        if indexItem ~= nil and mt.isMatchTypeId(indexItem, itemId) then
            index = index + 1
        end
    end
    return index
end
-- 单位持有物品类型
function mt.isHave(unit, itemId)
    return mt.getHaveItemTypeCount(unit, itemId) > 0
end

return mt
