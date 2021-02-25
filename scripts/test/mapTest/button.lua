local mt = {}

function mt.Init_A()
    -- 背景
    mt.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.614, 0.45):setSize(0.12, 0.12):setShow(true)
    --
    mt.name = oUI:createByTag("TEXT", mt.mainBack, nil)
    oUI:setRelative(0, mt.mainBack, 0, 0.001, 0.001):setSize(0.07, 0.01)
    gDz.FrameSetText()
    --
    mt.but, mt.but_back = {}, {} -- 按钮 按钮背景
    mt.charges_back, mt.charges_text = {}, {} -- 使用次数背景 使用次数
    for i = 1, 12 do
        -- 按钮
        mt.but[i] = oUI:createByTag("BUTTON", mt.mainBack, "BagButton")
        -- 按钮背景
        mt.but_back[i] = oUI:createByTag("BACKDROP", mt.but[i], "BagButtonBackdrop")
        oUI:setRelative(4, mt.but[i], 4, 0.0, 0.0)
        -- 使用次数背景
        mt.charges_back[i] = oUI:createByTag("BACKDROP", mt.but_back[i], "BagChargesBackdrop")
        oUI:setRelative(8, mt.but_back[i], 8, -0.004, 0.004)
        -- 使用次数文本
        mt.charges_text[i] = oUI:createByTag("TEXT", mt.charges_back[i], "BagChargesText")
        oUI:setRelative(4, mt.charges_back[i], 4, 0.0, 0.0)
    end
    -- 背包后续格子位置
    for i = 1, 12 - 1 do
        if i == 1 then
            gDz.FrameSetPoint(mt.but[1], 0, mt.name, 0, 0.003, -0.01)
        end
        if i % 4 == 0 then
            gDz.FrameSetPoint(mt.but[i + 1], 1, mt.but[i - 3], 7, 0.0, 0.0)
        else
            gDz.FrameSetPoint(mt.but[i + 1], 3, mt.but[i], 5, 0.0, 0.0)
        end
    end
end

function mt.Init()
    mt.Init_A()
end

mt.Init()

return mt
