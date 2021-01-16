<? xG_unit_luaObj={}
local slk = require 'slk'
obj=slk.unit.ngme:new('fj01') 
	obj.Sellitems='FJ02,FJ04,FJ06,FJ08,FJ10,FJ12,FJ14,FJ16,FJ18,FJ20,FJ22'
	obj.Name='防-女'
	--obj.modelScale='2'
	--obj.file='LNwu111.mdl'
	obj.uberSplat=''
table.insert(xG_unit_luaObj,obj)
obj=slk.unit.ngme:new('fj02') 
	obj.Sellitems='FJ01,FJ03,FJ05,FJ07,FJ09,FJ11,FJ13,FJ15,FJ17,FJ19,FJ21'
	obj.Name='防-男'
	--obj.modelScale='2'
	--obj.file='LNwu111.mdl'
	obj.uberSplat=''
table.insert(xG_unit_luaObj,obj)
?>
