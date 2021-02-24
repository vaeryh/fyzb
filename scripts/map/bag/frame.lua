local mt = {}

-- 物品提示UI
function mt.Init_B()
    -- 物品提示背景
    mt.showBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    gDz.FrameSetPoint(mt.showBack, 8, mt.mainBack, 6, 0.0, 0.0)
    oUI:setSize(0.18, 0.166)
    oUI:setShow(false)
    -- 物品提示标题
    mt.title = oUI:createByTag("TEXT", mt.showBack, "ProTextTemplate")
    gDz.FrameSetSize(mt.title, 0.14, 0.01)
    gDz.FrameSetText(mt.title, "|cff31e40d物品属性")
    gDz.FrameSetPoint(mt.title, 1, mt.showBack, 1, 0.00, -0.01)
    -- 物品提示第一行
    mt.showText1 = oUI:createByTag("TEXT", mt.showBack, "ProText")
    gDz.FrameSetSize(mt.showText1, 0.09, 0.01)
    gDz.FrameSetText(mt.showText1, "|cff1cdad0属性：|r")
    gDz.FrameSetPoint(mt.showText1, 0, mt.showBack, 0, 0.01, -0.02)
    -- 物品提示第二行
    mt.showText2 = oUI:createByTag("TEXT", mt.showBack, "ProText")
    gDz.FrameSetSize(mt.showText2, 0.14, 0.06)
    gDz.FrameSetText(mt.showText2, "防御+10")
    gDz.FrameSetPoint(mt.showText2, 0, mt.showText1, 6, 0.01, -0.01)
    -- 物品提示第三行
    mt.showText3 = oUI:createByTag("TEXT", mt.showBack, "ProText")
    gDz.FrameSetSize(mt.showText3, 0.09, 0.01)
    gDz.FrameSetText(mt.showText3, "|cff1cdad0描述：|r")
    gDz.FrameSetPoint(mt.showText3, 0, mt.showText2, 6, -0.01, -0.01)
    -- 物品提示第四行
    mt.showText4 = oUI:createByTag("TEXT", mt.showBack, "ProText")
    gDz.FrameSetSize(mt.showText4, 0.155, 0.08)
    gDz.FrameSetText(mt.showText4, "防御+10")
    gDz.FrameSetPoint(mt.showText4, 0, mt.showText3, 6, 0.01, -0.01)
end

-- 背包格子UI
function mt.Init_A()
    -- 背包背景
    mt.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.614, 0.45):setSize(0.186, 0.29):setShow(false)

    mt.but, mt.but_back = {}, {} -- 按钮 按钮背景
    mt.charges_back, mt.charges_text = {}, {} -- 使用次数背景 使用次数
    for i = 1, 42 do
        -- 背包按钮
        mt.but[i] = oUI:createByTag("BUTTON", mt.mainBack, "BagButton")
        -- 背包按钮背景
        mt.but_back[i] = oUI:createByTag("BACKDROP", mt.but[i], "BagButtonBackdrop")
        oUI:setRelative(4, mt.but[i], 4, 0.0, 0.0)
        -- 背包物品使用次数背景
        mt.charges_back[i] = oUI:createByTag("BACKDROP", mt.but_back[i], "BagChargesBackdrop")
        oUI:setRelative(8, mt.but_back[i], 8, -0.004, 0.004)
        -- 背包物品使用次数文本
        mt.charges_text[i] = oUI:createByTag("TEXT", mt.charges_back[i], "BagChargesText")
        oUI:setRelative(4, mt.charges_back[i], 4, 0.0, 0.0)
    end
    -- 背包后续格子位置
    for i = 1, 42 - 1 do
        if i == 1 then
            gDz.FrameSetPoint(mt.but[1], 0, mt.mainBack, 0, 0.003, -0.01)
        end
        if i % 6 == 0 then
            gDz.FrameSetPoint(mt.but[i + 1], 1, mt.but[i - 5], 7, 0.0, 0.0)
        else
            gDz.FrameSetPoint(mt.but[i + 1], 3, mt.but[i], 5, 0.0, 0.0)
        end
    end
end

-- 虚拟物品栏UI
function mt.Init_C()
    -- 虚拟按钮
    mt.xnBut, mt.xnBut_back = {}, {}
    mt.xnBut_charges_back, mt.xnBut_charges_text = {}, {}

    for i = 0, 5 do
        -- 虚拟按钮
        mt.xnBut[i] = gDz.CreateFrameByTagName("BUTTON", nil, mt.mainBack)
        gDz.FrameSetSize(mt.xnBut[i], 0.0313, 0.0313)
        -- 虚拟按钮背景
        mt.xnBut_back[i] = oUI:createByTag("BACKDROP", mt.xnBut[i], "BagXuNiBackdrop")
        gDz.FrameSetTexture(mt.xnBut_back[i],'ReplaceableTextures\\CommandButtons\\BTNRingGreen.blp',0)
        oUI:setRelative(4, mt.xnBut[i], 4, 0.0, 0.0)
        -- 虚拟物品使用次数背景
        mt.xnBut_charges_back[i] = oUI:createByTag("BACKDROP", mt.xnBut_back[i], "BagXuNiMinGridBackdrop")
        oUI:setRelative(8, mt.xnBut_back[i], 8, 0.0, 0.0)
        -- 虚拟物品使用次数文本
        mt.xnBut_charges_text[i] = oUI:createByTag("TEXT", mt.xnBut_charges_back[i], "BagXuNiMinGridText")
        oUI:setRelative(4, mt.xnBut_charges_back[i], 4, 0.0, -0.0006)
    end
    -- 虚拟按钮绝对位置
    gDz.FrameSetAbsolutePoint(mt.xnBut[0], 0, 0.516, 0.111)
    gDz.FrameSetAbsolutePoint(mt.xnBut[1], 0, 0.556, 0.111)
    gDz.FrameSetAbsolutePoint(mt.xnBut[2], 0, 0.516, 0.073)
    gDz.FrameSetAbsolutePoint(mt.xnBut[3], 0, 0.556, 0.073)
    gDz.FrameSetAbsolutePoint(mt.xnBut[4], 0, 0.516, 0.035)
    gDz.FrameSetAbsolutePoint(mt.xnBut[5], 0, 0.556, 0.035)
end

-- 初始化背包UI
function mt.Init()
    mt.Init_A()
    mt.Init_B()
    mt.Init_C()
end

mt.Init()

return mt
