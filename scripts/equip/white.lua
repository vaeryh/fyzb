local mt = {}

-- bol
-- 获取表
function mt.getTL(item)
    if mt[item] == nil then
        mt[item] = {}
    end
    return mt[item]
end

-- 获取属性颜色
mt.color = {'|cFFFFFFFF', '|cFFFFFF00', '|cFFF1A4E0', '|cFFFF0000'}

mt.white = {
    wq = {{'外功', 1, 100}, {'内功', 1, 100}, {'出招速度', 1, 100}, {'会心加成', 1, 100},
          {'招式', 1, 100}, {'身法', 1, 100}, {'心法', 1, 100}}
}
mt.yellow = {'外功', '内功', '出招速度', '会心加成', '招式', '身法', '心法'}
mt.pink = {'会心率', '吸血率', '眩晕率', '减速率', '沉默率'}
mt.red = {'风相性', '云相性', '火相性', '地相性', '雷相性', '全属性', '多重数', '固定破甲',
          '增伤率', '分裂比例'}

for i, v in ipairs(mt.white) do
    print(mt.white)
end

return mt
