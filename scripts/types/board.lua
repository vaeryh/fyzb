local mt = {}

mt.listBoard = {}

-- 创建多面板
function mt.create()
    local b = CreateMultiboard()
    table.insert(mt.listBoard, b)
    return b
end
-- 删除多面板
function mt.remove(b)
    DestroyMultiboard(b)
end
-- 清除多面板
function mt.setClear(b)
    MultiboardClear(b)
end

-- 设置最大化/最小化
function mt.setMinimize(b, minimize)
    MultiboardMinimize(b, minimize)
end
-- 获取当前最大化/最小化
function mt.getIsMinimized(b)
    return IsMultiboardMinimized(b)
end

-- 设置行数(排)
function mt.setetRowCount(b, rows)
    MultiboardSetRowCount(b, rows)
end
-- 设置列数
function mt.setColumnCount(b, cols)
    MultiboardSetColumnCount(b, cols)
end

-- 设置状态(ture:显示)
function mt.setDisplay(b, bol)
    MultiboardDisplay(b, bol)
end
-- 获取当前显示状态
function mt.getIsDisplayed(lb)
    return IsMultiboardDisplayed(lb)
end

-- 设置标题
function mt.setTitleText(b, title)
    MultiboardSetTitleText(b, title)
end
-- 获取标题
function mt.getTitleText(b)
    return MultiboardGetTitleText(b)
end

-- 设置标题颜色
function mt.setTitleTextColor(b, red, green, bule, alpha)
    MultiboardSetTitleTextColor(b, red, green, bule, alpha)
end

-- 获取项目(行、列)
function mt.getItem(b, rows, cols)
    return MultiboardGetItem(b, rows, cols)
end

-- 删除项目(行、列)
function mt.removeItem(b, rows, cols)
    MultiboardReleaseItem(b, rows, cols)
end
----------------------------------------------------------------------
-- 设置指定项目风格(文字，图标)
function mt.setItemStyle(mbi, bolA, bolB)
    MultiboardSetItemStyle(mbi, bolA, bolB)
end
-- 设置指定项目文本
function mt.setItemValue(mbi, text)
    local text = text or "nil"
    MultiboardSetItemValue(mbi, text)
end
-- 设置指定项目图标
function mt.setItemIcon(mbi, path)
    MultiboardSetItemIcon(mbi, path)
end
-- 设置指定项目颜色
function mt.setItemValueColor(mbi, red, green, bule, alpha)
    MultiboardSetItemValueColor(mbi, red, green, bule, alpha)
end
-- 设置指定项目宽度
function mt.setItemWidth(mbi, width)
    MultiboardSetItemWidth(mbi, width)
end
----------------------------------------------------------------------
-- 设置所有项目风格(文字，图标)
function mt.setItemsStyle(mbi, bolA, bolB)
    MultiboardSetItemsStyle(mbi, bolA, bolB)
end
-- 设置所有项目文本
function mt.setItemsValue(mbi, text)
    MultiboardSetItemsValue(mbi, text)
end
-- 设置所有项目图标
function mt.setItemsIcon(mbi, path)
    MultiboardSetItemsIcon(mbi, path)
end
-- 设置所有项目颜色
function mt.setItemsValueColor(mbi, red, green, bule, alpha)
    MultiboardSetItemsValueColor(mbi, red, green, bule, alpha)
end
-- 设置所有项目宽度
function mt.setItemsWidth(mbi, width)
    MultiboardSetItemsWidth(mbi, width)
end
----------------------------------------------------------------------
-- 创建多面板
function mt.new(rows, cols, title)
    local b = mt.create()
    mt.setetRowCount(b, rows)
    mt.setColumnCount(b, cols)
    mt.setTitleText(b, title)
    mt.setDisplay(b, true)
    return b
end

-- 设置动态文本
function mt.setItemDynamic(mbi, rows, cols, text)
    local item = mt.getItem(mbi, rows, cols)
    mt.setItemValue(item, text)
end

return mt
