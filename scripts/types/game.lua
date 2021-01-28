
local mt = {}

-- 类型：游戏
mt.type = 'game'

-- 自定义 - 设置 玩家1(红色) 胜利(显示 胜利对话框, 显示 计分屏)
function mt.CustomVictory(whichPlayer, showDialog, showScores)
    if mt.AllowVictoryDefeat(PLAYER_GAME_RESULT_VICTORY) then
        -- 踢出玩家，游戏结果为胜利、失败、平局
        RemovePlayer(whichPlayer, PLAYER_GAME_RESULT_VICTORY)

        if not bj_isSinglePlayer then
            DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString("PLAYER_VICTORIOUS"))
        end

        -- UI only needs to be displayed to users.
        if GetPlayerController(whichPlayer) == MAP_CONTROL_USER then
            bj_changeLevelShowScores = showScores
            if showDialog then
                mt.CustomVictoryDialog(whichPlayer)
            else
                mt.CustomVictorySkip(whichPlayer)
            end
        end
    end
end

-- 玩家\游戏\结果\
function mt.AllowVictoryDefeat(gameResult)
    -- 玩家\游戏\结果\胜利
    if (gameResult == PLAYER_GAME_RESULT_VICTORY) then
        return not IsNoVictoryCheat() -- 胜利是否为真
    end
    -- 玩家\游戏\结果\失败
    if (gameResult == PLAYER_GAME_RESULT_DEFEAT) then
        return not IsNoDefeatCheat() -- 失败是否为真
    end
    -- 玩家\游戏\结果\平局
    if (gameResult == PLAYER_GAME_RESULT_NEUTRAL) then
        return not IsNoVictoryCheat() and not IsNoDefeatCheat()
    end
    return true
end

-- 自定义胜利对话框
function mt.CustomVictoryDialog(whichPlayer)
    local t = CreateTrigger()
    local d = DialogCreate()

    DialogSetMessage(d, GetLocalizedString("GAMEOVER_VICTORY_MSG"))

    t = CreateTrigger()
    TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE"),
        GetLocalizedHotkey("GAMEOVER_CONTINUE")))
    TriggerAddAction(t, mt.CustomVictoryOkBJ)

    t = CreateTrigger()
    TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"),
        GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
    TriggerAddAction(t, mt.CustomVictoryQuitBJ)

    if GetLocalPlayer() == whichPlayer then
        EnableUserControl(true)
        if bj_isSinglePlayer then
            PauseGame(true)
        end
        EnableUserUI(false)
    end

    DialogDisplay(whichPlayer, d, true)
    -- 播放胜利声音
    if whichPlayer == GetLocalPlayer() then
        gSound.setVolumeGroupVolume(SOUND_VOLUMEGROUP.UI, 1.00)
        gSound.StartSound(bj_victoryDialogSound) -- 播放胜利对话框声音
    end
end

-- 自定义胜利跳过记分屏
function mt.CustomVictorySkip(whichPlayer)
    if (GetLocalPlayer() == whichPlayer) then
        if bj_isSinglePlayer then
            -- Bump the difficulty back up to the default.
            SetGameDifficulty(GetDefaultDifficulty())
        end

        if (bj_changeLevelMapName == nil) then
            EndGame(bj_changeLevelShowScores)
        else
            ChangeLevel(bj_changeLevelMapName, bj_changeLevelShowScores)
        end
    end
end

--
function mt.CustomVictoryOkBJ()
    if bj_isSinglePlayer then
        PauseGame(false)
        -- Bump the difficulty back up to the default.
        SetGameDifficulty(GetDefaultDifficulty())
    end

    if (bj_changeLevelMapName == nil) then
        EndGame(bj_changeLevelShowScores)
    else
        ChangeLevel(bj_changeLevelMapName, bj_changeLevelShowScores)
    end
end

--
function mt.CustomVictoryQuitBJ()
    -- 是否单人游戏
    if bj_isSinglePlayer then
        PauseGame(false) -- 暂停游戏
        -- Bump the difficulty back up to the default.将难度恢复为默认值。
        SetGameDifficulty(GetDefaultDifficulty()) -- 设置游戏难度
    end
    -- 是否结束游戏
    EndGame(bj_changeLevelShowScores)
end

return mt
