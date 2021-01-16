<? xG_unit_luaObj={}
local slk = require 'slk'
obj=slk.unit.ngme:new('sp01') 
	obj.Name='项链'
    obj.Sellitems='XL01,XL02,XL03,XL04,XL05,XL06,XL07,XL08,XL09,XL10,XL11'
	--obj.modelScale='1.2'
	--obj.file='LNwu111.mdl'
	obj.uberSplat=''
table.insert(xG_unit_luaObj,obj)
obj=slk.unit.ngme:new('sp02') 
	obj.Name='玉佩'
    obj.Sellitems='YP01,YP02,YP03,YP04,YP05,YP06,YP07,YP08,YP09,YP10'
	--obj.modelScale='1.2'
	--obj.file='LNwu111.mdl'
	obj.uberSplat=''
table.insert(xG_unit_luaObj,obj)
obj=slk.unit.ngme:new('sp03') 
	obj.Sellitems='SZ01,SZ02,SZ03,SZ04,SZ05,SZ06,SZ07,SZ08,SZ09,SZ10'
	obj.Name='手镯'
	--obj.modelScale='1.2'
	--obj.file='LNwu111.mdl'
	obj.uberSplat=''
table.insert(xG_unit_luaObj,obj)
?>
