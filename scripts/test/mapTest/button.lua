local mt = {}

-- 属性值
local proValue = {}
-- 10
table.insert(proValue, {"外功", 0, "%+d", 100})
table.insert(proValue, {"内功", 0, "%+d", 100})
table.insert(proValue, {"护甲", 0, "%+d", 10})
table.insert(proValue, {"魔抗", 0, "%+d", 10})
table.insert(proValue, {"气血", 1000, "%+d", 100})
table.insert(proValue, {"内力", 100, "%+d", 100})
table.insert(proValue, {"气血恢复", 1.2, "%+.1f", 1})
table.insert(proValue, {"内力恢复", 1.5, "%+.1f", 1})
table.insert(proValue, {"出招速度", 10, "%+.1f%%", 1})
table.insert(proValue, {"移动速度", 0, "%+d", 10})
--
table.insert(proValue, {"会心率", 0, "%+d%%", 1})
table.insert(proValue, {"会心加成", 0, "%+d%%", 10})
--
table.insert(proValue, {"招式", 0, "%+d", 10})
table.insert(proValue, {"身法", 0, "%+d", 10})
table.insert(proValue, {"心法", 0, "%+d", 10})
table.insert(proValue, {"全属性", 0, "%+d", 10})
--
table.insert(proValue, {"吸血率", 0, "%+.1f%%", 1})
table.insert(proValue, {"眩晕率", 0, "%+.1f%%", 1})
table.insert(proValue, {"减速率", 0, "%+.1f%%", 1})
table.insert(proValue, {"沉默率", 0, "%+.1f%%", 1})
--
table.insert(proValue, {"风相性", 0, "%+d", 1})
table.insert(proValue, {"云相性", 0, "%+d", 1})
table.insert(proValue, {"火相性", 0, "%+d", 1})
table.insert(proValue, {"地相性", 0, "%+d", 1})
table.insert(proValue, {"雷相性", 0, "%+d", 1})
--
table.insert(proValue, {"多重数", 0, "%+d", 1})
table.insert(proValue, {"分裂比例", 0, "%+d", 1})
table.insert(proValue, {"固定减伤", 0, "%+d", 1})
table.insert(proValue, {"减伤率", 0, "%+.1f%%", 1})
table.insert(proValue, {"增伤率", 0, "%+.1f%%", 1})
table.insert(proValue, {"固定破甲", 0, "%+d", 10})

-- 获取单位属性表
function mt.getProTable(hero)
    if mt[hero] == nil then
        mt[hero] = proValue
    end
    return mt[hero]
end

--
function mt.Init_A()
    -- 背景
    mt.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.226, 0.50):setSize(0.35, 0.22):setShow(true)
    -- 单位图标
    mt.unit_art = oUI:createByTag("BACKDROP", mt.mainBack, nil)
    oUI:setRelative(0, mt.mainBack, 0, 0.003, -0.003):setSize(0.03, 0.04)
    oUI:setTexture("ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp")
    -- 单位名称
    mt.unit_name = oUI:createByTag("TEXT", mt.mainBack, nil)
    oUI:setRelative(3, mt.unit_art, 5, 0.005, 0.0):setSize(0.05, 0.01):setText('单位名称')
    -- -- 增加按钮
    -- mt.but_up = oUI:createByTag("GLUETEXTBUTTON", mt.mainBack, "ProButton_Add")
    -- oUI:setRelative(3, mt.unit_name, 5, 0.006, 0.0):setSize(0.015, 0.010)
    -- -- 减少按钮
    -- mt.but_do = oUI:createByTag("GLUETEXTBUTTON", mt.mainBack, "ProButton_Sub")
    -- oUI:setRelative(3, mt.but_up, 5, 0.006, 0.0):setSize(0.015, 0.010)
    -- 滚轮变化值
    -- mt.wheel = oUI:createByTag("TEXT", mt.mainBack, nil)
    -- oUI:setRelative(3, mt.unit_name, 5, 0.006, 0.0):setSize(0.05, 0.01):setText('滚轮变化值')

    mt.pro_text = {} -- 属性名称
    --
    for i = 1, 31 do
        -- 属性名称
        mt.pro_text[i] = oUI:createByTag("TEXTBUTTON", mt.mainBack, "ProButton_proText")
        oUI:setSize(0.07, 0.01):setText("生命恢复：|cff34f703+1.0")
    end
    for i = 1, 31 - 1 do
        if i == 1 then
            gDz.FrameSetPoint(mt.pro_text[1], 0, mt.unit_art, 6, 0.003, -0.01)
        end
        if i % 4 == 0 then
            gDz.FrameSetPoint(mt.pro_text[i + 1], 1, mt.pro_text[i - 3], 7, 0.0, -0.01)
        else
            gDz.FrameSetPoint(mt.pro_text[i + 1], 3, mt.pro_text[i], 5, 0.003, 0.0)
        end
    end

