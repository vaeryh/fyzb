local mt = {}

-- 对话框
mt.dialog = gDia.createDialog()

-- 对话框按钮
mt.dialog_button = {}

-- 难度字符串
mt.textDiffculty = {"|cffffffff普通|r", "|cffff9900困难|r", "|cffff0000地狱|r", "|cffff00c8无尽|r"}

-- 难度等级(默认1)
mt.level = 1

-- 本局选择难度
mt.leveling = 1

-- 创建对话框
gTrg.RegTimerEvent(0.00, false, function()
    -- 对话框标题
    gDia.setDiaTitle(mt.dialog, "|cff00e284难度选择|r")
    -- 对话框按钮
    for i = 1, #mt.textDiffculty do
        mt.dialog_button[i] = gDia.addDiaButton(mt.dialog, mt.textDiffculty[i])
    end
    -- 显示对话框
    gDia.setDiaDisplay(Player(0), mt.dialog, true)
    -- 注册
    gTrg.RegDialogEvent(mt.dialog, mt.ChooseDiffculty)

    gTrg.remove()
end)

-- 注册对话框点击事件
function mt.ChooseDiffculty()
    local string = "玩家一" .. GetPlayerName(GetTriggerPlayer())
    -- 普通
    for i = 1, #mt.textDiffculty do
        if mt.dialog_button[i] == gDia.getClickedButton() then
            mt.leveling = i
            DisplayTextToPlayer(GetLocalPlayer(), 0, 0, (string .. "选择了" .. mt.textDiffculty[i] .. "难度"))
        end
    end
    gTrg.remove() -- 删除一次性触发器
end
