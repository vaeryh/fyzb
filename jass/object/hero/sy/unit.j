<? xG_unit_luaObj={}
local slk = require 'slk'
obj=slk.unit.Oshd:new('Sy00') 
	obj.Name='神医'
	obj.EditorSuffix='智力英雄'
	obj.abilList='SyD0,SyD1,AInv'
	obj.heroAbilList='SyQ0,SyW0,SyE0,SyR0'
	obj.Propernames='神医'
table.insert(xG_unit_luaObj,obj)
obj=slk.unit.ucs1:new('syq1') 
	obj.Name='神医'
	obj.EditorSuffix='尸蟞（等级1）'
	obj.type=''
table.insert(xG_unit_luaObj,obj)
?>
