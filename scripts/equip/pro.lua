local mt = {}

-- bol
-- 获取表
function mt.getTL(item)
    if mt[item] == nil then
        mt[item] = {}
    end
    return mt[item]
end

-- 设置装备随机属性
function SetRandomTrue(it, a, b)
    local n
    SaveBoolean(Hash, GetHandleId(it), GetRandomInt(a, b), true)
    while condition do
        n = GetRandomInt(a, b)
        if LoadBoolean(Hash, GetHandleId(it), n) == false then
            SaveBoolean(Hash, GetHandleId(it), n, true)
        end
    end
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 获取属性颜色
function GetColor(index)
    if index >= 1 and index <= 10 then
        return "|cFFFFFFFF"
    elseif index >= 11 and index <= 20 then
        return "|cFFFFFF00"
    elseif index >= 21 and index <= 30 then
        return "|cFFF1A4E0"
    elseif index >= 31 and index <= 40 then
        return "|cFFFF0000"
    end
    return ""
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 装备命名
function GetName(proName, value)
    -- 整数
    if proName == "外功" or proName == "内功" or proName == "护甲" or proName == "移动速度" then
        return proName + "：+" + I2S(R2I(value))
    elseif proName == "气血" or proName == "内力" then
        return proName + "：+" + I2S(R2I(value))
    elseif proName == "气血恢复" or proName == "内力恢复" then
        return proName + "：+" + I2S(R2I(value))
    elseif proName == "招式" or proName == "身法" or proName == "心法" or proName == "全属性" then
        return proName + "：+" + I2S(R2I(value))
    elseif proName == "风相性" or proName == "云相性" or proName == "火相性" or proName == "地相性" or
        proName == "雷相性" then
        return proName + "：+" + I2S(R2I(value))
    elseif proName == "多重数" or proName == "固定破甲" then
        return proName + "：+" + I2S(R2I(value))
    elseif proName == "固定减伤" then
        return proName + "：+" + I2S(R2I(value))
    end
    -- 百分数or实数
    if proName == "会心率" or proName == "吸血率" or proName == "眩晕率" or proName == "减速率" or proName ==
        "沉默率" then
        return proName + "：+" + R2SW(value, 1, 1) + "%"
    elseif proName == "出招速度" or proName == "会心加成" or proName == "冷却缩减" or proName ==
        "分裂比例" then
        return proName + "：+" + I2S(R2I(value)) + "%"
    elseif proName == "增伤率" or proName == "减伤率" or proName == "出招间隔" or proName == "" then
        return proName + "：+" + I2S(R2I(value)) + "%"
    end
    -- 免疫类
    if proName == "免疫中毒" or proName == "免疫减攻速" or proName == "免疫减移速" or proName ==
        "免疫破甲" then
        return proName
    elseif proName == "免疫沉默" or proName == "免疫沉默" or proName == "免疫闪避（诅咒）" or proName ==
        "免疫减攻击" then
        return proName
    end
    -- 光环类
    if proName == "辉煌光环" then
        return "辉煌光环：提升周围友军" + I2S(R2I(value)) + "%的内力恢复"
    elseif proName == "恢复光环" then
        return "恢复光环：提升周围友军" + I2S(R2I(value)) + "%的气血恢复"
    elseif proName == "专注光环" then
        return "专注光环：提升周围友军" + I2S(R2I(value)) + "%的护甲"
    elseif proName == "耐久光环" then
        return "耐久光环：提升周围友军" + I2S(R2I(value)) + "%的出招速度和移动速度"
    elseif proName == "吸血光环" then
        return "吸血光环：提升周围友军" + I2S(R2I(value)) + "%的外功吸血"
    elseif proName == "荆棘光环" then
        return "荆棘光环：反弹攻击者自身外功" + I2S(R2I(value)) + "%的伤害"
    elseif proName == "强击光环" then
        return "强击光环：提升周围友军" + I2S(R2I(value)) + "%的远程外功"
    elseif proName == "命令光环" then
        return "命令光环：提升周围友军" + I2S(R2I(value)) + "%的外功"
    elseif proName == "减速光环" then
        return "减速光环：降低周围敌军" + I2S(R2I(value)) + "%的出招速度和移动速度"
    end
    -- 邪恶光环：单独处理

    return ""
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 装备
-- ! textmacro Equip takes n,name,min,max
-- if LoadBoolean(Hash, GetHandleId(it), $n$ ) == true then
-- 	 numR = GetRandomReal( $min$, $max$ )
-- 	-- numR = $max$
-- 	 SaveReal(Hash, GetHandleId(it), $n$, numR)--存储数值
-- 	 SaveStr(Hash, GetHandleId(it), $n$, GetColor($n$) + GetName("$name$", numR))--存储描述
-- 	 SaveReal(Hash, GetHandleId(it), $n$+ 50, $max$)--存储最大值
-- 	 SaveStr(Hash, GetHandleId(it), $n$+ 51, "$name$")--存储属性名
-- end
-- ! endtextmacro
-- #####################################################################################
--
function Wq_SetPropertyValue(it, white, yellow, pink, red)
    local numR

    if white == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(1, 2), true) -- 外功或内功必有1个
        SetRandomTrue(it, 3, 7)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(3, 7), false) -- 概率空
        -- ! runtextmacro Equip("1","外功","GetItemLevel(it)*100","GetItemLevel(it)*300")
        -- ! runtextmacro Equip("2","内功","GetItemLevel(it)*100","GetItemLevel(it)*300")
        -- ! runtextmacro Equip("3","出招速度","10","GetItemLevel(it)*10")
        -- ! runtextmacro Equip("4","会心加成","10","GetItemLevel(it)*10")
        -- ! runtextmacro Equip("5","招式","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("6","身法","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("7","心法","GetItemLevel(it)*25","GetItemLevel(it)*100")
    end

    if yellow == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(11, 17), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(11, 17), false) -- 概率空
        -- ! runtextmacro Equip("11","外功","GetItemLevel(it)*100","GetItemLevel(it)*300")
        -- ! runtextmacro Equip("12","内功","GetItemLevel(it)*100","GetItemLevel(it)*300")
        -- ! runtextmacro Equip("13","出招速度","10","GetItemLevel(it)*10")
        -- ! runtextmacro Equip("14","会心加成","10","GetItemLevel(it)*10")
        -- ! runtextmacro Equip("15","招式","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("16","身法","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("17","心法","GetItemLevel(it)*25","GetItemLevel(it)*100")
    end

    if pink == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(21, 25), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(21, 25), false) -- 概率空
        -- ! runtextmacro Equip("21","会心率","5","GetItemLevel(it)*2")
        -- ! runtextmacro Equip("22","吸血率","2","GetItemLevel(it)*2")
        -- ! runtextmacro Equip("23","眩晕率","2","GetItemLevel(it)*2")
        -- ! runtextmacro Equip("24","减速率","5","GetItemLevel(it)*2")
        -- ! runtextmacro Equip("25","沉默率","2","GetItemLevel(it)*2")
    end

    if red == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(31, 40), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(31, 40), false) -- 概率空
        -- ! runtextmacro Equip("31","风相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("32","云相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("33","火相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("34","地相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("35","雷相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("36","全属性","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("37","多重数","1","GetItemLevel(it)-4")
        -- ! runtextmacro Equip("38","固定破甲","100","GetItemLevel(it)*100-400")
        -- ! runtextmacro Equip("39","增伤率","5","GetItemLevel(it)*2")
        -- ! runtextmacro Equip("40","分裂比例","10","GetItemLevel(it)*10-40")
    end
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
----
function Fj_SetPropertyValue(it, white, yellow, pink, red)
    local numR

    if white == true then
        SaveBoolean(Hash, GetHandleId(it), 1, true) -- 必有属性设置
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(2, 3), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(4, 6), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(4, 6), false) -- 概率空
        -- ! runtextmacro Equip("1","护甲","GetItemLevel(it)*20","GetItemLevel(it)*50")
        -- ! runtextmacro Equip("2","气血","GetItemLevel(it)*1000","GetItemLevel(it)*3000")
        -- ! runtextmacro Equip("3","内力","GetItemLevel(it)*1000","GetItemLevel(it)*3000")
        -- ! runtextmacro Equip("4","招式","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("5","身法","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("6","心法","GetItemLevel(it)*25","GetItemLevel(it)*100")
    end

    if yellow == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(11, 16), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(11, 16), false) -- 概率空
        -- ! runtextmacro Equip("11","护甲","GetItemLevel(it)*20","GetItemLevel(it)*50")
        -- ! runtextmacro Equip("12","气血","GetItemLevel(it)*1000","GetItemLevel(it)*3000")
        -- ! runtextmacro Equip("13","内力","GetItemLevel(it)*1000","GetItemLevel(it)*3000")
        -- ! runtextmacro Equip("14","招式","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("15","身法","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("16","心法","GetItemLevel(it)*25","GetItemLevel(it)*100")
    end

    if pink == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(21, 28), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(21, 28), false) -- 概率空
        -- ! runtextmacro Equip("21","免疫中毒","1","1")
        -- ! runtextmacro Equip("22","免疫减攻速","1","1")
        -- ! runtextmacro Equip("23","免疫减移速","1","1")
        -- ! runtextmacro Equip("24","免疫破甲","1","1")
        -- ! runtextmacro Equip("25","免疫沉默","1","1")
        -- ! runtextmacro Equip("26","免疫眩晕","1","1")
        -- ! runtextmacro Equip("27","免疫闪避（诅咒）","1","1")
        -- ! runtextmacro Equip("28","免疫减攻击","1","1")
    end

    if red == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(31, 38), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(31, 38), false) -- 概率空
        -- ! runtextmacro Equip("31","风相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("32","云相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("33","火相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("34","地相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("35","雷相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("36","全属性","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("37","固定减伤","GetItemLevel(it)*100","GetItemLevel(it)*2000")
        -- ! runtextmacro Equip("38","减伤率","5","GetItemLevel(it)*2")
    end
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--
function Sp_SetPropertyValue(it, white, yellow, pink, red)
    local Lev = GetItemLevel(it)
    local numR
    local numI

    if white == true then
        if GetObjItemStr(it, "class") == "玉佩" then
            SaveBoolean(Hash, GetHandleId(it), 1, true)
        elseif GetObjItemStr(it, "class") == "项链" then
            SaveBoolean(Hash, GetHandleId(it), 2, true)
        elseif GetObjItemStr(it, "class") == "手镯" then
            SaveBoolean(Hash, GetHandleId(it), 3, true)
        end
        -- ! runtextmacro Equip("1","气血恢复","Lev","Lev*10")
        -- ! runtextmacro Equip("2","内力恢复","Lev","Lev*10")
        -- ! runtextmacro Equip("3","会心率","5","5+Lev*2")
    end
    if yellow == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(11, 15), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(11, 15), false) -- 概率空
        -- ! runtextmacro Equip("11","气血恢复","Lev","Lev*10")
        -- ! runtextmacro Equip("12","内力恢复","Lev","Lev*10")
        -- ! runtextmacro Equip("13","招式","Lev*25","Lev*50")
        -- ! runtextmacro Equip("14","身法","Lev*25","Lev*50")
        -- ! runtextmacro Equip("15","心法","Lev*25","Lev*50")
    end
    if pink == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(21, 30), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(21, 30), false) -- 概率空
        -- ! runtextmacro Equip("21","辉煌光环","50","25*Lev")
        -- ! runtextmacro Equip("22","恢复光环","50","25*Lev")
        -- ! runtextmacro Equip("23","专注光环","50","25*Lev")
        -- ! runtextmacro Equip("24","耐久光环","5","2*Lev")
        -- ! runtextmacro Equip("25","吸血光环","5","5+Lev")
        -- 邪恶光环：提升周围友军50%~(50 + 10 *阶级)%的气血恢复和5%~(5 + 1 *阶级)%的移动速度
        if LoadBoolean(Hash, GetHandleId(it), 26) == true then
            numR = GetRandomInt(50, 50 + 10 * Lev)
            SaveReal(Hash, GetHandleId(it), 26, numR)
            SaveReal(Hash, GetHandleId(it), 26 + 50, 50 + 10 * Lev) -- 存储最大值

            numI = GetRandomInt(5, 5 + Lev)
            SaveInteger(Hash, GetHandleId(it), 26, numI)
            SaveInteger(Hash, GetHandleId(it), 26 + 50, 5 + Lev)

            SaveStr(Hash, GetHandleId(it), 26 + 51, "邪恶光环") -- 存储属性名
            SaveStr(Hash, GetHandleId(it), 26,
                "|cFFF1A4E0邪恶光环：提升周围友军" + I2S(R2I(numR)) + "%的气血恢复和" + I2S(numI) +
                    "%的移动速度" + "|r")
        end
        -- ! runtextmacro Equip("27","荆棘光环","50","25*Lev")
        -- ! runtextmacro Equip("28","强击光环","5","2*Lev")
        -- ! runtextmacro Equip("29","命令光环","5","5+Lev")
        -- ! runtextmacro Equip("30","减速光环","5","2*Lev")
    end
    if red == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(31, 38), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(31, 38), false) -- 概率空
        -- ! runtextmacro Equip("31","风相性","1","Lev*1")
        -- ! runtextmacro Equip("32","云相性","1","Lev*1")
        -- ! runtextmacro Equip("33","火相性","1","Lev*1")
        -- ! runtextmacro Equip("34","地相性","1","Lev*1")
        -- ! runtextmacro Equip("35","雷相性","1","Lev*1")
        -- ! runtextmacro Equip("36","全属性","Lev*25","Lev*100")
        -- ! runtextmacro Equip("37","会心率","5","5+Lev*1")
        -- ! runtextmacro Equip("38","出招间隔","1","Lev*1")
    end
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
--
function Shoe_SetPropertyValue(it, white, yellow, pink, red)
    local numR

    if white == true then
        SaveBoolean(Hash, GetHandleId(it), 1, true) -- 必有
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(2, 3), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(4, 6), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(4, 6), false) -- 概率空
        -- ! runtextmacro Equip("1","移动速度","GetItemLevel(it)*12","GetItemLevel(it)*12")
        -- ! runtextmacro Equip("2","气血","GetItemLevel(it)*1000","GetItemLevel(it)*2000")
        -- ! runtextmacro Equip("3","内力","GetItemLevel(it)*1000","GetItemLevel(it)*2000")
        -- ! runtextmacro Equip("4","招式","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("5","身法","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("6","心法","GetItemLevel(it)*25","GetItemLevel(it)*100")
    end
    if yellow == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(11, 16), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(11, 16), false) -- 概率空
        -- ! runtextmacro Equip("11","移动速度","GetItemLevel(it)*12","GetItemLevel(it)*12")
        -- ! runtextmacro Equip("12","气血","GetItemLevel(it)*1000","GetItemLevel(it)*2000")
        -- ! runtextmacro Equip("13","内力","GetItemLevel(it)*1000","GetItemLevel(it)*2000")
        -- ! runtextmacro Equip("14","招式","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("15","身法","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("16","心法","GetItemLevel(it)*25","GetItemLevel(it)*100")
    end
    if pink == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(21, 23), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(21, 23), false) -- 概率空
        -- ! runtextmacro Equip("21","出招速度","10","10+GetItemLevel(it)*7")
        -- ! runtextmacro Equip("22","会心加成","10","10+GetItemLevel(it)*7")
        -- ! runtextmacro Equip("23","会心率","5","5+GetItemLevel(it)*2")
    end
    if red == true then
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(31, 39), true)
        SaveBoolean(Hash, GetHandleId(it), GetRandomInt(31, 39), false) -- 概率空
        -- ! runtextmacro Equip("31","风相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("32","云相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("33","火相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("34","地相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("35","雷相性","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("36","全属性","GetItemLevel(it)*25","GetItemLevel(it)*100")
        -- ! runtextmacro Equip("37","出招间隔","1","GetItemLevel(it)*1")
        -- ! runtextmacro Equip("38","固定减伤","GetItemLevel(it)*100","GetItemLevel(it)*1500")
        -- ! runtextmacro Equip("39","减伤率","5","GetItemLevel(it)*2")
    end
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 装备分类
function Classify(whichItem, white, yellow, pink, red)
    if DP_IsItemClass(whichItem, "武器") then
        Wq_SetPropertyValue(whichItem, white, yellow, pink, red)
    elseif DP_IsItemClass(whichItem, "防具") then
        Fj_SetPropertyValue(whichItem, white, yellow, pink, red)
    elseif DP_IsItemClass(whichItem, "饰品") then
        Sp_SetPropertyValue(whichItem, white, yellow, pink, red)
    elseif DP_IsItemClass(whichItem, "鞋子") then
        Shoe_SetPropertyValue(whichItem, white, yellow, pink, red)
    end
end
-- 装备来源：后期修改做准备
function Source(source, whichItem)
    local Lev = GetObjItemInt(whichItem, "Level")
    print(source .. ":" .. GetItemName(whichItem) .. I2S(Lev) .. "阶")
    -- 商店，后期删除
    if source == "商店" then
        Classify(whichItem, true, true, true, true)
    end
    -- 擂台挑战
    if source == "擂台挑战" then
        if Lev >= 7 then -- 789阶级，白、黄、紫、红
            Classify(whichItem, true, true, true, true)
        elseif Lev >= 4 then -- 456阶级,白、黄、紫
            Classify(whichItem, true, true, true, false)
        elseif Lev >= 1 then -- 123阶级,白、黄
            Classify(whichItem, true, true, false, false)
        end
    end
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 商店购买，有白属性
gTrg.RegPlayerUnitEvent(Player(15), EVENT_PLAYER_UNIT.SELL_ITEM, function()
    local whichUnitType = GetUnitTypeId(GetTriggerUnit())
    DisplayTextToPlayer(GetTriggerPlayer(), 0, 0,
        GetPlayerName(GetTriggerPlayer()) + "购买了" + GetItemName(GetSoldItem()))
    if whichUnitType >= 'wq01' and whichUnitType <= 'wq05' then -- 武器
        Source("商店", GetSoldItem())
    elseif whichUnitType == 'fj01' or whichUnitType == 'fj02' then -- 防具
        Source("商店", GetSoldItem())
    elseif whichUnitType == 'sp01' or whichUnitType == 'sp02' or whichUnitType == 'sp03' then -- 饰品
        Source("商店", GetSoldItem())
    elseif whichUnitType == 'xz01' or whichUnitType == 'xz02' then -- 鞋子
        Source("商店", GetSoldItem())
    end
end)
