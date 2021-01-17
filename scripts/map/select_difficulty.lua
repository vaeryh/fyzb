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
local trigger = CreateTrigger()
trg.reg.TimerEvent(trigger, 0.00, false)
trg.add.Actions(trigger, function()
    -- 对话框标题
    dia.setDiaTitle(mt.dialog, "|cff00e284难度选择|r")
    -- 对话框按钮
    for i = 1, #mt.textDiffculty do
        mt.dialog_button[i] = dia.addDiaButton(mt.dialog, mt.textDiffculty[i])
    end
    -- 显示对话框
    dia.setDiaDisplay(Player(0), mt.dialog, true)
    -- 注册
    trg.remove()
end)
-- trg.regTimeEvent(0.00, fasle, function()
--     -- 对话框标题
--     dia.setDiaTitle(mt.dialog, "|cff00e284难度选择|r")
--     -- 对话框按钮
--     for i = 1, #mt.textDiffculty do
--         mt.dialog_button[i] = dia.addDiaButton(mt.dialog, mt.textDiffculty[i])
--     end
--     -- 显示对话框
--     DialogDisplay(Player(0), mt.dialog, true)
--     dia.setDiaDisplay(Player(0), mt.dialog, true)
--     -- 注册
--     trg.remove()
-- end)

-- 注册对话框点击事件
local trig = CreateTrigger()
trg.reg.DialogEvent(trig, mt.dialog)
trg.add.Actions(trig, function()
    local string = "玩家一" .. GetPlayerName(GetTriggerPlayer())
    -- 普通
    for i = 1, #mt.textDiffculty do
        if mt.dialog_button[i] == dia.getClickedButton() then
            mt.leveling = i
            DisplayTextToPlayer(GetLocalPlayer(), 0, 0, (string .. "选择了" .. mt.textDiffculty[i] .. "难度"))
        end
    end
    trg.remove() -- 删除一次性触发器
end)

-- trg.regDialogEvent(mt.dialog, function()
--     local string = "玩家一" .. GetPlayerName(GetTriggerPlayer())
--     -- 普通
--     for i = 1, #mt.textDiffculty do
--         if mt.dialog_button[i] == dia.getClickedButton() then
--             mt.leveling = i
--             DisplayTextToPlayer(GetLocalPlayer(), 0, 0, (string .. "选择了" .. mt.textDiffculty[i] .. "难度"))
--         end
--     end
--     trg.remove() -- 删除一次性触发器
-- end)
