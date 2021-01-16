local mt = {}

-- 类型
mt.type = '可见度修正器'

-- 句柄
mt.handle = 0

-- FOG_OF_WAR_VISIBLE
-- 可见度 - 新建的 玩家1(红色) 可见度修正器 可见 影响区域: (可用地图区域) (对盟友 共享 视野, 不覆盖 单位视野)
function mt.createFog(player, rect, see, share, over)
    -- 默认可见
    see = see == false and 2 or 4
    -- 默认共享视野
    share = share ~= false and true or false
    -- 是否覆盖单位视野
    over = over and true or false
    return CreateFogModifierRect(player, see, rect, share, over)
end

-- 启用修正器
function mt.start(fog)
    FogModifierStart(fog)
end

-- 暂停修正器
function mt.stop()
    FogModifierStop(fog)
end

-- 摧毁修正器
function mt.remove()
    DestroyFogModifier(fog)
end

return mt
