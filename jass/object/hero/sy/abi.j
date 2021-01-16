<? xG_ability_luaObj={}
local slk = require 'slk'
obj=slk.ability.Aspo:new('SyD0') 
	obj.EditorSuffix='D药王神经-蛊毒'
	obj.Name='神医'
	obj.Buttonpos1='0'
	obj.Buttonpos2='-11'
	obj.Art='ReplaceableTextures\\PassiveButtons\\PASBTNPoisonSting.blp'
	obj.race='orc'
	obj.DataB1='0'
	obj.DataC1='0'
	obj.DataD1='9'
	obj.Tip1='药王神经-蛊毒'
	obj.Ubertip1='各种医药毒物圣物都是神医的专属，神医能根据持有的专属来让自己的攻击附带毒性伤害，在5秒内造成专属等级*0.5*智力的伤害。（专属等级以图录最高等级为准）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.Aspb:new('SyD1') 
	obj.EditorSuffix='D药王神经-图录1'
	obj.Name='神医'
	obj.Hotkey='D'
	obj.Buttonpos1='1'
	obj.Buttonpos2='1'
	obj.Art='ReplaceableTextures\\PassiveButtons\\PASBTNMagicImmunity.blp'
	obj.race='orc'
	obj.DataA1='T001,T002,T003,T004,T050,T051,T060,T061,T070,T071,SyD2'
	obj.DataB1='0'
	obj.DataC1='11'
	obj.DataD1='11'
	obj.DataE1='avatar'
	obj.Tip1='药王神经-图录(|cffffcc00D|r)'
	obj.Ubertip1='药王神经-图录'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.Aspb:new('SyD2') 
	obj.EditorSuffix='D药王神经-图录2'
	obj.Name='神医'
	obj.Hotkey='C'
	obj.Buttonpos1='3'
	obj.Buttonpos2='2'
	obj.Art='ReplaceableTextures\\PassiveButtons\\PASBTNMagicImmunity.blp'
	obj.race='orc'
	obj.DataA1='T080,T081,T090,T091,T100,T101'
	obj.DataB1='0'
	obj.DataC1='11'
	obj.DataD1='11'
	obj.DataE1='absorb'
	obj.Tip1='下一页(|cffffcc00C|r)'
	obj.Ubertip1='药王神经-图录'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('SyQ0') 
	obj.EditorSuffix='Q药王神经-饲养'
	obj.Name='神医'
	obj.Hotkey='Q'
	obj.Researchhotkey='Q'
	obj.Buttonpos1='0'
	obj.Buttonpos2='2'
	obj.Researchbuttonpos1='0'
	obj.Researchbuttonpos2='0'
	obj.Art='ReplaceableTextures\\CommandButtons\\BTNCarrionScarabs.blp'
	obj.ResearchArt='ReplaceableTextures\\CommandButtons\\BTNCarrionScarabs.blp'
	obj.EffectArt='Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl'
	obj.TargetArt=''
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.race='orc'
	obj.levels='5'
    obj.levelSkip='9'
	obj.Cool1='10'
	obj.Cool2='10'
	obj.Cool3='10'
	obj.Cool4='10'
	obj.Cool5='10'
	obj.Cost1='50'
	obj.Cost2='100'
	obj.Cost3='150'
	obj.Cost4='200'
	obj.Cost5='250'
	obj.Area1='200'
	obj.Area2='250'
	obj.Area3='300'
	obj.Area4='350'
	obj.Area5='400'
	obj.DataA1='0'
	obj.DataA2='0'
	obj.DataA3='0'
	obj.DataA4='0'
	obj.DataA5='0'
	obj.DataB1='2'
	obj.DataB2='2'
	obj.DataB3='2'
	obj.DataB4='2'
	obj.DataB5='2'
	obj.DataC1='3'
	obj.DataC2='3'
	obj.DataC3='3'
	obj.DataC4='3'
	obj.DataC5='3'
	obj.DataE1='0'
	obj.DataE2='0'
	obj.DataE3='0'
	obj.DataE4='0'
	obj.DataE5='0'
	obj.DataF1='farsight'
	obj.DataF2='farsight'
	obj.DataF3='farsight'
	obj.DataF4='farsight'
	obj.DataF5='farsight'
	obj.Researchtip='学习药王神经-饲养(|cffffcc00Q|r) - [|cffffcc00等级 %d|r]'
	obj.Researchubertip='神医召唤3/4/5/6/7只用毒物培养的尸蟞来攻击敌人，尸蟞攻击造成神医智力*0.05*专属等级的伤害。'
	obj.Tip1='药王神经-饲养(|cffffcc00Q|r) - [|cffffcc00等级 1|r]'
	obj.Tip2='药王神经-饲养(|cffffcc00Q|r) - [|cffffcc00等级 2|r]'
	obj.Tip3='药王神经-饲养(|cffffcc00Q|r) - [|cffffcc00等级 3|r]'
	obj.Tip4='药王神经-饲养(|cffffcc00Q|r) - [|cffffcc00等级 4|r]'
	obj.Tip5='药王神经-饲养(|cffffcc00Q|r) - [|cffffcc00等级 5|r]'
	obj.Ubertip1='神医召唤3/4/5/6/7只用毒物培养的尸蟞来攻击敌人，尸蟞攻击造成神医智力*0.05*专属等级的伤害。'
	obj.Ubertip2='神医召唤3/4/5/6/7只用毒物培养的尸蟞来攻击敌人，尸蟞攻击造成神医智力*0.05*专属等级的伤害。'
	obj.Ubertip3='神医召唤3/4/5/6/7只用毒物培养的尸蟞来攻击敌人，尸蟞攻击造成神医智力*0.05*专属等级的伤害。'
	obj.Ubertip4='神医召唤3/4/5/6/7只用毒物培养的尸蟞来攻击敌人，尸蟞攻击造成神医智力*0.05*专属等级的伤害。'
	obj.Ubertip5='神医召唤3/4/5/6/7只用毒物培养的尸蟞来攻击敌人，尸蟞攻击造成神医智力*0.05*专属等级的伤害。'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ACbh:new('sbzj') 
	obj.EditorSuffix='饲养-召唤物'
	obj.Name='神医'
	obj.Buttonpos1='0'
	obj.Buttonpos2='-11'
	obj.race='orc'
	obj.BuffID1='qwer'
	obj.Dur1='.001'
	obj.HeroDur1='.001'
	obj.DataA1='100'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.Arej:new('SyW0') 
	obj.EditorSuffix='W药王神经-治疗'
	obj.Name='神医'
	obj.Requires=''
	obj.Hotkey='W'
	obj.Researchhotkey='W'
	obj.Buttonpos1='1'
	obj.Buttonpos2='2'
	obj.Researchbuttonpos1='1'
	obj.Researchbuttonpos2='0'
	obj.Art='ReplaceableTextures\\CommandButtons\\BTNRejuvenation.blp'
	obj.ResearchArt='ReplaceableTextures\\CommandButtons\\BTNRejuvenation.blp'
	obj.hero='1'
	obj.race='orc'
	obj.levels='5'
    obj.levelSkip='10'
	obj.BuffID1='Brej'
	obj.BuffID2='Brej'
	obj.BuffID3='Brej'
	obj.BuffID4='Brej'
	obj.BuffID5='Brej'
	obj.Cool1='10'
	obj.Cool2='10'
	obj.Cool3='10'
	obj.Cool4='10'
	obj.Cool5='10'
	obj.targs1='air,ground,friend,vuln,invu,self,organic,neutral'
	obj.targs2='air,ground,friend,vuln,invu,self,organic,neutral'
	obj.targs3='air,ground,friend,vuln,invu,self,organic,neutral'
	obj.targs4='air,ground,friend,vuln,invu,self,organic,neutral'
	obj.targs5='air,ground,friend,vuln,invu,self,organic,neutral'
	obj.Dur1='5'
	obj.Dur2='5'
	obj.Dur3='5'
	obj.Dur4='5'
	obj.Dur5='5'
	obj.HeroDur1='5'
	obj.HeroDur2='5'
	obj.HeroDur3='5'
	obj.HeroDur4='5'
	obj.HeroDur5='5'
	obj.Cost1='50'
	obj.Cost2='100'
	obj.Cost3='150'
	obj.Cost4='200'
	obj.Cost5='250'
	obj.Rng1='400'
	obj.Rng2='450'
	obj.Rng3='500'
	obj.Rng4='550'
	obj.Rng5='600'
	obj.DataA1='10'
	obj.DataA2='10'
	obj.DataA3='10'
	obj.DataA4='10'
	obj.DataA5='10'
	obj.DataC1='3'
	obj.DataC2='3'
	obj.DataC3='3'
	obj.DataC4='3'
	obj.DataC5='3'
	obj.Researchtip='学习药王神经-治疗(|cffffcc00W|r) - [|cffffcc00等级 %d|r]'
	obj.Researchubertip='在5秒内恢复目标500/1000/1500/2000/2500+智力*0.5*专属等级的生命值。'
	obj.Tip1='药王神经-治疗(|cffffcc00W|r) - [|cffffcc00等级 1|r]'
	obj.Tip2='药王神经-治疗(|cffffcc00W|r) - [|cffffcc00等级 2|r]'
	obj.Tip3='药王神经-治疗(|cffffcc00W|r) - [|cffffcc00等级 3|r]'
	obj.Tip4='药王神经-治疗(|cffffcc00W|r) - [|cffffcc00等级 4|r]'
	obj.Tip5='药王神经-治疗(|cffffcc00W|r) - [|cffffcc00等级 5|r]'
	obj.Ubertip1='在5秒内恢复目标500/1000/1500/2000/2500+智力*0.5*专属等级的生命值。'
	obj.Ubertip2='在5秒内恢复目标500/1000/1500/2000/2500+智力*0.5*专属等级的生命值。'
	obj.Ubertip3='在5秒内恢复目标500/1000/1500/2000/2500+智力*0.5*专属等级的生命值。'
	obj.Ubertip4='在5秒内恢复目标500/1000/1500/2000/2500+智力*0.5*专属等级的生命值。'
	obj.Ubertip5='在5秒内恢复目标500/1000/1500/2000/2500+智力*0.5*专属等级的生命值。'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('SyE0') 
	obj.EditorSuffix='E药王神经-培育'
	obj.Name='神医'
	obj.Hotkey='E'
	obj.Researchhotkey='E'
	obj.Buttonpos1='2'
	obj.Buttonpos2='2'
	obj.Researchbuttonpos1='2'
	obj.Researchbuttonpos2='0'
	obj.Art='ReplaceableTextures\\CommandButtons\\BTNHealingWard.blp'
	obj.ResearchArt='ReplaceableTextures\\CommandButtons\\BTNHealingWard.blp'
	obj.EffectArt=''
	obj.TargetArt=''
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='1'
	obj.race='orc'
	obj.levels='5'
    obj.levelSkip='9'
	obj.targs1='10'
	obj.targs2='10'
	obj.targs3='10'
	obj.targs4='10'
	obj.targs5='10'
	obj.Rng1='400'
	obj.Rng2='500'
	obj.Rng3='600'
	obj.Rng4='700'
	obj.Rng5='800'
	obj.Area1='400'
	obj.Area2='500'
	obj.Area3='600'
	obj.Area4='700'
	obj.Area5='800'
	obj.DataA1='0'
	obj.DataA2='0'
	obj.DataA3='0'
	obj.DataA4='0'
	obj.DataA5='0'
	obj.DataB1='2'
	obj.DataB2='2'
	obj.DataB3='2'
	obj.DataB4='2'
	obj.DataB5='2'
	obj.DataC1='3'
	obj.DataC2='3'
	obj.DataC3='3'
	obj.DataC4='3'
	obj.DataC5='3'
	obj.DataE1='0'
	obj.DataE2='0'
	obj.DataE3='0'
	obj.DataE4='0'
	obj.DataE5='0'
	obj.DataF1='firebolt'
	obj.DataF2='firebolt'
	obj.DataF3='firebolt'
	obj.DataF4='firebolt'
	obj.DataF5='firebolt'
	obj.Researchtip='学习药王神经-培育(|cffffcc00E|r) - [|cffffcc00等级 %d|r]'
	obj.Researchubertip='神医培育的专属丢并且范围内的敌人/友军受到此时附魔的圣物/毒物的效果。'
	obj.Tip1='药王神经-培育(|cffffcc00E|r) - [|cffffcc00等级 1|r]'
	obj.Tip2='药王神经-培育(|cffffcc00E|r) - [|cffffcc00等级 2|r]'
	obj.Tip3='药王神经-培育(|cffffcc00E|r) - [|cffffcc00等级 3|r]'
	obj.Tip4='药王神经-培育(|cffffcc00E|r) - [|cffffcc00等级 4|r]'
	obj.Tip5='药王神经-培育(|cffffcc00E|r) - [|cffffcc00等级 5|r]'
	obj.Ubertip1='神医培育的专属丢并且范围内的敌人/友军受到此时附魔的圣物/毒物的效果。'
	obj.Ubertip2='神医培育的专属丢并且范围内的敌人/友军受到此时附魔的圣物/毒物的效果。'
	obj.Ubertip3='神医培育的专属丢并且范围内的敌人/友军受到此时附魔的圣物/毒物的效果。'
	obj.Ubertip4='神医培育的专属丢并且范围内的敌人/友军受到此时附魔的圣物/毒物的效果。'
	obj.Ubertip5='神医培育的专属丢并且范围内的敌人/友军受到此时附魔的圣物/毒物的效果。'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ACav:new('SyE1') 
	obj.EditorSuffix='E光环'
	obj.Name='神医'
	obj.race='orc'
	obj.BuffID1='SyEb'
	obj.DataA1='0'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.Asth:new('SyR0') 
	obj.EditorSuffix='R药王神经-附魔'
	obj.Name='神医'
	obj.Requires=''
	obj.Hotkey='R'
	obj.Researchhotkey='R'
	obj.Buttonpos1='3'
	obj.Buttonpos2='2'
	obj.Researchbuttonpos1='3'
	obj.Researchbuttonpos2='0'
	obj.Art='ReplaceableTextures\\CommandButtons\\BTNLifeDrain.blp'
	obj.ResearchArt='ReplaceableTextures\\CommandButtons\\BTNLifeDrain.blp'
	obj.hero='1'
	obj.race='orc'
	obj.levels='3'
	obj.reqLevel='30'
	obj.Researchtip='学习药王神经-附魔(|cffffcc00R|r) - [|cffffcc00等级 %d|r]'
	obj.Researchubertip='被动：神医能根据药王图录内的专属点亮程度，使自己的被动伤害加成（专属等级）%。'
	obj.Tip1='药王神经-附魔(|cffffcc00R|r) - [|cffffcc00等级 1|r]'
	obj.Tip2='药王神经-附魔(|cffffcc00R|r) - [|cffffcc00等级 2|r]'
	obj.Tip3='药王神经-附魔(|cffffcc00R|r) - [|cffffcc00等级 3|r]'
	obj.Ubertip1='被动：神医能根据药王图录内的专属点亮程度，使自己的被动伤害加成（专属等级）%。'
	obj.Ubertip2='被动：神医能根据药王图录内的专属点亮程度，使自己的被动伤害加成（专属等级）%。'
	obj.Ubertip3='被动：神医能根据药王图录内的专属点亮程度，使自己的被动伤害加成（专属等级）%。'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T001') 
	obj.EditorSuffix='1'
	obj.Name='图录'
	obj.Hotkey='Q'
	obj.Buttonpos1='0'
	obj.Buttonpos2='0'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='coupletarget'
	obj.Tip1='玉蜂(|cffffcc00Q|r)'
	obj.Ubertip1='玉蜂（每次普攻减敌人移速10%，可叠加3次）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T002') 
	obj.EditorSuffix='2'
	obj.Name='图录'
	obj.Hotkey='W'
	obj.Buttonpos1='1'
	obj.Buttonpos2='0'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='scout'
	obj.Tip1='闪电貂(|cffffcc00W|r)'
	obj.Ubertip1='闪电貂（敌人攻击时20%纪律被定身（对敌人施加净化））'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T003') 
	obj.EditorSuffix='3'
	obj.Name='图录'
	obj.Hotkey='E'
	obj.Buttonpos1='2'
	obj.Buttonpos2='0'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='selfdestruct'
	obj.Tip1='冰蚕(|cffffcc00E|r)'
	obj.Ubertip1='冰蚕（攻击时20%几率冰冻敌人）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T004') 
	obj.EditorSuffix='4'
	obj.Name='图录'
	obj.Hotkey='R'
	obj.Buttonpos1='3'
	obj.Buttonpos2='0'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='sentinel'
	obj.Tip1='西域曼陀罗(|cffffcc00R|r)'
	obj.Ubertip1='西域曼陀罗（攻击会以每秒消耗敌方1%的蓝量，持续5秒，可刷新）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T050') 
	obj.EditorSuffix='50'
	obj.Name='图录'
	obj.Hotkey='A'
	obj.Buttonpos1='0'
	obj.Buttonpos2='1'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='setrally'
	obj.Tip1='人面魔珠(|cffffcc00A|r)'
	obj.Ubertip1='人面魔珠（攻击附带主属性*0.5额外物理技能伤害）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T051') 
	obj.EditorSuffix='51'
	obj.Name='图录'
	obj.Hotkey='S'
	obj.Buttonpos1='1'
	obj.Buttonpos2='1'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='slowon'
	obj.Tip1='彼岸花(|cffffcc00S|r)'
	obj.Ubertip1='彼岸花（5%几率将敌人（非BOSS）转化为己方单位）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T060') 
	obj.EditorSuffix='60'
	obj.Name='图录'
	obj.Hotkey='D'
	obj.Buttonpos1='2'
	obj.Buttonpos2='1'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='spies'
	obj.Tip1='金鳞幻蝶(|cffffcc00D|r)'
	obj.Ubertip1='金鳞幻蝶（增加闪避30%）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T061') 
	obj.EditorSuffix='61'
	obj.Name='图录'
	obj.Hotkey='F'
	obj.Buttonpos1='3'
	obj.Buttonpos2='1'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='spirittroll'
	obj.Tip1='白鹤灵芝草(|cffffcc00F|r)'
	obj.Ubertip1='白鹤灵芝草（攻击时回复主属性*0.1的血量）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T070') 
	obj.EditorSuffix='70'
	obj.Name='图录'
	obj.Hotkey='Z'
	obj.Buttonpos1='0'
	obj.Buttonpos2='2'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='hex'
	obj.Tip1='杖头双蛇(|cffffcc00Z|r)'
	obj.Ubertip1='杖头双蛇（普工消耗敌人，自己主属性*0.2，的血量蓝量）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T071') 
	obj.EditorSuffix='71'
	obj.Name='图录'
	obj.Hotkey='X'
	obj.Buttonpos1='1'
	obj.Buttonpos2='2'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='240'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='holdposition'
	obj.Tip1='九死还魂草(|cffffcc00X|r)'
	obj.Ubertip1='九死还魂草（死亡时复活，内置CD5分钟）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T080') 
	obj.EditorSuffix='80'
	obj.Name='图录'
	obj.Hotkey='Q'
	obj.Buttonpos1='2'
	obj.Buttonpos2='2'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='howlofterror'
	obj.Tip1='赤焰金龟(|cffffcc00Q|r)'
	obj.Ubertip1='赤焰金龟（敌人受到普攻伤害增加30%）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T081') 
	obj.EditorSuffix='81'
	obj.Name='图录'
	obj.Hotkey='W'
	obj.Buttonpos1='0'
	obj.Buttonpos2='0'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='impale'
	obj.Tip1='血菩提(|cffffcc00W|r)'
	obj.Ubertip1='血菩提（减少受到的普攻伤害30%）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T090') 
	obj.EditorSuffix='90'
	obj.Name='图录'
	obj.Hotkey='E'
	obj.Buttonpos1='1'
	obj.Buttonpos2='0'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='inferno'
	obj.Tip1='朱睛冰蟾(|cffffcc00E|r)'
	obj.Ubertip1='朱睛冰蟾（处于战斗状态的己方单位每隔5秒清除异常状态一次）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T091') 
	obj.EditorSuffix='91'
	obj.Name='图录'
	obj.Hotkey='R'
	obj.Buttonpos1='2'
	obj.Buttonpos2='0'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='innerfireon'
	obj.Tip1='天羽灵香(|cffffcc00R|r)'
	obj.Ubertip1='天羽灵香（增加己方单位40%攻速、移速）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T100') 
	obj.EditorSuffix='100'
	obj.Name='图录'
	obj.Hotkey='A'
	obj.Buttonpos1='3'
	obj.Buttonpos2='0'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='load'
	obj.Tip1='莽牯朱蛤(|cffffcc00A|r)'
	obj.Ubertip1='莽牯朱蛤（降低敌方单位30%攻击力、30%护甲值'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('T101') 
	obj.EditorSuffix='101'
	obj.Name='图录'
	obj.Hotkey='S'
	obj.Buttonpos1='0'
	obj.Buttonpos2='1'
	obj.Animnames='channel'
	obj.CasterArt=''
	obj.hero='0'
	obj.race='orc'
	obj.levels='1'
	obj.Cool1='1'
	obj.DataA1='0'
	obj.DataC1='1'
	obj.DataD1='0'
	obj.DataE1='0'
	obj.DataF1='loadcorpse'
	obj.Tip1='七星海棠(|cffffcc00S|r)'
	obj.Ubertip1='七星海棠（增加己方单位30%攻击力、30%护甲值）'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ACpu:new('Y002') 
	obj.EditorSuffix='闪电貂2'
	obj.Name='图录隐藏'
	obj.SpecialArt=''
	obj.race='orc'
	obj.HeroDur1='3'
	obj.DataA1='0'
	obj.DataC1='0'
	obj.DataD1='2'
	obj.DataE1='1'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.Aenr:new('Y003') 
	obj.EditorSuffix='冰蚕3'
	obj.Name='图录隐藏'
	obj.race='orc'
	obj.BuffID1='Bfrz'
	obj.targs1='enemies,ground,organic,neutral'
	obj.Dur1='3'
	obj.HeroDur1='2'
	obj.DataA1='0'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.AOre:new('Y071') 
	obj.EditorSuffix='九死还魂草71'
	obj.Name='图录隐藏'
	obj.Buttonpos1='0'
	obj.Buttonpos2='-11'
	obj.hero='0'
	obj.race='orc'
	obj.Cool1='240'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.SCae:new('Y091') 
	obj.EditorSuffix='天羽灵香91'
	obj.Name='图录隐藏'
	obj.Buttonpos1='0'
	obj.Buttonpos2='-11'
	obj.race='orc'
	obj.BuffID1='B091'
	obj.DataA1='.4'
	obj.DataB1='.4'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ACro:new('Y100') 
	obj.EditorSuffix='莽牯朱蛤100'
	obj.Name='图录隐藏'
	obj.race='orc'
	obj.BuffID1='B100'
	obj.targs1='enemies,ground,air'
	obj.Dur1='4'
	obj.HeroDur1='4'
	obj.Area1='900'
	obj.DataA1='-.3'
	obj.DataB1='-30'
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ACro:new('Y101') 
	obj.EditorSuffix='七星海棠101'
	obj.Name='图录隐藏'
	obj.race='orc'
	obj.BuffID1='B101'
	obj.Dur1='4'
	obj.HeroDur1='4'
	obj.Area1='900'
	obj.DataA1='.3'
	obj.DataB1='30'
table.insert(xG_ability_luaObj,obj)
?>
