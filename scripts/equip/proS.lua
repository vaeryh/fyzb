-- 属性类
local mt = {}

-- bol
-- 获取表
function mt.getTL(item)
    if mt[item] == nil then
        mt[item] = {}
    end
    return mt[item]
end
-- 名称
mt.name = ''
-- 提示
mt.tip = ''
-- 颜色
mt.color = ''

-- 最小值
mt.min = 0
-- 最大值
mt.max = 0
-- 当前值
mt.value = 0

mt['外功'] = {
    name = "外功",
    min = 1,
    max = 10,
    value = 0
}
-- 加载属性
function mt:load(name, min, max)
    local o = {}
    setmetatable(o, self)
    o.name = name
    o.min = min
    o.max = max
    table.insert(o, self)
end

function init()
    mt:load('外功', 100, 300)
    mt:load('内功', 100, 300)
    mt:load('出招速度', 100, 300)
    mt:load('会心加成', 100, 300)
    mt:load('招式', 100, 300)
    mt:load('身法', 100, 300)
    mt:load('心法', 100, 300)
end

mt.white = {
    wq = {{'外功', 1, 100}, {'内功', 1, 100}, {'出招速度', 1, 100}, {'会心加成', 1, 100},
          {'招式', 1, 100}, {'身法', 1, 100}, {'心法', 1, 100}}
}
mt.yellow = {'外功', '内功', '出招速度', '会心加成', '招式', '身法', '心法'}
mt.pink = {'会心率', '吸血率', '眩晕率', '减速率', '沉默率'}
mt.red = {'风相性', '云相性', '火相性', '地相性', '雷相性', '全属性', '多重数', '固定破甲',
          '增伤率', '分裂比例'}

return mt
