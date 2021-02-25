local mt = {}

function mt.Init_B()
    -- 背景
    mt.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.214, 0.50):setSize(0.35, 0.18):setShow(true)
    --单位图标
    mt.unit_art = oUI:createByTag("BACKDROP", mt.mainBack, nil)
    oUI:setRelative(0, mt.mainBack, 0, 0.003, -0.003):setSize(0.03, 0.04):setTexture("ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp")
    -- 单位名称
    mt.unit_name = oUI:createByTag("TEXT", mt.mainBack, nil)
    oUI:setRelative(3, mt.unit_art, 5, 0.005, 0.0):setSize(0.05, 0.01):setText('单位名称')
    mt.pro_text = {} -- 属性名称
    mt.but_up, mt.but_do = {}, {} -- 按钮 按钮背景
    --
    for i = 1, 10 do
        -- 属性名称
        mt.pro_text[i] = oUI:createByTag("TEXT", mt.mainBack, nil)
        oUI:setSize(0.04, 0.01):setText('外功:+10')
        -- 增加按钮
        mt.but_up[i] = oUI:createByTag("GLUETEXTBUTTON", mt.pro_text[i], nil)
        oUI:setRelative(3, mt.pro_text[i], 5, 0.002, 0.0):setSize(0.018, 0.024)
        local frame = oUI:createByTag("BACKDROP", mt.but_up[i], "BagButtonBackdrop")
        oUI:setAllPoints(mt.but_up[i]):setTexture("UI\\Widgets\\Glues\\ThumbsUp-Up.blp")
        -- 减少按钮
        mt.but_do[i] = oUI:createByTag("GLUETEXTBUTTON", mt.pro_text[i], nil)
        oUI:setRelative(3, mt.but_up[i], 4, 0.006, 0.0):setSize(0.018, 0.024)
        local frame = oUI:createByTag("BACKDROP", mt.but_do[i], "BagButtonBackdrop")
        oUI:setAllPoints(mt.but_do[i]):setTexture("UI\\Widgets\\Glues\\ThumbsDown-Up.blp")
    end
    for i = 1, 10 - 1 do
        if i == 1 then
            gDz.FrameSetPoint(mt.pro_text[1], 0, mt.unit_art, 6, 0.003, -0.01)
        end
        if i % 4 == 0 then
            gDz.FrameSetPoint(mt.pro_text[i + 1], 1, mt.pro_text[i - 3], 7, 0.0, -0.01)
        else
            gDz.FrameSetPoint(mt.pro_text[i + 1], 3, mt.but_do[i], 5, 0.0, 0.0)
        end
    end
end

function mt.Init_A()
    -- 背景
    mt.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.614, 0.45):setSize(0.12, 0.12):setShow(true)
    --
    mt.name = oUI:createByTag("TEXT", mt.mainBack, nil)
    oUI:setRelative(0, mt.mainBack, 0, 0.002, -0.01):setSize(0.07, 0.01):setText('单位名称')
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
    -- mt.Init_A()
    mt.Init_B()
end

mt.Init()

return mt
