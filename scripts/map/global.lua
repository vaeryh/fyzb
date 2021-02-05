local mt = {}

-- 矩形
mt.rect = {
    -- 回城矩形
    ['回城矩形'] = gg_rct_HG,
    -- 选择英雄矩形
    ['选择英雄矩形'] = gg_rct_FirstHeroSelection,
    -- 主城矩形
    ['主城矩形'] = gg_rct_TheMainBase,
    -- 发兵矩形1
    ['发兵矩形1'] = gg_rct_AttackLine1,
    --练功房玩家1
    ['练功房矩形1'] =gg_rct_TrainRoom_Player0,
    --练功房玩家2
    ['练功房矩形2'] =gg_rct_TrainRoom_Player1,
    --练功房玩家3
    ['练功房矩形3'] =gg_rct_TrainRoom_Player2,
    --练功房玩家4
    ['练功房矩形4'] =gg_rct_TrainRoom_Player3,
}

-- 声音
mt.sound = {
    ['选择英雄音乐'] = gg_snd_Zandy01,
    ['基地附近音乐'] = gg_snd_FezdYezf01,
    --治疗守卫音效
    HealingWard = "Units\\Orc\\HealingWard\\PlaceAncestralGuardian.wav",
}

return mt
