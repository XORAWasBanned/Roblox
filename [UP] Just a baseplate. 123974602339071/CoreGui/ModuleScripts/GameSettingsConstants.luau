-- Path: CoreGui.RobloxGui.Modules.Settings.Resources.GameSettingsConstants
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local v2 = game:GetService("CorePackages")
local v3 = game:GetEngineFeature("PartyVoiceVolume")
local v4 = require(v1.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting)
local v5 = require(v2.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local v6 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent
local v7 = require(v1.Settings.Flags.FFlagIEMSettingsGroups)
local v8 = game:GetEngineFeature("RUUserScalePreferenceAPI")
local v9 = require(v2.Workspace.Packages.SharedFlags).FFlagUIScaleEngineOptions
local v10 = require(v2.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local v11 = game:DefineFastFlag("UpdateRephraseSettingUI", false)
local v12 = require(v2.Workspace.Packages.SharedFlags).FFlagChatSummariesSettingEnabled
local v13 = require(v2.Workspace.Packages.SharedFlags).FFlagExpChatEnableFriendsTab
local v14 = require(v2.Workspace.Packages.SharedFlags).FFlagExpChatDictationVoiceTypingModeSetting
local v15 = require(v1.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
local v16 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v17 = require(v2.Packages.ReactUtils)
local v18 = game:DefineFastInt("ChatModerationFrameLayoutOrder", 9)
local v19 = {
	["MoreSettingsBanner"] = 0,
	["OverscanAdjustButton"] = 1
}
if v6 then
	v19.ChatModerationFrame = v18
end
v19.ShiftLockFrame = 10
v19.CameraModeFrame = 11
v19.MovementModeFrame = 12
v19.FramerateCap = 13
v19.GamepadSensitivityFrame = 14
v19.CameraInvertedFrame = 90
v19.CameraDeviceFrame = 91
v19.MouseAdvancedFrame = 50
v19.VoiceConnectDisconnectSelector = 17
v19.VoiceConnectFrame = 18
v19.VoiceDisconnectFrame = 19
if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
	v19.PlayerChoiceTranslationFrame = 20
	v19.LanguageSelectorFrame = 21
	v19.ChatTranslationFrame = 30
	v19.ChatLanguageSelectorFrame = 31
	v19.ChatTranslationToggleFrame = 32
	v19.FeedbackModeButton = 40
else
	v19.LanguageSelectorFrame = 20
	v19.FeedbackModeButton = 30
	v19.ChatTranslationFrame = 40
	v19.ChatLanguageSelectorFrame = 41
	v19.ChatTranslationToggleFrame = 42
end
if v13 then
	v19.ChatNotificationsFrame = 44
end
if v16 then
	v19.VRComfortSettingFrame = 54
	v19.VRVignetteEnabledFrame = 55
	v19.VRSteppedRotationEnabledFrame = 56
	v19.VRThirdPersonFixedCamEnabledFrame = 57
	v19.VRSafetyBubbleModeFrame = 58
end
v19.DeviceFrameInput = 60
v19.DeviceFrameOutput = 61
v19.VolumeFrame = 62
if v15 then
	v19.VoiceChatVolumeFrame = 63
	if v3 then
		v19.PartyVoiceVolumeFrame = 64
	end
	v19.HapticsFrame = v3 and 65 or 64
else
	if v3 then
		v19.PartyVoiceVolumeFrame = 63
	end
	v19.HapticsFrame = v3 and 64 or 63
end
v19.FullScreenFrame = 70
v19.GraphicsEnablerFrame = 71
v19.GraphicsQualityFrame = 72
v19.ReducedMotionFrame = 73
v19.PreferredTransparencyFrame = v9 and 77 or 74
v19.PreferredTextSizeFrame = v9 and 76 or 75
if v8 then
	v19.UIScaleModeFrame = 76
	v19.UIScaleFrame = 77
	v19.UiNavigationKeyBindEnabledFrame = 78
else
	v19.UiNavigationKeyBindEnabledFrame = 76
end
if v9 then
	v19.UIScaleEngineModeFrame = 74
	v19.UIScaleEngineFrame = 75
end
v19.PerformanceStatsFrame = 80
v19.MicroProfilerFrame = 81
v19.VREnabledFrame = 100
v19.DeveloperConsoleButton = 101
if v4() then
	v19.PlayerNamesEnabledFrame = 105
end
if v5 then
	v19.BadgeVisibilityFrame = 106
end
if v10 then
	v19.AIRephraseFrame = v11 and 20 or 43
end
if v12 then
	v19.ChatSummariesFrame = 20
end
if v14 then
	v19.VoiceTypingModeFrame = 16
end
v19.UiToggleRow = 200
v19.UiToggleRowCustom = 200
v19.UiToggleRowBillboards = 201
v19.UiToggleRowNameplates = 202
v19.FreecamToggleRow = 203
v19.InformationFrame = 999
local v20
if v7 then
	local v21 = v17.createNextOrder()
	local v22 = {
		["MoreSettingsBanner"] = v21(),
		["AudioHeader"] = v21(),
		["VolumeFrame"] = v21()
	}
	local v23
	if v15 then
		v23 = v21()
	else
		v23 = nil
	end
	v22.VoiceChatVolumeFrame = v23
	v22.PartyVoiceVolumeFrame = v21()
	v22.DeviceFrameInput = v21()
	v22.DeviceFrameOutput = v21()
	v22.AudioDivider = v21()
	v22.LanguageHeader = v21()
	local v24
	if v14 then
		v24 = v21()
	else
		v24 = nil
	end
	v22.VoiceTypingModeFrame = v24
	v22.ChatModerationFrame = v21()
	v22.VoiceConnectDisconnectSelector = v21()
	v22.VoiceConnectFrame = v21()
	v22.VoiceDisconnectFrame = v21()
	local v25
	if v12 then
		v25 = v21()
	else
		v25 = nil
	end
	v22.ChatSummariesFrame = v25
	local v26
	if v10 then
		v26 = v21()
	else
		v26 = nil
	end
	v22.AIRephraseFrame = v26
	local v27
	if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
		v27 = v21()
	else
		v27 = nil
	end
	v22.PlayerChoiceTranslationFrame = v27
	v22.LanguageSelectorFrame = v21()
	v22.FeedbackModeButton = v21()
	v22.ChatTranslationFrame = v21()
	v22.ChatLanguageSelectorFrame = v21()
	v22.ChatTranslationToggleFrame = v21()
	local v28
	if v13 then
		v28 = v21()
	else
		v28 = nil
	end
	v22.ChatNotificationsFrame = v28
	v22.LanguageDivider = v21()
	v22.DisplayHeader = v21()
	v22.OverscanAdjustButton = v21()
	v22.FullScreenFrame = v21()
	local v29
	if v9 then
		v29 = v21()
	else
		v29 = nil
	end
	v22.UIScaleEngineModeFrame = v29
	local v30
	if v9 then
		v30 = v21()
	else
		v30 = nil
	end
	v22.UIScaleEngineFrame = v30
	v22.PreferredTransparencyFrame = v21()
	v22.PreferredTextSizeFrame = v21()
	local v31
	if v8 then
		v31 = v21()
	else
		v31 = nil
	end
	v22.UIScaleModeFrame = v31
	local v32
	if v8 then
		v32 = v21()
	else
		v32 = nil
	end
	v22.UIScaleFrame = v32
	local v33
	if v16 then
		v33 = v21()
	else
		v33 = nil
	end
	v22.VRComfortSettingFrame = v33
	local v34
	if v16 then
		v34 = v21()
	else
		v34 = nil
	end
	v22.VRVignetteEnabledFrame = v34
	local v35
	if v16 then
		v35 = v21()
	else
		v35 = nil
	end
	v22.VRSteppedRotationEnabledFrame = v35
	local v36
	if v16 then
		v36 = v21()
	else
		v36 = nil
	end
	v22.VRThirdPersonFixedCamEnabledFrame = v36
	local v37
	if v16 then
		v37 = v21()
	else
		v37 = nil
	end
	v22.VRSafetyBubbleModeFrame = v37
	v22.PerformanceStatsFrame = v21()
	v22.MicroProfilerFrame = v21()
	v22.GraphicsEnablerFrame = v21()
	v22.GraphicsQualityFrame = v21()
	v22.HapticsFrame = v21()
	v22.ReducedMotionFrame = v21()
	v22.FramerateCap = v21()
	v22.VREnabledFrame = v21()
	v22.DisplayDivider = v21()
	v22.ViewAndControlsHeader = v21()
	v22.CameraModeFrame = v21()
	v22.CameraInvertedFrame = v21()
	v22.CameraSensitivityFrame = v21()
	v22.MouseAdvancedFrame = v21()
	v22.GamepadSensitivityFrame = v21()
	v22.MovementModeFrame = v21()
	v22.ShiftLockFrame = v21()
	v22.CameraDeviceFrame = v21()
	v22.UiNavigationKeyBindEnabledFrame = v21()
	v22.DeveloperConsoleButton = v21()
	local v38
	if v4() then
		v38 = v21()
	else
		v38 = nil
	end
	v22.PlayerNamesEnabledFrame = v38
	local v39
	if v5 then
		v39 = v21()
	else
		v39 = nil
	end
	v22.BadgeVisibilityFrame = v39
	v22.UiToggleRow = v21()
	v22.UiToggleRowCustom = v21()
	v22.UiToggleRowBillboards = v21()
	v22.UiToggleRowNameplates = v21()
	v22.FreecamToggleRow = v21()
	v22.InformationFrame = v21()
	v20 = v22
	if v9 then
		local v40 = v20.PreferredTransparencyFrame
		local v41 = v20.PreferredTextSizeFrame
		v20.PreferredTextSizeFrame = v40
		v20.PreferredTransparencyFrame = v41
	end
else
	v20 = nil
end
local v42 = {}
if v7 then
	v19 = v20
end
v42.SETTINGS_MENU_LAYOUT_ORDER = v19
return v42