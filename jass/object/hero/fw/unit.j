<? xG_unit_luaObj={}
local slk = require 'slk'
obj=slk.unit.Hvwd:new('Fw00') 
	obj.Name='凤舞'
	obj.EditorSuffix='敏捷英雄'
    obj.Propernames='凤舞'
	obj.abilList='FwD0,AInv'
	obj.heroAbilList='FwQ0,FwW0,FwE0,FwR0,Aamk'
table.insert(xG_unit_luaObj,obj)
obj=slk.unit.Hvwd:new('Fw01') 
    obj.Propernames='凤舞'
	obj.EditorSuffix='E-马甲'
	obj.abilList='Alov'
    obj.collision=''
    obj.Missilespeed='1000'
    obj.movetp=''
    obj.cool1='0.1'
    obj.hideOnMinimap='1'
    obj.hideHeroMinimap='1'
    obj.hideHeroBar='1'
    obj.hideHeroDeathMsg='1'
table.insert(xG_unit_luaObj,obj)
?>
