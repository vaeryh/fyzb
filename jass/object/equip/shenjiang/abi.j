<? xG_ability_luaObj={}
local slk = require 'slk'
obj=slk.ability.ANcl:new('Zz00')
    obj.Name='神匠打造'
    obj.Tip='以物品为目标'
    obj.Animnames=''
    obj.TargetArt=''
    obj.CasterArt=''
    obj.hero='0'
    obj.item='0'
    obj.DataA1='0'
    obj.DataB1='1'
    obj.DataC1='1'
    obj.DataE1='0'
    obj.DataF1='darkportal'
    obj.levels='1'
    obj.race='creeps'
    obj.Cool1='1'
    obj.targs1='item'
    obj.Cost1='0'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('Zz01')
    obj.Name='打造神器'
    obj.Tip='任意装备+黑水晶（附带属性）*3=重铸装备'
    obj.Buttonpos1='0'
    obj.Buttonpos2='2'
    obj.Animnames=''
    obj.CasterArt=''
    obj.hero='0'
    obj.item='0'
    obj.DataA1='0'
    obj.DataC1='1'
    obj.DataE1='0'
    obj.DataF1='phaseshifton'
    obj.levels='1'
    obj.race='creeps'
    obj.Cool1='1'
    obj.Cost1='0'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('Zz02')
    obj.Name='重铸装备'
    obj.Tip='重铸装备'
    obj.Buttonpos1='0'
    obj.Buttonpos2='1'
    obj.Animnames=''
    obj.CasterArt=''
    obj.hero='0'
    obj.item='0'
    obj.DataA1='0'
    obj.DataC1='1'
    obj.DataE1='0'
    obj.DataF1='disenchant'
    obj.levels='1'
    obj.race='creeps'
    obj.Cool1='1'
    obj.Cost1='0'
table.insert(xG_ability_luaObj,obj)
?>
