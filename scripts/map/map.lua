local mt = {}

-- 矩形
mt.rect = {
    -- 回城矩形
    ['回城矩形'] = gg_rct_HG,
    -- 选择英雄矩形
    ['选择英雄矩形'] = gg_rct_FirstHeroSelection,
    -- 主城矩形
    ['主城矩形'] = gg_rct_TheMainBase
}

-- 声音
mt.sound = {
    ['选择英雄音乐'] = jass.gg_snd_Zandy01,
    ['基地附近音乐'] = jass.gg_snd_FezdYezf01
}

return map
