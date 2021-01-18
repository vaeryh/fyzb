local trg = require 'types.trigger'
local dia = require 'types.dialog'

local mt = {}

-- 对话框
mt.dialog = dia.createDialog()

-- 对话框按钮
mt.dialog_button = {}

-- 难度字符串
mt.textDiffculty = {"|cffffffff普通|r", "|cffff9900困难|r", "|cffff0000地狱|r", "|cffff00c8无尽|r"}

-- 难度等级(默认1)
mt.level = 1

-- 本局选择难度
mt.leveling = 1

-- 创建对话框
trg.RegTimerEvent(0.00, fasle, function()
    -- 对话框标题
    dia.setDiaTitle(mt.dialog, "|cff00e284难度选择|r")
    -- 对话框按钮
    for i = 1, #mt.textDiffculty do
        mt.dialog_button[i] = dia.addDiaButton(mt.dialog, mt.textDiffculty[i])
    end
    -- 显示对话框
    dia.setDiaDisplay(Player(0), mt.dialog, true)
    -- 注册
    trg.CreateTrigger()
    trg.RegDialogEvent(mt.dialog, mt.ChooseDiffculty)

    trg.remove()
end)

-- 注册对话框点击事件
function mt.ChooseDiffculty()
    local string = "玩家一" .. GetPlayerName(GetTriggerPlayer())
    -- 普通
    for i = 1, #mt.textDiffculty do
        if mt.dialog_button[i] == dia.getClickedButton() then
            mt.leveling = i
            DisplayTextToPlayer(GetLocalPlayer(), 0, 0, (string .. "选择了" .. mt.textDiffculty[i] .. "难度"))
        end
    end
    trg.remove() -- 删除一次性触发器
end
