-- 镜头
local mt = {}
-- 类型
mt.type = '镜头'

-- 设置玩家镜头矩形区域边界
function mt.setCameraBounds(rect, player)
    local minX, minY = GetRectMinX(rect), GetRectMinY(rect)
    local maxX, maxY = GetRectMaxX(rect), GetRectMaxY(rect)
    if player then
        if gP.isLocalPlayer(player) then
            SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
        end
    else
        SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
    end
end

-- ============================================================================
-- Camera API
-- native SetCameraPosition takes real x, real y returns nothing
-- 设置空格键转向点(所有玩家) [R]
-- native SetCameraQuickPosition takes real x, real y returns nothing
-- 设置可用镜头区域(所有玩家) [R]
-- native SetCameraBounds takes real x1, real y1, real x2, real y2, real x3, real y3, real x4, real y4 returns nothing
-- 停止播放镜头(所有玩家) [R]
-- native StopCamera takes nothing returns nothing

-- 重置游戏镜头(所有玩家) [R]
-- native ResetToGameCamera takes real duration returns nothing
function mt.resetToGame(x, y, duration)
    ResetToGameCamera(x, y, duration)
end

-- native PanCameraTo takes real x, real y returns nothing

-- 平移镜头(所有玩家)(限时) [R]
-- native PanCameraToTimed takes real x, real y, real duration returns nothing
function mt.panToTimed(x, y, duration)
    PanCameraToTimed(x, y, duration)
end

-- native PanCameraToWithZ takes real x, real y, real zOffsetDest returns nothing
-- 指定高度平移镜头(所有玩家)(限时) [R]
-- native PanCameraToTimedWithZ takes real x, real y, real zOffsetDest, real duration returns nothing
-- 播放电影镜头(所有玩家) [R]
-- native SetCinematicCamera takes string cameraModelFile returns nothing
-- 指定点旋转镜头(所有玩家)(弧度)(限时) [R]
-- native SetCameraRotateMode takes real x, real y, real radiansToSweep, real duration returns nothing
-- 设置镜头属性(所有玩家)(限时) [R]
-- native SetCameraField takes camerafield whichField, real value, real duration returns nothing
-- native AdjustCameraField takes camerafield whichField, real offset, real duration returns nothing
-- 锁定镜头到单位(所有玩家) [R]
-- native SetCameraTargetController takes unit whichUnit, real xoffset, real yoffset, boolean inheritOrientation returns nothing
-- 锁定镜头到单位(固定镜头源)(所有玩家) [R]
-- native SetCameraOrientController takes unit whichUnit, real xoffset, real yoffset returns nothing

-- native CreateCameraSetup takes nothing returns camerasetup
-- native CameraSetupSetField takes camerasetup whichSetup, camerafield whichField, real value, real duration returns nothing
-- 镜头属性(指定镜头) [R]
-- native CameraSetupGetField takes camerasetup whichSetup, camerafield whichField returns real
-- native CameraSetupSetDestPosition takes camerasetup whichSetup, real x, real y, real duration returns nothing
-- 摄象机的目标
-- native CameraSetupGetDestPositionLoc takes camerasetup whichSetup returns location
-- native CameraSetupGetDestPositionX takes camerasetup whichSetup returns real
-- native CameraSetupGetDestPositionY takes camerasetup whichSetup returns real
-- native CameraSetupApply takes camerasetup whichSetup, boolean doPan, boolean panTimed returns nothing
-- native CameraSetupApplyWithZ takes camerasetup whichSetup, real zDestOffset returns nothing
-- 应用镜头(所有玩家)(限时) [R]
-- native CameraSetupApplyForceDuration takes camerasetup whichSetup, boolean doPan, real forceDuration returns nothing
-- native CameraSetupApplyForceDurationWithZ takes camerasetup whichSetup, real zDestOffset, real forceDuration returns nothing
-- native BlzCameraSetupSetLabel takes camerasetup whichSetup, string label returns nothing
-- native BlzCameraSetupGetLabel takes camerasetup whichSetup returns string

-- native CameraSetTargetNoise takes real mag, real velocity returns nothing
-- native CameraSetSourceNoise takes real mag, real velocity returns nothing

-- 摇晃镜头目标(所有玩家) [R]
-- native CameraSetTargetNoiseEx takes real mag, real velocity, boolean vertOnly returns nothing
-- 摇晃镜头源(所有玩家) [R]
-- native CameraSetSourceNoiseEx takes real mag, real velocity, boolean vertOnly returns nothing

-- native CameraSetSmoothingFactor takes real factor returns nothing

-- native CameraSetFocalDistance takes real distance returns nothing
-- native CameraSetDepthOfFieldScale takes real scale returns nothing

-- native SetCineFilterTexture takes string filename returns nothing
-- native SetCineFilterBlendMode takes blendmode whichMode returns nothing
-- native SetCineFilterTexMapFlags takes texmapflags whichFlags returns nothing
-- native SetCineFilterStartUV takes real minu, real minv, real maxu, real maxv returns nothing
-- native SetCineFilterEndUV takes real minu, real minv, real maxu, real maxv returns nothing
-- native SetCineFilterStartColor takes integer red, integer green, integer blue, integer alpha returns nothing
-- native SetCineFilterEndColor takes integer red, integer green, integer blue, integer alpha returns nothing
-- native SetCineFilterDuration takes real duration returns nothing
-- native DisplayCineFilter takes boolean flag returns nothing
-- native IsCineFilterDisplayed takes nothing returns boolean

-- native SetCinematicScene takes integer portraitUnitId, playercolor color, string speakerTitle, string text, real sceneDuration, real voiceoverDuration returns nothing
-- native EndCinematicScene takes nothing returns nothing
-- native ForceCinematicSubtitles takes boolean flag returns nothing
-- native SetCinematicAudio takes boolean cinematicAudio returns nothing

-- native GetCameraMargin takes integer whichMargin returns real

-- These return values for the local players camera only...
-- These return values for the local players camera only...
-- constant native GetCameraBoundMinX takes nothing returns real
-- constant native GetCameraBoundMinY takes nothing returns real
-- constant native GetCameraBoundMaxX takes nothing returns real
-- constant native GetCameraBoundMaxY takes nothing returns real
-- 当前摄象机的数值
-- constant native GetCameraField takes camerafield whichField returns real
-- 当前摄象机的目标的 X 坐标
-- constant native GetCameraTargetPositionX takes nothing returns real
-- 当前摄象机的目标的 Y 坐标
-- constant native GetCameraTargetPositionY takes nothing returns real
-- 当前摄象机的目标的 Z 坐标
-- constant native GetCameraTargetPositionZ takes nothing returns real
-- 当前摄象机的目标
-- constant native GetCameraTargetPositionLoc takes nothing returns location
-- 当前摄象机的位置的 X 坐标
-- constant native GetCameraEyePositionX takes nothing returns real
-- 当前摄象机的位置的 Y 坐标
-- constant native GetCameraEyePositionY takes nothing returns real
-- 当前摄象机的位置的 Z 坐标
-- constant native GetCameraEyePositionZ takes nothing returns real
-- 当前照相机的位置
-- constant native GetCameraEyePositionLoc takes nothing returns location

return mt
