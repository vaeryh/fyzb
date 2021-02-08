local f = require 'library.bags.frameInit'

local mt = {}

---------------------------------------------------------------------------------------------------
-- 鼠标按下使用微缩效果
gDz.TriggerRegisterMouseEvent(1, 1, true, function()
    local frame = f:getButTab(gDz.GetMouseFocus())
    if not frame then
        return
    end
    gDz.FrameSetScale(frame.but_back, 0.96)
    gT.loop(0.1, function()
        -- if mouse_state == 'mouse_left_down' or mouse_state == 'mouse_right_up' then
        -- printF(gDz.IsKeyDown(1),not gDz.IsKeyDown(2))
        if gDz.IsKeyDown(1) then
            gDz.FrameSetScale(frame.but_back, 0.96)
        else
            gDz.FrameSetScale(frame.but_back, 1.00)
            gT.remove()
        end
    end)
end)

-- -- 鼠标左键按下
-- gDz.TriggerRegisterMouseEvent(1, 0, true, function()
--     mouse_state = 'mouse_left_up'
-- end)

-- gDz.TriggerRegisterMouseEvent(1, 1, true, function()
--     mouse_state = 'mouse_left_down'
-- end)

-- gDz.TriggerRegisterMouseEvent(2, 0, true, function()
--     mouse_state = 'mouse_right_up'
-- end)

-- gDz.TriggerRegisterMouseEvent(2, 1, true, function()
--     mouse_state = 'mouse_right_down'
-- end)

-- 鼠标右键释放吸附
gDz.TriggerRegisterMouseEvent(2, 0, true, function()
    local p = gDz.GetTriggerKeyPlayer()
    local frame = f:getButTab(gDz.GetMouseFocus())
    if not frame then
        return
    end

    local adsorb = f.adsorb
    -- 吸附物品
    adsorb.item = f.listItem[p][frame.index]
    -- 吸附序号
    adsorb.index = frame.index
    gT.loop(0.01, function()
        local x = 0.80 * (I2R(gDz.GetMouseXRelative()) / I2R(gDz.GetWindowWidth()))
        local y = 0.60 - (0.60 * (I2R(gDz.GetMouseYRelative()) / I2R(gDz.GetWindowHeight())))

        -- 是否持续吸附判断
        if adsorb.item == nil then
            adsorb.index = nil -- 还原
            gDz.FrameShow(adsorb.back, false)
            gT.remove()
        else
            gDz.FrameShow(adsorb.back, true)
            local path = gSlk.getItemString(adsorb.item, "Art")
            gDz.FrameSetTexture(adsorb.back, path, 0)
            gDz.FrameSetAbsolutePoint(adsorb.back, 4, x, y)
        end
    end)

end)

---------------------------------------------------------------------------------------------------
-- 交换物品位置：来自背包
gDz.TriggerRegisterMouseEvent(1, 0, true, function()
    local p = gDz.GetTriggerKeyPlayer()
    local frame = f:getButTab(gDz.GetMouseFocus())
    if not frame then
        return
    end
    -- 触发按钮
    local listItem = f.listItem[p]
    -- 吸附frame
    local adsorb = f.adsorb
    -- 交换物品
    listItem[frame.index], listItem[adsorb.index] = adsorb.item, listItem[frame.index]
    adsorb.item = nil
end)

return mt
