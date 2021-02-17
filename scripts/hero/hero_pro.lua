local mt = {}

-- 类型
mt.type = "属性"

-- 属性初始值
local proInitValue = {
    -- 9
    ["外功"] = 0,
    ["内功"] = 0,
    ["护甲"] = 0,
    ["气血"] = 1000,
    ["内力"] = 100,
    ["气血恢复"] = 1.0,
    ["内力恢复"] = 1.0,
    ["出招速度"] = 0,
    ["移动速度"] = 0,
    -- 2
    ["会心率"] = 10,
    ["会心加成"] = 200,
    -- 4
    ["招式"] = 0,
    ["身法"] = 0,
    ["心法"] = 0,
    ["全属性"] = 0,
    -- 4
    ["吸血率"] = 0,
    ["眩晕率"] = 0,
    ["减速率"] = 0,
    ["沉默率"] = 0,
    -- 5
    ["风相性"] = 0,
    ["云相性"] = 0,
    ["火相性"] = 0,
    ["地相性"] = 0,
    ["雷相性"] = 0,
    -- 6
    ["多重数"] = 0,
    ["分裂比例"] = 0,
    ["固定减伤"] = 0,
    ["减伤率"] = 0,
    ["增伤率"] = 0,
    ["固定破甲"] = 0,
    -- 8
    ["免疫中毒"] = 0,
    ["免疫减攻速"] = 0,
    ["免疫减移速"] = 0,
    ["免疫破甲"] = 0,
    ["免疫沉默"] = 0,
    ["免疫眩晕"] = 0,
    ["免疫闪避"] = 0,
    ["免疫减攻击"] = 0,
    -- 10
    ["辉煌光环"] = 0,
    ["恢复光环"] = 0,
    ["专注光环"] = 0,
    ["耐久光环"] = 0,
    ["吸血光环"] = 0,
    ["邪恶光环"] = 0,
    ["荆棘光环"] = 0,
    ["强击光环"] = 0,
    ["命令光环"] = 0,
    ["减速光环"] = 0
}

-- 获取单位属性表
function mt.getHeroProTable(hero)
    if mt[hero] == nil then
        mt[hero] = proInitValue
    end
    return mt[hero]
end

-- 属性生效
function mt:takeEffect_Action(hero, proName, value)
    print(proName, value)
    -- 基础
    if proName == "外功" then
        gUnitdata.adjustPro("攻击值", hero, value)
    elseif proName == "护甲" then
        gUnitdata.adjustPro("护甲值", hero, value)
    end
    -- 速度类
    if proName == "出招速度" then
        gUnitdata.adjustPro("攻击速度", hero, value)
    elseif proName == "出招间隔" then
        gUnitdata.adjustPro("攻击间隔", hero, value)
    elseif proName == "移动速度" then
        gUnitdata.adjustPro("移动速度", hero, value)
    end
    -- 恢复类
    if proName == "气血" then
        gUnitdata.adjustPro("生命值", hero, value)
    elseif proName == "气血恢复" then
        gUnitdata.adjustPro("生命值回复", hero, value)
    elseif proName == "内力" then
        gUnitdata.adjustPro("魔法值", hero, value)
    elseif proName == "内力恢复" then
        gUnitdata.adjustPro("魔法值回复", hero, value)
    end
    -- 英雄属性
    if proName == "招式" then
        gUnitdata.adjustStr("力量", hero, value)
    elseif proName == "身法" then
        gUnitdata.adjustAgi("敏捷", hero, value)
    elseif proName == "心法" then
        gUnitdata.adjustInt("智力", hero, value)
    elseif proName == "全属性" then
        gUnitdata.adjustStr("力量", hero, value)
        gUnitdata.adjustAgi("敏捷", hero, value)
        gUnitdata.adjustInt("智力", hero, value)
    end
    -- 相性
    local str = gH.getStr(hero)
    local agi = gH.getAgi(hero)
    local int = gH.getInt(hero)
    local main = gH.getMain(hero)
    if proName == "风相性" then -- 风相性：提升风相性*身法* 0.002%的出招速度，风相性*身法* 0.005的移动速度。
        gUnitdata.adjustPro("攻击速度", hero, value * agi * 0.002)
        gUnitdata.adjustPro("移动速度", hero, value * agi * 0.005)
    elseif proName == "云相性" then -- 云相性：提升云相性*招式* 0.5的气血和云相性*招式* 0.01 /秒的气血恢复；
        gUnitdata.adjustPro("生命值", hero, value * str * 0.5)
        gUnitdata.adjustPro("生命值再生", hero, value * str * 0.002)
    elseif proName == "火相性" then -- 火相性：提升火相性*主属性*0.02的外功；
        gUnitdata.adjustPro("攻击值", hero, value * main * 0.002)
    elseif proName == "地相性" then -- 地相性：提升地相性*身法* 0.005的防御和伤害减免；
        local num = agi * value * 0.005
        gUnitdata.adjustPro("护甲值", hero, value * main * 0.002)
        -- 未做
    elseif proName == "雷相性" then -- 雷相性：提升雷相性*主属性*0.02的内功和雷相性*主属性*0.1的内力；
        local num = value * main * 0.1
        -- 未做
        gUnitdata.adjustPro("魔法值", hero, value * main * 0.02)
    end
end

