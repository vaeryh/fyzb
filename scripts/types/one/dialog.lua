-- 对话框
local mt = {}
-- 类型
mt.type = 'dialog'

-- 创建对话框
function mt.createDialog()
    return DialogCreate()
end

-- 添加对话框按钮
function mt.addDiaButton(dialog, str, hotKey)
    local hotKey = hotKey or 0
    return DialogAddButton(dialog, str, hotKey)
end
-- 设置对话框标题
function mt.setDiaTitle(dialog, title)
    DialogSetMessage(dialog, title)
end

-- 获取当前按下对话框按钮
function mt.getClickedButton()
    return GetClickedButton()
end

-- 设置对话框状态
function mt.setDiaDisplay(p, dialog, state)
    DialogDisplay(p, dialog, state)
end

return mt
