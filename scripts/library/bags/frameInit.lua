local mt = {}

-- frame分类
mt.listFrame = {}

-- 获取按钮表
function mt:getButTab(key)
    return self.listFrame[key]
end
-- 获取按钮表的物品表
function mt:getButItemTab(key, p)
    return self.listFrame[key].item[p]
end
-- 创建
function mt:newButTab(but, index, but_back, charges_back, charges_text)
    local o = {}
    o.but = but
    o.index = index
    o.but_back = but_back
    o.charges_back = charges_back
    o.charges_text = charges_text
    self.listFrame[but] = o
    self.listFrame[index] = o
end

-- frame初始化
gTrg.RegTimerEvent(0.00, false, function()
    gDz.CreateFrame("BagFrame") -- 创建框架
    -- 背包背景
    mt.back_main = gDz.FrameFindByName("BagBackdrop")
    gDz.FrameShow(mt.back_main, false) -- 隐藏背包相关背景
    gDz.FrameSetAbsolutePoint(mt.back_main, 0, 0.50, 0.50) -- 设置绝对位置
    -- 吸附UI
    mt.adsorb = {
        back = gDz.CreateFrameByTagName("BACKDROP")
    }
    gDz.FrameShow(mt.adsorb.back, false)
    gDz.FrameSetSize(mt.adsorb.back, 0.027, 0.036)
    -- 关闭按钮
    mt.but_x = gDz.FrameFindByName("BagButtonX")
    gDz.FrameSetEnable(mt.but_x, false) -- 关闭按钮禁用
    -- gDz.FrameSetScriptByCode(mt.but_x, 1, mt.OnOff_Actions, false) -- 鼠标点击按钮
    -- F4打开背包
    gDz.TriggerRegisterKeyEvent(115, 0, true, mt.OnOff_Actions)
    -- 格子BagButtonTemplate
    for i = 1, 42 do
        -- 创建按钮
        local but = gDz.CreateFrameByTagName("BUTTON", nil, mt.back_main, "BagButtonTemplate")
        gDz.FrameSetSize(but, 0.03, 0.04)
        -- 创建物品贴图背景
        local but_back = gDz.CreateFrameByTagName("BACKDROP", nil, but, "BagBackdropTemplate")
        gDz.FrameSetSize(but_back, 0.03, 0.04)
        -- 创建物品使用次数背景
        local charges_back = gDz.CreateFrameByTagName("BACKDROP", nil, but, "BagMinGridBackdropTemplate")
        gDz.FrameSetSize(charges_back, 0.009, 0.012)
        -- 创建物品使用次数文本
        local charges_text = gDz.CreateFrameByTagName("TEXT", nil, charges_back, "BagMinGridTextTemplate")
        gDz.FrameSetSize(charges_text, 0.01, 0.005)
        -- 保存
        mt:newButTab(but, i, but_back, charges_back, charges_text)
    end
    -- 设置UI位置
    local list = mt:getButTab(1)
    -- 第一个格子位置
    gDz.FrameSetPoint(list.but, 0, mt.back_main, 0, 0.003, -0.01)
    gDz.FrameSetPoint(list.but_back, 4, list.but, 4, 0.0, 0.0)
    gDz.FrameSetPoint(list.charges_back, 8, list.but, 8, -0.004, 0.004)
    gDz.FrameSetPoint(list.charges_text, 4, list.charges_back, 4, 0.0, 0.0)
    -- 后续格子位置
    for i = 1, 42 - 1 do
        local f1, f2, f5 = mt:getButTab(i), mt:getButTab(i + 1)
        if i % 6 == 0 then
            gDz.FrameSetPoint(f2.but, 1, mt:getButTab(i - 5).but, 7, 0.0, 0.0)
        else
            gDz.FrameSetPoint(f2.but, 3, f1.but, 5, 0.0, 0.0)
        end
        gDz.FrameSetPoint(f2.but_back, 4, f2.but, 4, 0.0, 0.0)
        gDz.FrameSetPoint(f2.charges_back, 8, f2.but, 8, -0.004, 0.004)
        gDz.FrameSetPoint(f2.charges_text, 4, f2.charges_back, 4, 0.0, 0.0)
    end
end)

-- 打开背包
function mt.OnOff_Actions()
    if gDz.GetTriggerKeyPlayer() == GetLocalPlayer() then
        if gDz.FrameGetEnable(mt.but_x) == false then
            gDz.FrameSetEnable(mt.but_x, true)
            gDz.FrameShow(mt.back_main, true)
            gT.loop(1.01, mt.Refresh)
            -- gT.loop(1.01, mt.OnOff_Timer)
        else
            gDz.FrameSetEnable(mt.but_x, false)
            gDz.FrameShow(mt.back_main, false)
        end
    end
end

-- 刷新物品栏每一格的物品数据
function mt.Refresh()
    -- =====================================================================================
    if not gDz.FrameGetEnable(mt.but_x) then
        gT.remove()
    end
    -- =====================================================================================
    for i = 1, 42 do
        local frame = mt:getButTab(i)
        local item = mt:getButItemTab(i, GetLocalPlayer())
        -- 刷新格子是否有物品存在，存在即显示图标

        if item == nil then
            gDz.FrameShow(frame.but_back, false)
        else
            gDz.FrameShow(frame.but_back, true)
            local path = gSlk.getItemString(item, "Art")
            gDz.FrameSetTexture(frame.but_back, path, 0)
        end

        -- 刷新格子是否有可叠加物品存在（如：药水，材料）
        if gIt.getCharges(item) >= 1 then -- s叠加数量最大为99，限制再拾取时设置
            gDz.FrameShow(frame.charges_back, true)
            gDz.FrameSetText(frame.charges_text, gIt.getCharges(item))
        else
            gDz.FrameShow(frame.charges_back, false)
        end
    end
end

return mt