-- 增减属性
function mt:takeEffect_PickDrop()
    local zb = require 'equip.common.zb'
    -- 增加属性
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        if zb:isItemClass(item, "装备") then
            mt:takeEffect_Action(hero)
        end
    end)
    -- 减少属性
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.DROP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        if zb:isItemClass(item, "装备") then
            mt:takeEffect_Action(hero)
        end
    end)
end

--
function mt.showPro()
    local hero = Hero[GetLocalPlayer()]
    --
    local tip1 = [[
    |cff64ee14外功：+%外功%         |cff64ee14内功：+%内功%
    |cff64ee14护甲：+%护甲%
    |cff64ee14气血：+%气血%         |cff64ee14内力：+%内力%
    |cff64ee14气血恢复：+%气血恢复%  |cff64ee14内力恢复：+%内力恢复%
    |cff64ee14出招速度：+%出招速度% |cff64ee14移动速度：+%移动速度%
    |cff64ee14会心率：+%会心率%     |cff64ee14会心加成：+%会心加成%

    |cff64ee14招式：+%招式%         |cff64ee14身法：+%身法%
    |cff64ee14心法：+%心法%         |cff64ee14全属性：+%全属性%

    |cff64ee14吸血率：+%吸血率%     |cff64ee14眩晕率：+%眩晕率%
    |cff64ee14减速率：+%减速率%     |cff64ee14沉默率：+%沉默率%

    |cff64ee14风相性：+%风相性%     |cff64ee14云相性：+%云相性%
    |cff64ee14火相性：+%火相性%     |cff64ee14地相性：+%地相性%
    |cff64ee14雷相性：+%雷相性%

    |cff64ee14多重数：+%多重数%     |cff64ee14分裂比例：+%分裂比例%
    |cff64ee14增伤率：+%增伤率%     |cff64ee14减伤率：+%减伤率%
    |cff64ee14固定破甲：+%固定破甲% |cff64ee14固定减伤：+%固定减伤%
    ]]
    local tip2 = [[
    |cff64ee14外功：+%外功%         |cff64ee14内功：+%内功%
    |cff64ee14护甲：+%护甲%
    |cff64ee14气血：+%气血%         |cff64ee14内力：+%内力%
    |cff64ee14气血恢复：+%气血恢复%  |cff64ee14内力恢复：+%内力恢复%
    |cff64ee14出招速度：+%出招速度% |cff64ee14移动速度：+%移动速度%
    |cff64ee14会心率：+%会心率%     |cff64ee14会心加成：+%会心加成%

    |cff64ee14招式：+%招式%         |cff64ee14身法：+%身法%
    |cff64ee14心法：+%心法%         |cff64ee14全属性：+%全属性%

    |cff64ee14吸血率：+%吸血率%     |cff64ee14眩晕率：+%眩晕率%
    |cff64ee14减速率：+%减速率%     |cff64ee14沉默率：+%沉默率%

    |cff64ee14风相性：+%风相性%     |cff64ee14云相性：+%云相性%
    |cff64ee14火相性：+%火相性%     |cff64ee14地相性：+%地相性%
    |cff64ee14雷相性：+%雷相性%

    |cff64ee14多重数：+%多重数%     |cff64ee14分裂比例：+%分裂比例%
    |cff64ee14增伤率：+%增伤率%     |cff64ee14减伤率：+%减伤率%
    |cff64ee14固定破甲：+%固定破甲% |cff64ee14固定减伤：+%固定减伤%
    ]]
    local t = string.gsub(tip, '%%(.-)%%', function(name)
        -- return mt.getHeroProTable(hero)[name]
        return proInitValue[name]
    end)

    gDz.FrameSetText(mt.showText, t)
end

-- 创建UI待用
function mt.FrameInit()
    -- 背包背景
    mt.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.2, 0.5):setSize(0.186, 0.326)
    oUI:setShow(false)
    -- 标题
    mt.title = oUI:createByTag("TEXT", mt.mainBack, "ProTextTemplate")
    -- gDz.FrameSetSize(mt.title, 0.06, 0.01)
    gDz.FrameSetText(mt.title, "|cff31e40d英雄属性")
    gDz.FrameSetPoint(mt.title, 1, mt.mainBack, 1, 0.00, -0.01)
    -- 第一列
    mt.showText1 = oUI:createByTag("TEXT", mt.mainBack, "ProText")
    gDz.FrameSetSize(mt.showText, 0.09, 0.32)
    gDz.FrameSetText(mt.showText, "防御+10")
    gDz.FrameSetPoint(mt.showText, 0, mt.mainBack, 0, 0.005, -0.04)
    -- 第二列
    mt.showText2 = oUI:createByTag("TEXT", mt.mainBack, "ProText")
    gDz.FrameSetSize(mt.showText2, 0.09, 0.32)
    gDz.FrameSetText(mt.showText2, "防御+10")
    gDz.FrameSetPoint(mt.showText2, 0, mt.showText1, 0, 0.0, 0.0)
    -- Tab
    gDz.TriggerRegisterKeyEvent(9, 0, true, function()
        if gTrg.getExecCount() % 2 == 1 then
            gDz.FrameShow(mt.mainBack, true)
            mt.showPro()
        else
            gDz.FrameShow(mt.mainBack, false)
        end
    end)
end

-- 自身初始化
function mt.selfInit()
    mt:takeEffect_PickDrop()
end

return mt
