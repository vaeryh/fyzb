-- frame初始化
local Init_A_Actions = function()
    -- 虚拟物品栏
    dz.CreateFrame("BagFrameXuNi")
    dz.FrameShow(dz.FrameFindByName("BagFrameXuNi"), false)
    dz.FrameSetAbsolutePoint(dz.FrameFindByName("BagButtonNum43", 0), 0, 0.516, 0.111)
    ----创建框架
    dz.CreateFrame("BagFrame")
    -- 隐藏背包相关背景
    dz.FrameShow(dz.FrameFindByName("BagBackdrop"), false)
    dz.FrameSetAbsolutePoint(dz.FrameFindByName("BagBackdrop"), 0, 0.6, 0.50) -- 设置绝对位置
    -- 吸附UI
    dz.FrameShow(dz.CreateFrame("BagAdsorbBackdrop"), false)
    dz.FrameScale(dz.FrameFindByName("BagAdsorbBackdrop"), 0.87)
    -- 关闭按钮禁用
    dz.FrameEnable(dz.FrameFindByName("BagButtonX"), false)
    -- X按钮 按键触发
    -- DzFrameScriptByCode(dz.FrameFindByName("BagButtonX", 0), 1, function OnOff_Keyboard_Actions, false)
    dz.FrameSetAbsolutePoint(dz.FrameGetItemBarButton(0), 0, 0.516, 0.111)
    dz.FrameSetAbsolutePoint(dz.FrameGetItemBarButton(1), 0, 0.556, 0.111)
    dz.FrameSetAbsolutePoint(dz.FrameGetItemBarButton(2), 0, 0.516, 0.073)
    dz.FrameSetAbsolutePoint(dz.FrameGetItemBarButton(3), 0, 0.556, 0.073)
    dz.FrameSetAbsolutePoint(dz.FrameGetItemBarButton(4), 0, 0.516, 0.035)
    dz.FrameSetAbsolutePoint(dz.FrameGetItemBarButton(5), 0, 0.556, 0.035)
end