end
--
function mt.Init_B()
    mt.select_unit, mt.select_index = {}, {}
    -- 当前选定单位
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
        local player, unit = GetTriggerPlayer(), GetTriggerUnit()
        -- 玩家选择单位
        mt.select_unit[player] = unit
        --
        if player == GetLocalPlayer() then
            gDz.FrameSetText(mt.unit_name, GetUnitName(unit))
            gDz.FrameSetTexture(mt.unit_art, gSlk.getUnitString(unit, "Art"))

            for i, v in pairs(mt.getProTable(unit)) do
                gDz.FrameSetText(mt.pro_text[i], v[1] .. ":|cff34f703" .. string.format(v[3], v[2]))
            end
        end
    end)
end

-- 增加数值
function mt.Init_C()
    -- 单属性滑轮变化值
    -- gDz.TriggerRegisterUIEvent(mt.wheel, 6, function()
    --     local frame, p = gDz.GetTriggerUIEventFrame(), gDz.GetTriggerUIEventPlayer()
    --     if not Hero[p] then
    --         return
    --     end
    --     if mt.select_unit[p] then
    --         if gDz.GetWheelDelta() > 0 then
    --             mt.adjustPro(p, 4, mt.getPro(p, 4) * 1)
    --         else
    --             mt.adjustPro(p, 4, mt.getPro(p, 4) * -1)
    --         end
    --         gDz.FrameSetText(mt.wheel, mt.getPro(p, 4))
    --     end
    -- end)

    -- 鼠标滑轮
    local index = {}
    for i, v in ipairs(mt.pro_text) do
        index[v] = i
        gDz.TriggerRegisterUIEvent(v, 6, function()
            local frame, p = gDz.GetTriggerUIEventFrame(), gDz.GetTriggerUIEventPlayer()
            if not Hero[p] then
                return
            end
            -- 玩家序号
            mt.select_index[p] = index[frame]
            if gDz.GetWheelDelta() > 0 then
                mt.adjustPro(p, 2, mt.getPro(p, 4) * 1)
            else
                mt.adjustPro(p, 2, mt.getPro(p, 4) * -1)
            end
        end)
    end
end
local hero_pro = require "map.hero.hero_pro"
-- 调整某属性值
function mt.adjustPro(p, solt, vlaue)
    local unit, index = mt.select_unit[p], mt.select_index[p]
    mt[unit][index][solt] = mt[unit][index][solt] + vlaue
    hero_pro.takeEffect_Action(unit, mt[unit][index][1], vlaue)
    gU.selectSingle(mt.select_unit[p], p)
end

-- 获取某属性值
function mt.getPro(p, solt)
    local unit, index = mt.select_unit[p], mt.select_index[p]
    return mt[unit][index][solt]
end

function mt.Init()
    mt.Init_A()
    mt.Init_B()
    mt.Init_C()
end

mt.Init()

return mt
