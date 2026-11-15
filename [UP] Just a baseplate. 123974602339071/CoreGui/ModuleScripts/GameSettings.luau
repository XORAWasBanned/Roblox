-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.GameSettings
local v1 = game:GetService("CoreGui")
local v_u_2 = v1:WaitForChild("RobloxGui")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("CorePackages")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("HttpService")
local v_u_7 = game:GetService("RunService")
local v_u_8 = game:GetService("ContextActionService")
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("VRService")
local v_u_11 = game:GetService("SoundService")
local v_u_12 = game:GetService("RbxAnalyticsService")
local v13 = UserSettings()
local v_u_14 = v13.GameSettings
local v_u_15 = game:GetService("VideoCaptureService")
local v_u_16 = v13:GetService("UserGameSettings")
local v_u_17 = require(v_u_4.Workspace.Packages.CoreScriptsCommon).Url
local v_u_18 = game:GetService("TextChatService")
local v_u_19 = game:GetService("SafetyService")
local v_u_20
if game:GetEngineFeature("CaptureModeEnabled") then
	v_u_20 = game:GetService("ExperienceStateCaptureService")
else
	v_u_20 = nil
end
local v_u_21 = require(v_u_4.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_22 = require(v_u_2.Modules.Settings.Flags.FFlagIEMSettingsGroups)
local v23 = game:GetService("LocalizationService")
local v_u_24 = require(v_u_4.Workspace.Packages.InExperienceLocales).Localization.new(v23.RobloxLocaleId)
local v_u_25 = require(v_u_2.Modules.Settings.getCamMicPermissions)
local v_u_26 = require(v_u_2.Modules.Settings.isCamEnabledForUserAndPlace)
local v_u_27, v_u_28
if v_u_22 then
	v_u_27 = require(v_u_2.Modules.Settings.Components.renderSettingsHeader)
	v_u_28 = require(v_u_2.Modules.Settings.Components.renderSettingsDivider)
else
	v_u_28 = nil
	v_u_27 = nil
end
local v_u_29
if require(v_u_2.Modules.Settings.Flags.FFlagEnablePioneerIGMSettingsBanner) and require(v_u_4.Workspace.Packages.PioneerUtils).isPioneerLaunch() then
	v_u_29 = require(v_u_2.Modules.Settings.Components.renderMoreSettingsBanner)
else
	v_u_29 = nil
end
local v_u_30 = require(v_u_4.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local v_u_31 = require(v_u_4.Workspace.Packages.CrossExperience).Utils.isVoiceFocused
local v_u_32 = require(v_u_4.Workspace.Packages.CrossExperience).Utils.observeIsVoiceFocused
local v_u_33 = require(v1.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local v34 = require(v_u_4.Workspace.Packages.SharedFlags)
local v_u_35 = v34.GetFFlagEnablePartyVoiceVolumeOnlyWhenInEligibleParty
local v_u_36 = v34.GetFFlagEnableCrossExpVoice
local v_u_37 = v34.GetFFlagSelfViewCameraSettings
local v_u_38 = require(v_u_2.Modules.Flags.GetFFlagAlwaysShowVRToggle)
local v_u_39 = require(v_u_2.Modules.Flags.GetFIntDebounceDisconnectButtonDelay)
local v_u_40 = require(v_u_2.Modules.Flags.GetFIntDebounceAIRephraseSettingDelay)
local v_u_41 = require(v_u_2.Modules.Flags.GetFIntDebounceChatSummariesSettingDelay)
local v_u_42 = v_u_5.TouchEnabled
local v_u_43 = v34.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local v_u_44 = v34.FFlagIEMTabFocusNav
local v_u_45 = game:DefineFastFlag("ShowAntiHarassmentSettings", false)
local v_u_46 = require(v_u_2.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting)
local v_u_47 = require(v_u_2.Modules.Settings.Flags.FFlagUpdatePeopleNamesSettingCopy)
local v_u_48 = v34.FFlagBadgeVisibilitySettingEnabled
local v_u_49 = game:DefineFastFlag("HideVoiceChatSelectorForFae_AEGIS2", false)
local v_u_50 = game:DefineFastFlag("CenterShiftLockOverride", true)
local v_u_51 = game:DefineFastFlag("VoiceChatSelectorReconnectFocus2_AEGIS2", false)
local v_u_52 = game:DefineFastFlag("MicroProfilerReadOnlyInformationLabel", false)
local v_u_53 = v34.FFlagEnableModerateChatRemoteEvent
local v_u_54 = game:DefineFastFlag("VoiceSelectorAvailableAfterFae", false)
local v_u_55 = game:DefineFastFlag("InGameGraphicsFollowsSavedQuality", false)
local v_u_56 = game:DefineFastFlag("DifferentiateVoiceSelectorSystemAndUser", false)
local v_u_57 = game:DefineFastFlag("DeferProgrammaticChange", false)
local v_u_58 = require(v_u_2.Modules.Flags.FFlagRenameVolumeToMainVolume)
local v_u_59 = require(v_u_4.Workspace.Packages.SharedFlags).FFlagAIRephraseSettingEnabled
local v_u_60 = v34.FFlagChatSummariesSettingEnabled
local v_u_61 = v34.FFlagExpChatDictationVoiceTypingModeSetting
if v_u_61 then
	v_u_61 = v34.FFlagExpChatDictation or v34.FFlagExpChatContinuousDictation
end
local v_u_62 = v34.FFlagExpChatEnableFriendsTab
local v_u_63 = v34.FFlagVoiceRewarmTelemetry
local v_u_64 = game:DefineFastFlag("DebounceVoiceSelectorIndexChange", false)
local v_u_65 = game:DefineFastFlag("VoiceSelectorIgnoreFailedStateDisconnect", false)
local v_u_66 = game:DefineFastFlag("VoiceConnectSelectorDebounce", false)
local v_u_67 = require(v_u_2.Modules.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
local v_u_68 = game:DefineFastFlag("VoiceVolumeControlsFixSliderVisibilityOnEligibleGames", false)
local v_u_69 = game:DefineFastFlag("VoiceVolumeControlsDisableInteractionWhenNoMasterVolume", false)
local v_u_70 = require(v_u_4.Workspace.Packages.VoiceChatCore).Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry()
local v_u_71 = require(v_u_2.Modules.VoiceChat.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local v_u_72 = game:DefineFastFlag("VoiceVolumeControlsSuppressInExperienceUiForPartyVoice", false)
local v_u_73 = require(v_u_4.Workspace.Packages.RobloxTranslator)
local v_u_74 = require(v_u_4.Workspace.Packages.CrossExperienceVoice).IXPManager.default
local v_u_75 = require(v_u_4.Workspace.Packages.AppCommonLib).isSpatial
local v76 = require(v_u_2.Modules.Settings.Resources.GameSettingsConstants)
if v_u_74 then
	v_u_74 = v_u_74.getHasPartyVoiceVolume()
end
local v_u_77 = require(v_u_2:WaitForChild("Modules"):WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v_u_78 = {
	["Enum.SavedQualitySetting.Automatic"] = 0,
	["Enum.SavedQualitySetting.QualityLevel1"] = 1,
	["Enum.SavedQualitySetting.QualityLevel2"] = 2,
	["Enum.SavedQualitySetting.QualityLevel3"] = 3,
	["Enum.SavedQualitySetting.QualityLevel4"] = 4,
	["Enum.SavedQualitySetting.QualityLevel5"] = 5,
	["Enum.SavedQualitySetting.QualityLevel6"] = 6,
	["Enum.SavedQualitySetting.QualityLevel7"] = 7,
	["Enum.SavedQualitySetting.QualityLevel8"] = 8,
	["Enum.SavedQualitySetting.QualityLevel9"] = 9,
	["Enum.SavedQualitySetting.QualityLevel10"] = 10
}
local v_u_79 = {
	["DevComputerMovementMode"] = true,
	["DevComputerCameraMode"] = true,
	["DevEnableMouseLock"] = true
}
local v_u_80 = {
	["DevTouchMovementMode"] = true,
	["DevTouchCameraMode"] = true
}
local v_u_81 = {
	["DEFAULT_FOLLOW"] = "Default (Follow)",
	["DEFAULT_CLASSIC"] = "Default (Classic)"
}
local v_u_82 = {
	["Input"] = "Input",
	["Output"] = "Output"
}
local v_u_83 = {
	["DEFAULT_THUMBSTICK"] = "Default (Dynamic Thumbstick)",
	["DEFAULT_KEYBOARD"] = "Default (Keyboard)",
	["TAP_TO_MOVE"] = "Tap to Move",
	["CLICK_TO_MOVE"] = "Click to Move"
}
local v_u_84 = v_u_73:FormatByKey("Feature.SettingsHub.TouchMovementMode.ClassicThumbstick")
local v_u_85 = v_u_73:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
local v_u_86 = v_u_73:FormatByKey("CoreScripts.Feedback.EntryPoint.ButtonText")
local v_u_87 = {
	["On"] = 1,
	["Off"] = 2
}
local v_u_88 = v76.SETTINGS_MENU_LAYOUT_ORDER
local v_u_89 = require(v_u_4.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v_u_90 = require(v_u_2.Modules.Flags.GetFFlagChatTranslationSettingEnabled)
local v_u_91 = require(v_u_2.Modules.Flags.GetFStringChatTranslationLayerName)
local v_u_92 = require(v_u_2.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled)
local v_u_93 = require(v_u_2.Modules.Flags.GetFFlagChatTranslationWaitForIXP)
local v_u_94 = require(v_u_2.Modules.Flags.GetFFlagChatTranslationForceSetting)
local v_u_95 = require(v_u_2.Modules.Flags.GetFFlagChatTranslationNewDefaults)
local v_u_96 = game:GetEngineFeature("TextChatServiceSettingsSaved")
local v_u_97 = require(v_u_2.Modules.Settings.Pages.GameSettingsRowInitializers.ChatTranslationOptionsWithChatLanguageSwitcherInitializer)
local v_u_98 = game:GetEngineFeature("GameBasicSettingsFramerateCap")
local v_u_99 = game:GetEngineFeature("RUUserScalePreferenceAPI")
local v_u_100 = v34.FFlagUIScaleEngineOptions
local v_u_101 = require(v_u_4.Workspace.Packages.Responsive).UIScaleOptions
local v_u_102 = game:DefineFastFlag("FramerateCapIOSOptions", false)
local v_u_103 = require(v_u_2.Modules.Settings.Utility)
local v_u_104 = require(v_u_2.Modules.CoreUtility)
local v_u_105 = require(v_u_2.Modules.PlayerPermissionsModule)
local v_u_106 = require(v_u_2.Modules.Common.GetHasGuiHidingPermission)
local v_u_107 = require(v_u_2.Modules.Settings.Theme)
local v_u_108 = require(v_u_4.Packages.Cryo)
local v_u_109 = require(script.Parent.Parent.GfxReset)
local v_u_110 = require(v_u_4.Workspace.Packages.AppCommonLib).Create
local v_u_111 = require(v1.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall)
local v_u_112 = require(v_u_2.Modules.Settings.Pages.SavedQualityFollower)
local v_u_113 = require(v_u_2.Modules.Chrome.ChromeShared.Utility.debounce)
local v_u_114 = require(v_u_4.Packages.BuilderIcons)
local v_u_115 = require(v_u_4.Packages.Signals)
local v_u_116 = v_u_114.Migration
v_u_2:WaitForChild("Modules"):WaitForChild("TenFootInterface")
v_u_2:WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("SettingsHub")
local v_u_117 = require(v_u_2.Modules.TenFootInterface):IsEnabled()
local v_u_118 = v_u_9.LocalPlayer
local v_u_119 = v_u_5:GetPlatform()
local v_u_120 = require(v_u_4.Workspace.Packages.CachedPolicyService)
local v_u_121 = require(v_u_2.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_122 = require(v_u_4.Workspace.Packages.VoiceChatCore).VoiceVolumeControlsEligibility
local v_u_123 = require(v_u_4.Workspace.Packages.CrossExperienceVoice).CrossExperienceVoiceManager.default
local v_u_124 = require(v_u_4.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local v_u_125 = v_u_73:FormatByKey("Feature.SettingsHub.Video.SystemDefault")
local v_u_126 = v_u_73:FormatByKey("Feature.SettingsHub.Video.VideoCamera")
local v_u_127 = require(v_u_4.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
game:DefineFastInt("RomarkStartWithGraphicQualityLevel", -1)
local v_u_128 = game:GetFastInt("RomarkStartWithGraphicQualityLevel")
local v_u_129 = not v_u_120:IsSubjectToChinaPolicies()
local v_u_130 = (v_u_119 == Enum.Platform.Windows or v_u_119 == Enum.Platform.OSX) and true or v_u_119 == Enum.Platform.UWP
local v_u_131 = v_u_119 == Enum.Platform.IOS and true or v_u_119 == Enum.Platform.Android
if v_u_21 then
	if not (v_u_131 or v_u_130) then
		local v132 = v_u_75()
		if not v132 then
			v_u_129 = v132
		end
	end
elseif not (v_u_131 or v_u_130) then
	v_u_129 = v_u_130
end
local v_u_133 = require(v_u_2.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay)
local v_u_134 = require(v_u_2.Modules.Flags.GetFFlagVoiceChatUILogging)
local v_u_135 = require(v_u_2.Modules.VoiceChat.Constants)
local v_u_136 = require(v_u_2.Modules.Flags.GetFFlagEnableUniveralVoiceToasts)
local v_u_137 = require(v_u_2.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics)
local v_u_138 = require(v_u_2.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent)
local v_u_139 = game:DefineFastFlag("DisableFeedbackSoothsayerCheck", false)
local v_u_140 = game:DefineFastFlag("UserShowGuiHideToggles", false)
local v_u_141 = game:DefineFastFlag("UserFreecamGuiDestabilization", false)
local v_u_142 = game:DefineFastFlag("FixDeveloperConsoleButtonSizeAndPositioning", false)
local v_u_143 = game:DefineFastFlag("EnableTFFeedbackModeEntryCheck", false)
local v_u_144 = game:DefineFastFlag("FeedbackEntryPointButtonSizeAdjustment2", false)
local v_u_145 = game:DefineFastFlag("FeedbackEntryPointImprovedStrictnessCheck", false)
local v_u_146 = require(v_u_2.Modules.Settings.Flags.GetFFlagEnableLocalesForExperienceLanguageSwitcher)
local v_u_147 = require(v_u_2.Modules.Settings.Flags.GetFFlagLazyInitiateExperienceLanguageSwitcher)
local v_u_148 = require(v_u_2.Modules.Settings.Pages.GameSettingsRowInitializers.ExperienceLanguageSwitcherInitializer)
local v_u_149 = require(v_u_2.Modules.Settings.Pages.GameSettingsRowInitializers.PlayerChoiceTranslationSettingInitializer)
local v_u_150 = game:DefineFastFlag("UpdateVisibilitySettingsCopy", false)
local v_u_151 = game:DefineFastFlag("ExpChatDebounceRephraseIndexSelection", false)
local v_u_152 = game:DefineFastFlag("EraseFPSFromDefaultSetting", false)
local function v_u_159(p153, p154, p155, p156) -- name: reportSettingsChangeForAnalytics
	-- upvalues: (copy) v_u_137, (copy) v_u_5, (copy) v_u_108, (copy) v_u_12, (copy) v_u_77
	if v_u_137() and (p154 ~= p155 and (p154 ~= nil and p155 ~= nil)) then
		local v157 = {}
		local v158 = game.GameId
		v157.universe_id = tostring(v158)
		v157.name = p153
		v157.old_value = tostring(p154)
		v157.new_value = tostring(p155)
		v157.has_touch = v_u_5.TouchEnabled
		v157.has_mouse = v_u_5.MouseEnabled
		v157.has_gamepad = v_u_5.GamepadEnabled
		if p156 then
			v157 = v_u_108.Dictionary.join(v157, p156)
		end
		v_u_12:SetRBXEventStream(v_u_77.AnalyticsTargetName, v_u_77.AnalyticsInGameMenuName, v_u_77.AnalyticsExplicitSettingsChangeName, v157)
	end
end
local function v_u_190() -- name: reportSettingsForAnalytics
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_67, (copy) v_u_98, (copy) v_u_46, (copy) v_u_12, (copy) v_u_77
	local v160 = {}
	local v161 = v_u_5.PreferredInput == Enum.PreferredInput.Touch
	if v161 then
		local v162 = v_u_14.TouchCameraMovementMode
		v160.camera_mode_touch = tostring(v162)
	else
		local v163 = v_u_14.ComputerCameraMovementMode
		v160.camera_mode_desktop = tostring(v163)
	end
	if v161 then
		local v164 = v_u_14.TouchMovementMode
		v160.movement_mode_touch = tostring(v164)
	else
		local v165 = v_u_14.ComputerMovementMode
		v160.movement_mode_desktop = tostring(v165)
	end
	if v_u_5.MouseEnabled then
		local v166 = v_u_14.ControlMode == Enum.ControlMode.MouseLockSwitch
		v160.shift_lock_enabled = tostring(v166)
	end
	if v_u_5.GamepadEnabled and v_u_14.IsUsingGamepadCameraSensitivity then
		local v167 = v_u_14.GamepadCameraSensitivity
		local v168 = string.format
		local v169 = tonumber(v168("%.2f", v167))
		v160.camera_sensitivity_gamepad = tostring(v169)
	end
	if v_u_5.MouseEnabled then
		local v170 = v_u_14.MouseSensitivityFirstPerson.X
		local v171 = string.format
		local v172 = tonumber(v171("%.2f", v170))
		v160.camera_sensitivity_mouse = tostring(v172)
	end
	local v173 = v_u_14.CameraYInverted
	v160.camera_y_inverted = tostring(v173)
	local v174 = v_u_14.PerformanceStatsVisible
	v160.show_performance_stats = tostring(v174)
	local v175 = v_u_14.MasterVolume * 10 + 0.5
	local v176 = math.floor(v175)
	v160.volume = tostring(v176)
	if v_u_67 then
		local v177 = v_u_14.VoiceChatVolume * 5 + 0.5
		local v178 = math.floor(v177)
		v160.voice_chat_volume = tostring(v178)
	end
	local v179 = settings().Rendering.QualityLevel
	v160.gfx_quality_level = tostring(v179)
	if v_u_98 then
		local v180 = v_u_14.FramerateCap
		v160.framerate_cap = tostring(v180)
	end
	local v181 = v_u_14
	v160.fullscreen_enabled = tostring(v181:InFullScreen())
	local v182 = v_u_14.OnScreenProfilerEnabled
	v160.microprofiler_enabled = tostring(v182)
	local v183 = v_u_14.MicroProfilerWebServerEnabled
	v160.microprofiler_webserver_enabled = tostring(v183)
	local v184 = v_u_14.ReducedMotion
	v160.reduced_motion = tostring(v184)
	local v185 = v_u_14.PreferredTransparency
	v160.preferred_transparency = tostring(v185)
	local v186 = v_u_14.PreferredTextSize
	v160.preferred_text_size = tostring(v186)
	local v187 = v_u_14.UiNavigationKeyBindEnabled
	v160.ui_navigation_key_bind_enabled = tostring(v187)
	local v188 = game.GameId
	v160.universeid = tostring(v188)
	if v_u_46() then
		local v189 = v_u_14.PlayerNamesEnabled
		v160.player_names_enabled = tostring(v189)
	end
	v_u_12:SetRBXEventStream(v_u_77.AnalyticsTargetName, v_u_77.AnalyticsInGameMenuName, v_u_77.AnalyticsSettingsChangeName, v160)
end
game:DefineFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout", 0)
game:DefineFastString("V1MenuLanguageSelectionFeatureForcedUserIds", "")
local v_u_191 = game:DefineFastFlag("IGMEnableGFXReset", false)
local function v_u_197(p192) -- name: getLastValueChangerFrame
	local v193 = nil
	local v194 = nil
	for _, v195 in pairs(p192:GetRows()) do
		local v196 = v195.SelectionFrame
		if v193 and v193 > v196.LayoutOrder then
			continue
		end
		v193 = v196.LayoutOrder
		v194 = p192:getValueChangerFrame(v195.ValueChanger)
	end
	return v194
end
local function v_u_203(p198) -- name: getFirstValueChangerFrame
	-- upvalues: (copy) v_u_44
	if v_u_44 then
		local v199 = nil
		local v200 = nil
		for _, v201 in pairs(p198:GetRows()) do
			local v202 = v201.SelectionFrame
			if v199 and v202.LayoutOrder >= v199 then
				continue
			end
			v199 = v202.LayoutOrder
			v200 = p198:getValueChangerFrame(v201.ValueChanger)
		end
		return v200
	end
end
return (function() -- name: Initialize
	-- upvalues: (copy) v_u_191, (copy) v_u_109, (copy) v_u_2, (copy) v_u_147, (copy) v_u_10, (copy) v_u_14, (copy) v_u_103, (copy) v_u_88, (copy) v_u_3, (copy) v_u_138, (copy) v_u_137, (copy) v_u_159, (copy) v_u_190, (copy) v_u_12, (copy) v_u_77, (copy) v_u_98, (copy) v_u_102, (copy) v_u_119, (copy) v_u_152, (copy) v_u_73, (copy) v_u_55, (copy) v_u_112, (copy) v_u_128, (copy) v_u_78, (copy) v_u_150, (copy) v_u_47, (copy) v_u_87, (copy) v_u_16, (ref) v_u_24, (copy) v_u_101, (copy) v_u_5, (copy) v_u_110, (copy) v_u_107, (copy) v_u_50, (copy) v_u_52, (copy) v_u_42, (copy) v_u_131, (copy) v_u_130, (copy) v_u_21, (copy) v_u_75, (copy) v_u_118, (copy) v_u_104, (copy) v_u_81, (copy) v_u_38, (copy) v_u_124, (copy) v_u_83, (copy) v_u_84, (copy) v_u_80, (copy) v_u_79, (copy) v_u_17, (copy) v_u_6, (copy) v_u_145, (copy) v_u_19, (ref) v_u_20, (copy) v_u_144, (copy) v_u_86, (copy) v_u_139, (copy) v_u_127, (copy) v_u_9, (copy) v_u_85, (copy) v_u_7, (copy) v_u_93, (copy) v_u_89, (copy) v_u_95, (copy) v_u_58, (copy) v_u_35, (copy) v_u_123, (copy) v_u_69, (copy) v_u_71, (copy) v_u_4, (copy) v_u_8, (copy) v_u_142, (copy) v_u_105, (copy) v_u_141, (copy) v_u_140, (copy) v_u_11, (copy) v_u_133, (copy) v_u_121, (copy) v_u_36, (copy) v_u_115, (copy) v_u_40, (copy) v_u_18, (copy) v_u_151, (copy) v_u_111, (copy) v_u_41, (copy) v_u_126, (copy) v_u_134, (copy) v_u_15, (copy) v_u_125, (copy) v_u_99, (copy) v_u_100, (copy) v_u_56, (copy) v_u_54, (copy) v_u_39, (copy) v_u_63, (copy) v_u_135, (copy) v_u_65, (copy) v_u_66, (copy) v_u_113, (copy) v_u_51, (copy) v_u_64, (copy) v_u_57, (copy) v_u_49, (copy) v_u_31, (copy) v_u_32, (copy) v_u_67, (copy) v_u_68, (copy) v_u_72, (copy) v_u_43, (copy) v_u_122, (copy) v_u_136, (copy) v_u_82, (copy) v_u_37, (copy) v_u_26, (copy) v_u_25, (copy) v_u_30, (copy) v_u_33, (copy) v_u_117, (copy) v_u_70, (copy) v_u_74, (copy) v_u_45, (copy) v_u_46, (copy) v_u_149, (copy) v_u_120, (copy) v_u_129, (copy) v_u_48, (copy) v_u_53, (copy) v_u_59, (copy) v_u_60, (copy) v_u_61, (copy) v_u_62, (copy) v_u_106, (ref) v_u_29, (copy) v_u_22, (ref) v_u_27, (ref) v_u_28, (copy) v_u_116, (copy) v_u_114, (copy) v_u_143, (copy) v_u_146, (copy) v_u_148, (copy) v_u_197, (copy) v_u_44, (copy) v_u_203, (copy) v_u_90, (copy) v_u_92, (copy) v_u_91, (copy) v_u_96, (copy) v_u_94, (copy) v_u_97
	if v_u_191 then
		v_u_109.RunGfxReset()
	end
	local v_u_204 = require(v_u_2.Modules.Settings.SettingsPageFactory):CreateNewPage()
	if v_u_147() then
		v_u_204.LanguageSwitcherInitialized = false
	end
	local v_u_205 = false
	local v_u_206 = {}
	local function v209() -- name: onVREnabled
		-- upvalues: (ref) v_u_10, (ref) v_u_205, (copy) v_u_206
		if v_u_10.VREnabled and v_u_205 then
			local v207 = v_u_10.VREnabled
			for v208, _ in pairs(v_u_206) do
				v208.Visible = not v207
			end
		end
	end
	v_u_10:GetPropertyChangedSignal("VREnabled"):connect(v209)
	if v_u_10.VREnabled and v_u_205 then
		local v210 = v_u_10.VREnabled
		for v211, _ in pairs(v_u_206) do
			v211.Visible = not v210
		end
	end
	local function v275() -- name: createGraphicsOptions
		-- upvalues: (ref) v_u_14, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (copy) v_u_206, (ref) v_u_3, (ref) v_u_138, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190, (ref) v_u_12, (ref) v_u_77, (ref) v_u_98, (ref) v_u_10, (ref) v_u_102, (ref) v_u_119, (ref) v_u_152, (ref) v_u_73, (ref) v_u_55, (ref) v_u_112, (ref) v_u_191, (ref) v_u_109, (ref) v_u_128, (ref) v_u_78
		local v212 = v_u_204
		local v213 = v_u_204
		local v214 = v_u_204
		local v215, v216, v217 = v_u_103:AddNewRow(v_u_204, "Fullscreen", "Selector", { "On", "Off" }, v_u_14:InFullScreen() and 1 or 2)
		v212.FullscreenFrame = v215
		v213.FullscreenLabel = v216
		v214.FullscreenEnabler = v217
		v_u_204.FullscreenFrame.LayoutOrder = v_u_88.FullScreenFrame
		v_u_206[v_u_204.FullscreenFrame] = true
		v_u_204.FullscreenEnabler.IndexChanged:connect(function(p218)
			-- upvalues: (ref) v_u_14, (ref) v_u_3, (ref) v_u_138, (ref) v_u_204, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
			local v_u_219 = v_u_14:InFullScreen()
			if p218 == 1 then
				if not v_u_14:InFullScreen() then
					v_u_3:ToggleFullscreen()
					if v_u_138() then
						if v_u_204.FullscreenEnabler.GetSelectedIndex() ~= 1 then
							v_u_204.FullscreenEnabler:SetSelectionIndex(1)
						end
					else
						v_u_204.FullscreenEnabler:SetSelectionIndex(1)
					end
				end
			elseif p218 == 2 and v_u_14:InFullScreen() then
				v_u_3:ToggleFullscreen()
				if v_u_138() then
					if v_u_204.FullscreenEnabler.GetSelectedIndex() ~= 2 then
						v_u_204.FullscreenEnabler:SetSelectionIndex(2)
					end
				else
					v_u_204.FullscreenEnabler:SetSelectionIndex(2)
				end
			end
			spawn(function()
				-- upvalues: (ref) v_u_137, (ref) v_u_159, (copy) v_u_219, (ref) v_u_14, (ref) v_u_190
				if v_u_137() then
					v_u_159("fullscreen_enabled", v_u_219, v_u_14:InFullScreen())
				end
				v_u_190()
			end)
		end)
		v_u_14.FullscreenChanged:connect(function(p220)
			-- upvalues: (ref) v_u_204, (ref) v_u_12, (ref) v_u_77
			if p220 then
				if v_u_204.FullscreenEnabler:GetSelectedIndex() ~= 1 then
					v_u_204.FullscreenEnabler:SetSelectionIndex(1)
				end
			elseif v_u_204.FullscreenEnabler:GetSelectedIndex() ~= 2 then
				v_u_204.FullscreenEnabler:SetSelectionIndex(2)
			end
			v_u_12:SetRBXEventStream(v_u_77.AnalyticsTargetName, v_u_77.AnalyticsInGameMenuName, v_u_77.AnalyticsFullscreenModeName, {
				["enabled"] = p220
			})
		end)
		local v221 = v_u_204
		local v222 = v_u_204
		local v223 = v_u_204
		local v224, v225, v226 = v_u_103:AddNewRow(v_u_204, "Graphics Mode", "Selector", { "Automatic", "Manual" }, v_u_14.SavedQualityLevel == Enum.SavedQualitySetting.Automatic and 1 or 2)
		v221.GraphicsEnablerFrame = v224
		v222.GraphicsEnablerLabel = v225
		v223.GraphicsQualityEnabler = v226
		v_u_204.GraphicsEnablerFrame.LayoutOrder = v_u_88.GraphicsEnablerFrame
		local v227 = v_u_204
		local v228 = v_u_204
		local v229 = v_u_204
		local v230, v231, v232 = v_u_103:AddNewRow(v_u_204, "Graphics Quality", "Slider", 10, 1)
		v227.GraphicsQualityFrame = v230
		v228.GraphicsQualityLabel = v231
		v229.GraphicsQualitySlider = v232
		v_u_204.GraphicsQualityFrame.LayoutOrder = v_u_88.GraphicsQualityFrame
		v_u_204.GraphicsQualitySlider:SetMinStep(1)
		if v_u_98 and not v_u_10.VREnabled then
			local v233 = v_u_77.FramerateCaps
			if v_u_102 and v_u_119 == Enum.Platform.IOS then
				v233 = v_u_77.FramerateCapsIOS
			end
			local v_u_234 = table.clone(v233)
			local v_u_235 = {}
			local v236
			if v_u_152 then
				v236 = v_u_73:FormatByKey("CoreScripts.InGameMenu.GameSettings.Default")
			else
				v236 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.FramerateCapDefaultEntry", {
					["Frames"] = v_u_14:GetDefaultFramerateCap()
				})
			end
			__set_list(v_u_235, 1, {v236})
			for _, v237 in v_u_234 do
				local v238 = v_u_73
				table.insert(v_u_235, v238:FormatByKey("Feature.SettingsHub.GameSettings.FramerateEntry", {
					["Frames"] = v237
				}))
			end
			table.insert(v_u_234, 1, -1)
			task.defer(function()
				-- upvalues: (ref) v_u_204, (ref) v_u_103, (ref) v_u_73, (copy) v_u_235, (ref) v_u_102, (copy) v_u_234, (ref) v_u_14, (ref) v_u_88, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
				local v239 = v_u_204
				local v240 = v_u_204
				local v241 = v_u_204
				local v242 = v_u_103
				local v243 = v_u_204
				local v244 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate")
				local v245 = "DropDown"
				local v246 = v_u_235
				local v247
				if v_u_102 then
					v247 = table.find(v_u_234, v_u_14.FramerateCap) or 1
				else
					v247 = table.find(v_u_234, v_u_14.FramerateCap)
				end
				local v248, v249, v250 = v242:AddNewRow(v243, v244, v245, v246, v247, nil, v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.MaximumFramerate.Description"))
				v239.FramerateCapFrame = v248
				v240.FramerateCapLabel = v249
				v241.FramerateCapMode = v250
				v_u_204.FramerateCapFrame.LayoutOrder = v_u_88.FramerateCap
				v_u_204.FramerateCapMode.IndexChanged:Connect(function(p251)
					-- upvalues: (ref) v_u_14, (ref) v_u_234, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
					local v252 = v_u_14.FramerateCap
					v_u_14.FramerateCap = v_u_234[p251]
					if v_u_137() then
						v_u_159("framerate_cap", v252, v_u_14.FramerateCap)
					end
					v_u_190()
				end)
			end)
		end
		settings().Rendering.EnableFRM = true
		local v_u_253
		if v_u_55 then
			v_u_253 = v_u_112.new(v_u_204.GraphicsQualityEnabler, v_u_204.GraphicsQualitySlider)
		else
			v_u_253 = nil
		end
		function SetGraphicsQuality(p254, p255) -- name: SetGraphicsQuality
			-- upvalues: (ref) v_u_55, (copy) v_u_253, (ref) v_u_191, (ref) v_u_109, (ref) v_u_14
			if not (v_u_55 and v_u_253:isShowing()) then
				if v_u_191 then
					local v256, v257 = v_u_109.TemporaryOverride(p254)
					if v256 then
						settings().Rendering.QualityLevel = v257
						return
					end
				end
				local v258 = p254 / 10
				local v259 = (settings().Rendering:GetMaxQualityLevel() - 1) * v258
				local v260 = math.floor(v259)
				if v260 == 20 then
					v260 = 21
				elseif p254 == 1 then
					v260 = 1
				elseif p254 < 1 and not p255 then
					p254 = 1
					v260 = 1
				elseif settings().Rendering:GetMaxQualityLevel() < v260 then
					v260 = settings().Rendering:GetMaxQualityLevel() - 1
				end
				v_u_14.SavedQualityLevel = p254
				settings().Rendering.QualityLevel = v260
			end
		end
		local function v_u_262(p261) -- name: setGraphicsToManual
			-- upvalues: (ref) v_u_204
			v_u_204.GraphicsQualitySlider:SetZIndex(2)
			v_u_204.GraphicsQualityLabel.ZIndex = 2
			v_u_204.GraphicsQualitySlider:SetInteractable(true)
			if v_u_204.GraphicsQualitySlider:GetValue() == p261 then
				SetGraphicsQuality(p261)
			else
				v_u_204.GraphicsQualitySlider:SetValue(p261)
			end
		end
		local v_u_263 = false
		v_u_204.GraphicsQualitySlider.ValueChanged:connect(function(p264)
			-- upvalues: (ref) v_u_263, (ref) v_u_55, (copy) v_u_253, (ref) v_u_190
			SetGraphicsQuality(p264)
			if v_u_263 == true and not (v_u_55 and v_u_253:isShowing()) then
				v_u_190()
			end
			v_u_263 = true
		end)
		v_u_204.GraphicsQualityEnabler.IndexChanged:connect(function(p265)
			-- upvalues: (ref) v_u_204, (copy) v_u_262, (ref) v_u_55, (copy) v_u_253, (ref) v_u_190, (ref) v_u_159
			local v266 = {
				["Automatic"] = {
					["Name"] = "Automatic",
					["Value"] = 1
				},
				["Manual"] = {
					["Name"] = "Manual",
					["Value"] = 2
				}
			}
			local v267 = v266.Automatic.Name
			local v268 = v266.Manual.Name
			if p265 == v266.Automatic.Value then
				v267 = v266.Manual.Name
				v268 = v266.Automatic.Name
				v_u_204.GraphicsQualitySlider:SetZIndex(1)
				v_u_204.GraphicsQualityLabel.ZIndex = 1
				v_u_204.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			elseif p265 == v266.Manual.Value then
				v_u_262(v_u_204.GraphicsQualitySlider:GetValue())
			end
			if not (v_u_55 and v_u_253:isShowing()) then
				v_u_190()
				v_u_159("gfx_mode", v267, v268)
			end
		end)
		game.GraphicsQualityChangeRequest:Connect(function(p269)
			-- upvalues: (ref) v_u_14, (ref) v_u_204
			if v_u_14.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
				local v270 = v_u_204.GraphicsQualitySlider:GetValue()
				local v271
				if p269 then
					v271 = v270 + 1
				else
					v271 = v270 - 1
				end
				v_u_204.GraphicsQualitySlider:SetValue(v271)
			end
		end)
		if v_u_128 >= 0 then
			if v_u_128 == 0 then
				v_u_204.GraphicsQualityEnabler:SetSelectionIndex(1)
				v_u_204.GraphicsQualitySlider:SetZIndex(1)
				v_u_204.GraphicsQualityLabel.ZIndex = 1
				v_u_204.GraphicsQualitySlider:SetInteractable(false)
				SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
			else
				v_u_204.GraphicsQualityEnabler:SetSelectionIndex(2)
				v_u_262(v_u_128)
			end
		elseif v_u_14.SavedQualityLevel == Enum.SavedQualitySetting.Automatic then
			v_u_204.GraphicsQualitySlider:SetValue(5)
			v_u_204.GraphicsQualitySlider:SetZIndex(1)
			v_u_204.GraphicsQualityLabel.ZIndex = 1
			v_u_204.GraphicsQualitySlider:SetInteractable(false)
			SetGraphicsQuality(Enum.QualityLevel.Automatic.Value, true)
		else
			local v272 = v_u_14.SavedQualityLevel
			local v273 = tostring(v272)
			local v_u_274 = not v_u_78[v273] and 10 or v_u_78[v273]
			SetGraphicsQuality(v_u_274)
			spawn(function()
				-- upvalues: (ref) v_u_204, (ref) v_u_274
				v_u_204.GraphicsQualitySlider:SetValue(v_u_274)
			end)
		end
		if v_u_55 then
			v_u_14:GetPropertyChangedSignal("SavedQualityLevel"):Connect(function()
				-- upvalues: (copy) v_u_253, (ref) v_u_14
				v_u_253:show(v_u_14.SavedQualityLevel)
			end)
		end
	end
	local function v287() -- name: createReducedMotionOptions
		-- upvalues: (ref) v_u_14, (ref) v_u_73, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v276 = v_u_14.ReducedMotion and 1 or 2
		local v277 = v_u_73:FormatByKey("Feature.Accessibility.Heading.ReducedMotion")
		local v278 = v_u_73:FormatByKey("Feature.Accessibility.Description.ReducedMotion")
		local v279 = v_u_204
		local v280 = v_u_204
		local v281 = v_u_204
		local v282, v283, v284 = v_u_103:AddNewRow(v_u_204, v277, "Selector", { v_u_73:FormatByKey("InGame.CommonUI.Label.On"), (v_u_73:FormatByKey("InGame.CommonUI.Label.Off")) }, v276, nil, v278)
		v279.ReducedMotionFrame = v282
		v280.ReducedMotionLabel = v283
		v281.ReducedMotionMode = v284
		v_u_204.ReducedMotionFrame.LayoutOrder = v_u_88.ReducedMotionFrame
		v_u_204.ReducedMotionMode.IndexChanged:connect(function(p285)
			-- upvalues: (ref) v_u_14, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
			local v286 = v_u_14.ReducedMotion
			v_u_14.ReducedMotion = p285 == 1
			if v_u_137() then
				v_u_159("reduced_motion", v286, v_u_14.ReducedMotion)
			end
			v_u_190()
		end)
	end
	local function v301() -- name: createPlayerNamesEnabledOptions
		-- upvalues: (ref) v_u_150, (ref) v_u_73, (ref) v_u_47, (ref) v_u_14, (ref) v_u_87, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_159, (ref) v_u_190
		local v288
		if v_u_150 then
			v288 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.PeoplesNames")
		elseif v_u_47 then
			v288 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames")
		else
			v288 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.PlayerNames")
		end
		local v289
		if v_u_47 then
			v289 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.PeopleNames.Description")
		else
			v289 = nil
		end
		local v290
		if v_u_14.PlayerNamesEnabled then
			v290 = v_u_87.On
		else
			v290 = v_u_87.Off
		end
		local v291
		if v_u_150 then
			v291 = v_u_73:FormatByKey("Feature.SettingsHub.Label.Show")
		else
			v291 = v_u_73:FormatByKey("InGame.CommonUI.Label.On")
		end
		local v292
		if v_u_150 then
			v292 = v_u_73:FormatByKey("Feature.SettingsHub.Label.Hide")
		else
			v292 = v_u_73:FormatByKey("InGame.CommonUI.Label.Off")
		end
		local v293 = v_u_204
		local v294 = v_u_204
		local v295 = v_u_204
		local v296, v297, v298 = v_u_103:AddNewRow(v_u_204, v288, "Selector", { v291, v292 }, v290, nil, v289)
		v293.PlayerNamesEnabledFrame = v296
		v294.playerNamesEnabledLabel = v297
		v295.playerNamesEnabledMode = v298
		v_u_204.PlayerNamesEnabledFrame.LayoutOrder = v_u_88.PlayerNamesEnabledFrame
		v_u_204.playerNamesEnabledMode.IndexChanged:connect(function(p299)
			-- upvalues: (ref) v_u_14, (ref) v_u_159, (ref) v_u_190
			local v300 = v_u_14.PlayerNamesEnabled
			v_u_14.PlayerNamesEnabled = p299 == 1
			v_u_159("player_names_enabled", v300, v_u_14.PlayerNamesEnabled)
			v_u_190()
		end)
	end
	local function v315() -- name: createPreferredTransparencyOptions
		-- upvalues: (ref) v_u_14, (ref) v_u_73, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v302 = v_u_14.PreferredTransparency * 10 + 0.5
		local v303 = math.floor(v302)
		local v304 = 10 - math.clamp(v303, 0, 10)
		local v305 = v_u_204
		local v306 = v_u_204
		local v307 = v_u_204
		local v308, v309, v310 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.Accessibility.Heading.PreferredTransparency"), "Slider", 10, v304, nil, v_u_73:FormatByKey("Feature.Accessibility.Description.PreferredTransparency"), v_u_73:FormatByKey("Feature.Accessibility.PreferredTransparency.Transparent"), (v_u_73:FormatByKey("Feature.Accessibility.PreferredTransparency.Opaque")))
		v305.PreferredTransparencyFrame = v308
		v306.PreferredTransparencyLabel = v309
		v307.PreferredTransparencySlider = v310
		v_u_204.PreferredTransparencyFrame.LayoutOrder = v_u_88.PreferredTransparencyFrame
		v_u_204.PreferredTransparencySlider.ValueChanged:connect(function(p311)
			-- upvalues: (ref) v_u_14, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
			local v312 = math.floor(p311)
			local v313 = (10 - math.clamp(v312, 0, 10)) / 10
			local v314 = v_u_14.PreferredTransparency
			v_u_14.PreferredTransparency = v313
			if v_u_137() then
				v_u_159("preferred_transparency", v314, v_u_14.PreferredTransparency)
			end
			v_u_190()
		end)
	end
	local function v326() -- name: createPreferredTextSizeOptions
		-- upvalues: (ref) v_u_14, (ref) v_u_73, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v_u_316 = Enum.PreferredTextSize:GetEnumItems()
		local v317 = v_u_14.PreferredTextSize.Value - 1
		local v318 = v_u_204
		local v319 = v_u_204
		local v320 = v_u_204
		local v321, v322, v323 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.Accessibility.Heading.PreferredTextSize"), "Slider", 3, v317, nil, v_u_73:FormatByKey("Feature.Accessibility.Description.PreferredTextSize"), v_u_73:FormatByKey("Feature.Accessibility.PreferredTextSize.Default"), (v_u_73:FormatByKey("Feature.Accessibility.PreferredTextSize.Largest")))
		v318.PreferredTextSizeFrame = v321
		v319.PreferredTextSizeLabel = v322
		v320.PreferredTextSizeSlider = v323
		v_u_204.PreferredTextSizeFrame.LayoutOrder = v_u_88.PreferredTextSizeFrame
		v_u_204.PreferredTextSizeSlider.ValueChanged:connect(function(p324)
			-- upvalues: (ref) v_u_14, (copy) v_u_316, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
			local v325 = v_u_14.PreferredTextSize
			v_u_14.PreferredTextSize = v_u_316[p324 + 1]
			if v_u_137() then
				v_u_159("preferred_text_size", v325, v_u_14.PreferredTextSize)
			end
			v_u_190()
		end)
	end
	local v_u_327 = nil
	local v_u_328 = nil
	local function v_u_371() -- name: createUIScaleOptionsImpl
		-- upvalues: (ref) v_u_3, (ref) v_u_327, (ref) v_u_328, (copy) v_u_204, (ref) v_u_16, (ref) v_u_103, (ref) v_u_24, (ref) v_u_88, (ref) v_u_159, (ref) v_u_190
		local v_u_329 = v_u_3:GetAutoUIScaleHundredths()
		local v330 = v_u_3:GetRawScreenScale()
		local v331 = workspace.CurrentCamera
		if v331 then
			local v332 = v331.ViewportSize.Y * v330 * v_u_3:GetEffectiveUIScaleHundredths() / 100
			local v333 = 100 / v330 / 25
			local v_u_334 = math.ceil(v333) * 25
			local v335 = v332 / (540 * v330) * 4
			local v336 = math.floor(v335) / 4 * 100
			local v337 = (v336 - v_u_334) / 25
			local v_u_338 = math.round(v337)
			if v_u_338 <= 0 then
				v_u_327 = nil
				v_u_328 = nil
				if v_u_204.UIScaleModeFrame then
					v_u_204.UIScaleModeFrame:Destroy()
					v_u_204.UIScaleModeFrame = nil
				end
				if v_u_204.UIScaleFrame then
					v_u_204.UIScaleFrame:Destroy()
					v_u_204.UIScaleFrame = nil
				end
				return
			elseif not v_u_204.UIScaleModeFrame or (v_u_334 ~= v_u_327 or v336 ~= v_u_328) then
				v_u_327 = v_u_334
				v_u_328 = v336
				if v_u_204.UIScaleModeFrame then
					v_u_204.UIScaleModeFrame:Destroy()
					v_u_204.UIScaleModeFrame = nil
				end
				if v_u_204.UIScaleFrame then
					v_u_204.UIScaleFrame:Destroy()
					v_u_204.UIScaleFrame = nil
				end
				local v339 = v_u_16.UIScaleMultiplierHundredths
				local v340 = v339 ~= 0
				local v341 = v340 and 2 or 1
				local v342
				if v340 then
					local v343 = (v339 - v_u_334) / 25
					local v344 = math.round(v343)
					v342 = math.clamp(v344, 0, v_u_338)
				else
					v342 = 0
				end
				local v345 = v_u_204
				local v346 = v_u_204
				local v347 = v_u_204
				local v348, v349, v350 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleMode"), "Selector", { v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeAuto"), v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeManual") }, v341)
				v345.UIScaleModeFrame = v348
				v346.UIScaleModeLabel = v349
				v347.UIScaleModeSelector = v350
				v_u_204.UIScaleModeFrame.LayoutOrder = v_u_88.UIScaleModeFrame
				local v351 = v_u_204
				local v352 = v_u_204
				local v353 = v_u_204
				local v354, v355, v356 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScale"), "Slider", v_u_338, v342, nil, nil, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleSmallest"), v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleLargest"))
				v351.UIScaleFrame = v354
				v352.UIScaleLabel = v355
				v353.UIScaleSlider = v356
				v_u_204.UIScaleFrame.LayoutOrder = v_u_88.UIScaleFrame
				v_u_204.UIScaleFrame.Visible = v340
				v_u_204.UIScaleModeSelector.IndexChanged:connect(function(p357)
					-- upvalues: (ref) v_u_204, (copy) v_u_329, (copy) v_u_334, (copy) v_u_338, (ref) v_u_3, (ref) v_u_159, (ref) v_u_190
					local v358 = p357 == 2
					v_u_204.UIScaleFrame.Visible = v358
					if v358 then
						local v359 = v_u_329 / 25
						local v360 = math.round(v359) * 25
						local v361 = v_u_334
						local v362 = v_u_334 + v_u_338 * 25
						local v363 = math.clamp(v360, v361, v362)
						local v364 = v_u_204.UIScaleSlider
						local v365 = (v363 - v_u_334) / 25
						local v366 = math.round(v365)
						local v367 = v_u_338
						v364:SetValue((math.clamp(v366, 0, v367)))
						v_u_3:SetUIScaleMultiplier(v363)
						v_u_159("ui_scale_mode", "auto", "manual")
					else
						v_u_3:SetUIScaleMultiplier(0)
						v_u_159("ui_scale_mode", "manual", "auto")
					end
					v_u_190()
				end)
				v_u_204.UIScaleSlider.ValueChanged:connect(function(p368)
					-- upvalues: (ref) v_u_16, (copy) v_u_334, (ref) v_u_3, (ref) v_u_159, (ref) v_u_190
					local v369 = v_u_16.UIScaleMultiplierHundredths
					local v370 = v_u_334 + p368 * 25
					v_u_3:SetUIScaleMultiplier(v370)
					v_u_159("ui_scale_value", v369, v370)
					v_u_190()
				end)
			end
		else
			return
		end
	end
	local v_u_372 = nil
	local v_u_373 = false
	local function v_u_378() -- name: refreshUIScaleRows
		-- upvalues: (ref) v_u_101, (ref) v_u_3, (copy) v_u_204, (ref) v_u_372, (ref) v_u_373
		local v374 = v_u_101.get(v_u_3)
		if v_u_204.UIScaleModeFrame and v374 then
			if not (v_u_372 and v_u_101.equal(v374, v_u_372)) then
				v_u_372 = v374
				local v375 = v374.savedHundredths == 0 and 1 or 2
				local v376 = v375 == 2
				local v377 = v374.selectedIndex
				v_u_373 = true
				v_u_204.UIScaleFrame.Visible = v376
				if v_u_204.UIScaleModeSelector:GetSelectedIndex() ~= v375 then
					v_u_204.UIScaleModeSelector:SetSelectionIndex(v375)
				end
				v_u_204.UIScaleSlider:SetEnabledSteps(v374.enabled)
				v_u_204.UIScaleSlider:SetValue(v377)
				v_u_373 = false
			end
		else
			return
		end
	end
	local function v_u_383(p379) -- name: onUIScaleModeChanged
		-- upvalues: (ref) v_u_373, (copy) v_u_204, (ref) v_u_101, (ref) v_u_3, (ref) v_u_159, (copy) v_u_378
		if v_u_373 or p379 ~= v_u_204.UIScaleModeSelector:GetSelectedIndex() then
			return
		else
			local v380 = p379 == 2
			local v381 = v_u_101.get(v_u_3)
			local v382
			if v381 then
				v382 = v_u_101.valueForMode(v381, v380)
			else
				v382 = nil
			end
			if v382 ~= nil then
				v_u_3:SetUIScaleMultiplier(v382)
				v_u_159("ui_scale_mode", v380 and "auto" or "manual", v380 and "manual" or "auto")
				v_u_378()
			end
		end
	end
	local function v_u_387(p384) -- name: onUIScaleSliderChanged
		-- upvalues: (ref) v_u_373, (ref) v_u_101, (ref) v_u_3, (copy) v_u_204, (ref) v_u_372, (ref) v_u_159, (copy) v_u_378
		if v_u_373 then
			return
		else
			local v385 = v_u_101.get(v_u_3)
			if v385 then
				local v386 = v_u_101.valueFromSlider(p384, v_u_204.UIScaleSlider:GetValue(), v_u_372, v385)
				if v386 then
					v_u_3:SetUIScaleMultiplier(v386)
					v_u_159("ui_scale_value", v385.savedHundredths, v386)
				end
				v_u_378()
			end
		end
	end
	local function v401() -- name: createUIScaleRows
		-- upvalues: (ref) v_u_101, (ref) v_u_3, (copy) v_u_204, (ref) v_u_103, (ref) v_u_24, (ref) v_u_88, (copy) v_u_383, (copy) v_u_387, (copy) v_u_378
		local v388 = v_u_101.get(v_u_3)
		if v388 then
			local v389 = v_u_204
			local v390 = v_u_204
			local v391 = v_u_204
			local v392, v393, v394 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleMode"), "Selector", { v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeAuto"), v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeManual") }, v388.savedHundredths == 0 and 1 or 2, nil, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleModeDescription"))
			v389.UIScaleModeFrame = v392
			v390.UIScaleModeLabel = v393
			v391.UIScaleModeSelector = v394
			v_u_204.UIScaleModeFrame.LayoutOrder = v_u_88.UIScaleEngineModeFrame
			local v395 = v_u_204
			local v396 = v_u_204
			local v397 = v_u_204
			local v398, v399, v400 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScale"), "Slider", #v388.values, v388.selectedIndex, nil, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleDescription"), v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleSmallest"), v_u_24:Format("CoreScripts.InGameMenu.GameSettings.UIScaleLargest"))
			v395.UIScaleFrame = v398
			v396.UIScaleLabel = v399
			v397.UIScaleSlider = v400
			v_u_204.UIScaleFrame.LayoutOrder = v_u_88.UIScaleEngineFrame
			v_u_204.UIScaleSlider:SetMinStep(1)
			v_u_204.UIScaleModeSelector.IndexChanged:Connect(v_u_383)
			v_u_204.UIScaleSlider.ValueChanged:connect(v_u_387)
			v_u_378()
		end
	end
	local function v416() -- name: createUiNavigationKeyBindOptions
		-- upvalues: (ref) v_u_14, (ref) v_u_73, (ref) v_u_5, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v_u_402 = {
			["On"] = 1,
			["Off"] = 2
		}
		local v403 = v_u_14.UiNavigationKeyBindEnabled and 1 or 2
		local v404 = v_u_73:FormatByKey("Feature.Accessibility.Heading.UiNavigationKeyBind")
		local v405 = v_u_73:FormatByKey("Feature.Accessibility.Description.UiNavigationKeyBind", {
			["uiNavigationKey"] = v_u_5:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		})
		local v406 = v_u_204
		local v407 = v_u_204
		local v408 = v_u_204
		local v409, v410, v411 = v_u_103:AddNewRow(v_u_204, v404, "Selector", { v_u_73:FormatByKey("InGame.CommonUI.Label.On"), (v_u_73:FormatByKey("InGame.CommonUI.Label.Off")) }, v403, nil, v405)
		v406.UiNavigationKeyBindEnabledFrame = v409
		v407.UiNavigationKeyBindEnabledLabel = v410
		v408.UiNavigationKeyBindEnabledMode = v411
		v_u_204.UiNavigationKeyBindEnabledFrame.LayoutOrder = v_u_88.UiNavigationKeyBindEnabledFrame
		v_u_204.UiNavigationKeyBindEnabledMode.IndexChanged:connect(function(p412)
			-- upvalues: (ref) v_u_14, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
			local v413 = v_u_14.UiNavigationKeyBindEnabled
			v_u_14.UiNavigationKeyBindEnabled = p412 == 1
			if v_u_137() then
				v_u_159("ui_navigation_key_bind_enabled", v413, v_u_14.UiNavigationKeyBindEnabled)
			end
			v_u_190()
		end)
		local v414 = v_u_5.KeyboardEnabled
		if v_u_204.UiNavigationKeyBindEnabledFrame then
			v_u_204.UiNavigationKeyBindEnabledFrame.Visible = v414
			if v414 then
				v_u_204.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v_u_14.UiNavigationKeyBindEnabled and v_u_402.On or v_u_402.Off)
			else
				v_u_204.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v_u_402.Off)
				v_u_14.UiNavigationKeyBindEnabled = false
			end
		end
		v_u_5:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_204, (ref) v_u_14, (copy) v_u_402
			local v415 = v_u_5.KeyboardEnabled
			if v_u_204.UiNavigationKeyBindEnabledFrame then
				v_u_204.UiNavigationKeyBindEnabledFrame.Visible = v415
				if v415 then
					v_u_204.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v_u_14.UiNavigationKeyBindEnabled and v_u_402.On or v_u_402.Off)
					return
				end
				v_u_204.UiNavigationKeyBindEnabledMode:SetSelectionIndex(v_u_402.Off)
				v_u_14.UiNavigationKeyBindEnabled = false
			end
		end)
	end
	local function v435() -- name: createPerformanceStatsOptions
		-- upvalues: (copy) v_u_204, (ref) v_u_14, (ref) v_u_103, (ref) v_u_88, (ref) v_u_110, (ref) v_u_107, (ref) v_u_50, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v417 = v_u_204
		local v418 = v_u_204
		local v419 = v_u_204
		v_u_204.PerformanceStatsFrame = nil
		v417.PerformanceStatsLabel = nil
		v418.PerformanceStatsMode = nil
		v419.PerformanceStatsOverrideText = nil
		function GetDesiredPerformanceStatsIndex() -- name: GetDesiredPerformanceStatsIndex
			-- upvalues: (ref) v_u_14
			return v_u_14.PerformanceStatsVisible and 1 or 2
		end
		local v420 = v_u_204
		local v421 = v_u_204
		local v422 = v_u_204
		local v423, v424, v425 = v_u_103:AddNewRow(v_u_204, "Performance Stats", "Selector", { "On", "Off" }, (GetDesiredPerformanceStatsIndex()))
		v420.PerformanceStatsFrame = v423
		v421.PerformanceStatsLabel = v424
		v422.PerformanceStatsMode = v425
		v_u_204.PerformanceStatsFrame.LayoutOrder = v_u_88.PerformanceStatsFrame
		local v426 = v_u_204
		local v427 = v_u_110("TextLabel")
		local v428 = {
			["Name"] = "PerformanceStatsLabel",
			["Text"] = "Set by Developer",
			["TextColor3"] = nil,
			["Font"] = nil,
			["FontSize"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Visible"] = false,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["TextColor3"] = Color3.new(1, 1, 1),
			["Font"] = v_u_107.font(Enum.Font.SourceSans, "GameSettings"),
			["FontSize"] = v_u_107.fontSize(Enum.FontSize.Size24, "GameSettings")
		}
		local v429
		if v_u_50 then
			v429 = UDim2.new(0.6, 0, 1, 0)
		else
			v429 = UDim2.new(0, 200, 1, 0)
		end
		v428.Size = v429
		local v430
		if v_u_50 then
			v430 = UDim2.new(1, 0, 0.5, 0)
		else
			v430 = UDim2.new(1, -350, 0, 0)
		end
		v428.Position = v430
		local v431
		if v_u_50 then
			v431 = Vector2.new(1, 0.5)
		else
			v431 = nil
		end
		v428.AnchorPoint = v431
		v428.Parent = v_u_204.PerformanceStatsFrame
		v426.PerformanceStatsOverrideText = v427(v428)
		v_u_204.PerformanceStatsMode.IndexChanged:connect(function(p432)
			-- upvalues: (ref) v_u_137, (ref) v_u_14, (ref) v_u_159, (ref) v_u_190
			local v433
			if v_u_137() then
				v433 = v_u_14.PerformanceStatsVisible
			else
				v433 = nil
			end
			if p432 == 1 then
				v_u_14.PerformanceStatsVisible = true
			else
				v_u_14.PerformanceStatsVisible = false
			end
			if v_u_137() then
				v_u_159("show_performance_stats", v433, v_u_14.PerformanceStatsVisible)
			end
			v_u_190()
		end)
		v_u_14.PerformanceStatsVisibleChanged:connect(function()
			-- upvalues: (ref) v_u_204
			local v434 = GetDesiredPerformanceStatsIndex()
			if v434 ~= v_u_204.PerformanceStatsMode.CurrentIndex then
				v_u_204.PerformanceStatsMode:SetSelectionIndex(v434)
			end
		end)
	end
	local function v_u_453() -- name: createWebServerInformationRow
		-- upvalues: (copy) v_u_204, (ref) v_u_103, (ref) v_u_52, (ref) v_u_88, (ref) v_u_42, (ref) v_u_110, (ref) v_u_107
		local v436 = v_u_204
		local v437 = v_u_204
		local v438 = v_u_204
		local v439 = v_u_103
		local v440 = v_u_204
		local v441 = "MicroProfiler Information"
		local v442 = "TextBox"
		local v443 = nil
		local v444 = nil
		local v445 = 5
		local v446 = nil
		local v447 = nil
		local v448 = nil
		local v449
		if v_u_52 then
			v449 = false
		else
			v449 = nil
		end
		local v450, v451, v452 = v439:AddNewRow(v440, v441, v442, v443, v444, v445, v446, v447, v448, v449)
		v436.InformationFrame = v450
		v437.InformationLabel = v451
		v438.InformationTextBox = v452
		v_u_204.InformationFrame.LayoutOrder = v_u_88.InformationFrame
		v_u_204.InformationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		if v_u_42 then
			v_u_204.InformationText = v_u_110("TextLabel")({
				["Name"] = "InformationLabel",
				["Text"] = "Information Loading",
				["Font"] = nil,
				["FontSize"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Visible"] = true,
				["ZIndex"] = 2,
				["Parent"] = nil,
				["Font"] = v_u_107.font(Enum.Font.SourceSans),
				["FontSize"] = v_u_107.fontSize(Enum.FontSize.Size18),
				["Size"] = UDim2.new(0, 800, 1, 0),
				["Position"] = UDim2.new(0, 5, 0, 0),
				["Parent"] = v_u_204.InformationFrame
			})
		else
			v_u_204.InformationText = v_u_110("TextLabel")({
				["Name"] = "InformationLabel",
				["Text"] = "Information Loading",
				["Font"] = nil,
				["FontSize"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Visible"] = true,
				["ZIndex"] = 2,
				["Parent"] = nil,
				["Font"] = v_u_107.font(Enum.Font.SourceSans),
				["FontSize"] = v_u_107.fontSize(Enum.FontSize.Size14),
				["Size"] = UDim2.new(0, 800, 1, 0),
				["Position"] = UDim2.new(1, -650, 0, 20),
				["Parent"] = v_u_204.InformationFrame
			})
		end
		return v_u_204.InformationFrame, v_u_204.InformationText
	end
	local function v483() -- name: createMicroProfilerOptions
		-- upvalues: (copy) v_u_204, (ref) v_u_14, (copy) v_u_453, (ref) v_u_131, (ref) v_u_137, (ref) v_u_130, (ref) v_u_21, (ref) v_u_75, (ref) v_u_12, (ref) v_u_159, (ref) v_u_190, (ref) v_u_73, (ref) v_u_103, (ref) v_u_88
		local v454 = v_u_204
		local v455 = v_u_204
		local v456 = v_u_204
		v_u_204.MicroProfilerFrame = nil
		v454.MicroProfilerLabel = nil
		v455.MicroProfilerMode = nil
		v456.MicroProfilerOverrideText = nil
		local function v_u_468(p457) -- name: setMicroProfilerIndex
			-- upvalues: (ref) v_u_14, (ref) v_u_204, (ref) v_u_131, (ref) v_u_137, (ref) v_u_453, (ref) v_u_130, (ref) v_u_21, (ref) v_u_75, (ref) v_u_12, (ref) v_u_159, (ref) v_u_190
			local v458 = nil
			local v459 = nil
			local v460 = nil
			if v_u_131 then
				if v_u_137() then
					v459 = v_u_14.MicroProfilerWebServerEnabled
					v458 = "webserver"
				end
				if p457 == 1 then
					v_u_14.MicroProfilerWebServerEnabled = true
					local v461 = 30
					while v461 >= 1 do
						local v462 = v_u_14.MicroProfilerWebServerPort
						local v463
						if v462 == 0 then
							v463 = false
						else
							local v464 = v_u_204
							local v465 = v_u_204
							local v466, v467 = v_u_453()
							v464.InformationFrame = v466
							v465.InformationText = v467
							v_u_204.InformationText.Text = v_u_14.MicroProfilerWebServerIP .. v462
							v463 = true
						end
						if v463 then
							break
						end
						v461 = v461 - 1
						wait(0.1)
					end
					if v461 <= 0 then
						v_u_204.MicroProfilerMode:SetSelectionIndex(2)
						v_u_14.MicroProfilerWebServerEnabled = false
						if v_u_204.InformationFrame or v_u_204.InformationText then
							v_u_204.InformationFrame.Visible = false
							v_u_204.InformationFrame.Parent = nil
							v_u_204.InformationText.Parent = nil
							v_u_204.InformationFrame = nil
							v_u_204.InformationText = nil
						end
					end
				else
					v_u_14.MicroProfilerWebServerEnabled = false
					if v_u_204.InformationFrame or v_u_204.InformationText then
						v_u_204.InformationFrame.Visible = false
						v_u_204.InformationFrame.Parent = nil
						v_u_204.InformationText.Parent = nil
						v_u_204.InformationFrame = nil
						v_u_204.InformationText = nil
					end
				end
				if v_u_137() then
					v460 = v_u_14.MicroProfilerWebServerEnabled
				end
			elseif v_u_130 or v_u_21 and v_u_75() then
				if v_u_137() then
					v459 = v_u_14.OnScreenProfilerEnabled
					v458 = "regular"
				end
				v_u_14.OnScreenProfilerEnabled = p457 == 1
				if v_u_137() then
					v460 = v_u_14.OnScreenProfilerEnabled
				end
			end
			v_u_12:ReportCounter("MicroprofilerSettingsPressed")
			if v_u_137() then
				v_u_159("microprofiler_enabled", v459, v460, {
					["microprofiler_type"] = v458
				})
			end
			v_u_190()
		end
		local v469
		if v_u_131 then
			v469 = v_u_14.MicroProfilerWebServerEnabled and 1 or 2
		else
			v469 = (v_u_130 or v_u_21 and v_u_75()) and (v_u_14.OnScreenProfilerEnabled and 1 or 2) or 2
		end
		local v470 = v_u_204
		local v471 = v_u_204
		local v472 = v_u_204
		local v473, v474, v475 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.MicroProfiler"), "Selector", { "On", "Off" }, v469)
		v470.MicroProfilerFrame = v473
		v471.MicroProfilerLabel = v474
		v472.MicroProfilerMode = v475
		v_u_204.MicroProfilerFrame.LayoutOrder = v_u_88.MicroProfilerFrame
		local v476 = v_u_14.MicroProfilerWebServerPort
		if v476 ~= 0 then
			local v477 = v_u_204
			local v478 = v_u_204
			local v479, v480 = v_u_453()
			v477.InformationFrame = v479
			v478.InformationText = v480
			v_u_204.InformationText.Text = v_u_14.MicroProfilerWebServerIP .. v476
		end
		local v_u_481 = false
		v_u_14:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
			-- upvalues: (ref) v_u_481, (ref) v_u_14, (ref) v_u_204
			v_u_481 = true
			if v_u_14.OnScreenProfilerEnabled then
				v_u_204.MicroProfilerMode:SetSelectionIndex(1)
			else
				v_u_204.MicroProfilerMode:SetSelectionIndex(2)
			end
		end)
		local function v482(...) -- name: onIndexChanged
			-- upvalues: (ref) v_u_481, (copy) v_u_468
			if v_u_481 then
				v_u_481 = false
			else
				v_u_468(...)
			end
		end
		v_u_204.MicroProfilerMode.IndexChanged:connect(v482)
	end
	local function v596(p484) -- name: createCameraModeOptions
		-- upvalues: (copy) v_u_204, (ref) v_u_14, (ref) v_u_103, (ref) v_u_88, (copy) v_u_206, (ref) v_u_110, (ref) v_u_107, (ref) v_u_50, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190, (ref) v_u_118, (ref) v_u_5, (ref) v_u_104, (ref) v_u_81, (ref) v_u_10, (ref) v_u_38, (ref) v_u_124, (ref) v_u_73, (ref) v_u_77, (ref) v_u_83, (ref) v_u_84, (ref) v_u_80, (ref) v_u_79
		local v485 = v_u_204
		local v486 = v_u_204
		local v487 = v_u_204
		v_u_204.ShiftLockFrame = nil
		v485.ShiftLockLabel = nil
		v486.ShiftLockMode = nil
		v487.ShiftLockOverrideText = nil
		local v488 = v_u_204
		local v489 = v_u_204
		local v490 = v_u_204
		local v491, v492, v493 = v_u_103:AddNewRow(v_u_204, "Shift Lock Switch", "Selector", { "On", "Off" }, v_u_14.ControlMode == Enum.ControlMode.MouseLockSwitch and 1 or 2)
		v488.ShiftLockFrame = v491
		v489.ShiftLockLabel = v492
		v490.ShiftLockMode = v493
		v_u_204.ShiftLockFrame.LayoutOrder = v_u_88.ShiftLockFrame
		v_u_206[v_u_204.ShiftLockFrame] = true
		local v494 = v_u_204
		local v495 = v_u_110("TextLabel")
		local v496 = {
			["Name"] = "ShiftLockOverrideLabel",
			["Text"] = "Set by Developer",
			["TextColor3"] = nil,
			["Font"] = nil,
			["FontSize"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Visible"] = false,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["TextColor3"] = Color3.new(1, 1, 1),
			["Font"] = v_u_107.font(Enum.Font.SourceSans, "GameSettings"),
			["FontSize"] = v_u_107.fontSize(Enum.FontSize.Size24, "GameSettings")
		}
		local v497
		if v_u_50 then
			v497 = UDim2.new(0.6, 0, 1, 0)
		else
			v497 = UDim2.new(0, 200, 1, 0)
		end
		v496.Size = v497
		local v498
		if v_u_50 then
			v498 = UDim2.new(1, 0, 0.5, 0)
		else
			v498 = UDim2.new(1, -350, 0, 0)
		end
		v496.Position = v498
		local v499
		if v_u_50 then
			v499 = Vector2.new(1, 0.5)
		else
			v499 = nil
		end
		v496.AnchorPoint = v499
		v496.Parent = v_u_204.ShiftLockFrame
		v494.ShiftLockOverrideText = v495(v496)
		v_u_204.ShiftLockMode.IndexChanged:connect(function(p500)
			-- upvalues: (ref) v_u_137, (ref) v_u_14, (ref) v_u_159, (ref) v_u_190
			local v501
			if v_u_137() then
				v501 = v_u_14.ControlMode == Enum.ControlMode.MouseLockSwitch
			else
				v501 = nil
			end
			if p500 == 1 then
				v_u_14.ControlMode = Enum.ControlMode.MouseLockSwitch
			else
				v_u_14.ControlMode = Enum.ControlMode.Classic
			end
			if v_u_137() then
				v_u_159("shift_lock_enabled", v501, v_u_14.ControlMode == Enum.ControlMode.MouseLockSwitch)
			end
			v_u_190()
		end)
		local v502 = v_u_5.MouseEnabled
		if v502 then
			v502 = v_u_5.KeyboardEnabled
		end
		if v_u_204.ShiftLockFrame then
			v_u_204.ShiftLockFrame.Visible = v502
		end
		local v503 = not v_u_118.DevEnableMouseLock
		if v_u_204.ShiftLockOverrideText then
			v_u_204.ShiftLockOverrideText.Visible = v503
			local v504 = not v503
			if v504 then
				v504 = v_u_118.DevEnableMouseLock
			end
			if v_u_204.ShiftLockMode then
				v_u_204.ShiftLockMode.SelectorFrame.Visible = v504
				v_u_204.ShiftLockMode:SetInteractable(v504)
			end
		end
		v_u_5:GetPropertyChangedSignal("MouseEnabled"):Connect(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_204, (ref) v_u_118
			local v505 = v_u_5.MouseEnabled
			if v505 then
				v505 = v_u_5.KeyboardEnabled
			end
			if v_u_204.ShiftLockFrame then
				v_u_204.ShiftLockFrame.Visible = v505
			end
			local v506 = not v_u_118.DevEnableMouseLock
			if v_u_204.ShiftLockOverrideText then
				v_u_204.ShiftLockOverrideText.Visible = v506
				local v507 = not v506
				if v507 then
					v507 = v_u_118.DevEnableMouseLock
				end
				if v_u_204.ShiftLockMode then
					v_u_204.ShiftLockMode.SelectorFrame.Visible = v507
					v_u_204.ShiftLockMode:SetInteractable(v507)
				end
			end
		end)
		v_u_5:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_204, (ref) v_u_118
			local v508 = v_u_5.MouseEnabled
			if v508 then
				v508 = v_u_5.KeyboardEnabled
			end
			if v_u_204.ShiftLockFrame then
				v_u_204.ShiftLockFrame.Visible = v508
			end
			local v509 = not v_u_118.DevEnableMouseLock
			if v_u_204.ShiftLockOverrideText then
				v_u_204.ShiftLockOverrideText.Visible = v509
				local v510 = not v509
				if v510 then
					v510 = v_u_118.DevEnableMouseLock
				end
				if v_u_204.ShiftLockMode then
					v_u_204.ShiftLockMode.SelectorFrame.Visible = v510
					v_u_204.ShiftLockMode:SetInteractable(v510)
				end
			end
		end)
		function cameraModeIsUserChoice() -- name: cameraModeIsUserChoice
			-- upvalues: (ref) v_u_5, (ref) v_u_118
			if v_u_5.PreferredInput == Enum.PreferredInput.Touch then
				return v_u_118.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
			else
				return v_u_118.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
			end
		end
		function setCameraModeVisible(p511) -- name: setCameraModeVisible
			-- upvalues: (ref) v_u_204
			if v_u_204.CameraMode then
				v_u_204.CameraMode.SelectorFrame.Visible = p511
				v_u_204.CameraMode:SetInteractable(p511)
				v_u_204.CameraModeOverrideText.Visible = not p511
			end
		end
		local v_u_512 = v_u_104.waitForChildOfClass(v_u_118, "PlayerScripts")
		local v_u_513 = {}
		local v_u_514 = {}
		local function v_u_520(p_u_515) -- name: updateCurrentCameraMovementIndex
			-- upvalues: (ref) v_u_514, (ref) v_u_513, (ref) v_u_5, (ref) v_u_137, (ref) v_u_14, (ref) v_u_159
			local v_u_516 = nil
			local function v517()
				-- upvalues: (ref) v_u_516, (ref) v_u_514, (ref) v_u_513, (copy) p_u_515
				v_u_516 = v_u_514[v_u_513[p_u_515]]
			end
			if not pcall(v517) or v_u_516 == nil then
				return false
			end
			local v518 = nil
			local v519
			if v_u_5.PreferredInput == Enum.PreferredInput.Touch then
				if v_u_137() then
					v518 = v_u_14.TouchCameraMovementMode.Value
				end
				v519 = v_u_14.TouchCameraMovementMode.Value ~= v_u_516
				v_u_14.TouchCameraMovementMode = v_u_516
			else
				if v_u_137() then
					v518 = v_u_14.ComputerCameraMovementMode.Value
				end
				v519 = v_u_14.ComputerCameraMovementMode.Value ~= v_u_516
				v_u_14.ComputerCameraMovementMode = v_u_516
			end
			if v_u_137() and v519 then
				v_u_159("camera_mode", v518, v_u_516)
			end
			return v519
		end
		local function v_u_527() -- name: updateCameraMovementModes
			-- upvalues: (copy) v_u_512, (ref) v_u_5, (ref) v_u_513, (ref) v_u_514, (ref) v_u_81, (ref) v_u_204, (ref) v_u_14, (copy) v_u_520
			local v521
			if v_u_512 then
				if v_u_5.PreferredInput == Enum.PreferredInput.Touch then
					v521 = v_u_512:GetRegisteredTouchCameraMovementModes()
				else
					v521 = v_u_512:GetRegisteredComputerCameraMovementModes()
				end
			else
				v521 = {}
			end
			v_u_513 = {}
			v_u_514 = {}
			if #v521 <= 0 then
				setCameraModeVisible(false)
			else
				for v522 = 1, #v521 do
					local v523 = v521[v522]
					local v524 = v523.Name
					if v524 == "Default" then
						if v_u_5.PreferredInput == Enum.PreferredInput.Touch then
							v524 = v_u_81.DEFAULT_FOLLOW
						else
							v524 = v_u_81.DEFAULT_CLASSIC
						end
					end
					v_u_513[#v_u_513 + 1] = v524
					v_u_514[v524] = v523.Value
				end
				if v_u_204.CameraMode then
					v_u_204.CameraMode:UpdateOptions(v_u_513)
				end
				local v525 = v_u_5.PreferredInput == Enum.PreferredInput.Touch
				local v526
				if v525 then
					v526 = v_u_14.TouchCameraMovementMode.Value
				else
					v526 = v_u_14.ComputerCameraMovementMode.Value
				end
				if v526 > -1 then
					if v525 or v_u_14.ComputerCameraMovementMode ~= Enum.ComputerCameraMovementMode.CameraToggle then
						v526 = v526 + 1
					end
					v_u_520(v526)
					v_u_204.CameraMode:SetSelectionIndex(v526)
				end
				setCameraModeVisible(cameraModeIsUserChoice())
			end
		end
		local v528 = v_u_204
		local v529 = v_u_204
		local v530 = v_u_204
		local v531, v532, v533 = v_u_103:AddNewRow(v_u_204, "Camera Mode", "Selector", v_u_513, 1)
		v528.CameraModeFrame = v531
		v529.CameraModeLabel = v532
		v530.CameraMode = v533
		v_u_204.CameraModeFrame.LayoutOrder = v_u_88.CameraModeFrame
		v_u_206[v_u_204.CameraMode] = true
		v_u_204.CameraModeOverrideText = v_u_110("TextLabel")({
			["Name"] = "CameraDevOverrideLabel",
			["Text"] = "Set by Developer",
			["TextColor3"] = nil,
			["Font"] = nil,
			["FontSize"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["Visible"] = false,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["TextColor3"] = Color3.new(1, 1, 1),
			["Font"] = v_u_107.font(Enum.Font.SourceSans, "GameSettings"),
			["FontSize"] = v_u_107.fontSize(Enum.FontSize.Size24, "GameSettings"),
			["Size"] = UDim2.new(0.6, 0, 1, 0),
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["Parent"] = v_u_204.CameraModeFrame
		})
		if v_u_512 then
			v_u_512.TouchCameraMovementModeRegistered:connect(function(_)
				-- upvalues: (ref) v_u_5, (copy) v_u_527
				if v_u_5.TouchEnabled then
					v_u_527()
				end
			end)
			v_u_512.ComputerCameraMovementModeRegistered:connect(function(_)
				-- upvalues: (ref) v_u_5, (copy) v_u_527
				if v_u_5.MouseEnabled then
					v_u_527()
				end
			end)
		end
		v_u_5:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: (copy) v_u_527
			v_u_527()
		end)
		local v_u_534 = false
		v_u_204.CameraMode.IndexChanged:connect(function(p535)
			-- upvalues: (copy) v_u_520, (ref) v_u_534, (ref) v_u_190
			if v_u_520(p535) then
				if v_u_534 then
					v_u_190()
				end
				v_u_534 = true
			end
		end)
		v_u_527()
		local v_u_536 = false
		local function v_u_549() -- name: createVROption
			-- upvalues: (ref) v_u_536, (ref) v_u_14, (ref) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_159
			if not v_u_536 then
				v_u_536 = true
				local v_u_537 = v_u_14.VREnabled and { "On", "Off (restart pending)" } or { "On (restart pending)", "Off" }
				local v538 = v_u_204
				local v539 = v_u_204
				local v540 = v_u_204
				local v541, v542, v543 = v_u_103:AddNewRow(v_u_204, "VR", "Selector", v_u_537, v_u_14.VREnabled and 1 or 2)
				v538.VREnabledFrame = v541
				v539.VREnabledLabel = v542
				v540.VREnabledSelector = v543
				v_u_204.VREnabledFrame.LayoutOrder = v_u_88.VREnabledFrame
				v_u_204.VREnabledSelector.IndexChanged:connect(function(p544)
					-- upvalues: (ref) v_u_14, (ref) v_u_537, (ref) v_u_159
					local v545 = {
						["On"] = {
							["Name"] = "On",
							["Value"] = 1
						},
						["Off"] = {
							["Name"] = "Off",
							["Value"] = 2
						}
					}
					local v546 = p544 == v545.On.Value
					if v_u_14.VREnabled ~= v546 then
						v_u_14.VREnabled = v546
						local v547 = v_u_537[v545.On.Value]
						local v548 = v_u_537[p544]
						if v548 == v_u_537[v545.On.Value] then
							v547 = v_u_537[v545.Off.Value]
						end
						v_u_159("vr_mode", v547, v548)
					end
				end)
			end
		end
		local function v550() -- name: onVREnabledChanged
			-- upvalues: (ref) v_u_10, (ref) v_u_14, (copy) v_u_549
			if v_u_10.VREnabled then
				v_u_14.HasEverUsedVR = true
				v_u_549()
			elseif v_u_14.HasEverUsedVR then
				v_u_549()
			end
		end
		if v_u_38() and v_u_124().getIsLinkedVRModeAvailable() then
			v_u_549()
		else
			if v_u_10.VREnabled then
				v_u_14.HasEverUsedVR = true
				v_u_549()
			elseif v_u_14.HasEverUsedVR then
				v_u_549()
			end
			v_u_10:GetPropertyChangedSignal("VREnabled"):connect(v550)
		end
		local v_u_551 = {}
		local v_u_552 = {}
		local v_u_553 = {}
		local v_u_554 = {}
		local v_u_555
		if p484 then
			local v_u_556 = v_u_104.waitForChildOfClass(v_u_118, "PlayerScripts")
			local v557 = v_u_204
			local v558 = v_u_204
			local v559 = v_u_204
			local v560, v561, v562 = v_u_103:AddNewRow(v_u_204, "Movement Mode", "Selector", {}, 1)
			v557.MovementModeFrame = v560
			v558.MovementModeLabel = v561
			v559.MovementMode = v562
			v_u_204.MovementModeFrame.LayoutOrder = v_u_88.MovementModeFrame
			v_u_206[v_u_204.MovementMode] = true
			v_u_204.MovementModeOverrideText = v_u_110("TextLabel")({
				["Name"] = "MovementDevOverrideLabel",
				["Text"] = "Set by Developer",
				["TextColor3"] = nil,
				["Font"] = nil,
				["FontSize"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["Visible"] = false,
				["ZIndex"] = 2,
				["Parent"] = nil,
				["TextColor3"] = Color3.new(1, 1, 1),
				["Font"] = v_u_107.font(Enum.Font.SourceSans, "GameSettings"),
				["FontSize"] = v_u_107.fontSize(Enum.FontSize.Size24, "GameSettings"),
				["Size"] = UDim2.new(0.6, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(1, 0.5),
				["Position"] = UDim2.new(1, 0, 0.5, 0),
				["TextXAlignment"] = Enum.TextXAlignment.Center,
				["TextYAlignment"] = Enum.TextYAlignment.Center,
				["Parent"] = v_u_204.MovementModeFrame
			})
			local function v_u_565(p563) -- name: setMovementMode
				-- upvalues: (ref) v_u_137, (ref) v_u_14, (ref) v_u_159
				local v564 = nil
				if p563.EnumType == Enum.TouchMovementMode then
					if v_u_137() then
						v564 = v_u_14.TouchMovementMode
					end
					v_u_14.TouchMovementMode = p563
				else
					if v_u_137() then
						v564 = v_u_14.ComputerMovementMode
					end
					v_u_14.ComputerMovementMode = p563
				end
				if v_u_137() then
					v_u_159("movement_mode", v564, p563)
				end
			end
			local function v_u_569(p566)
				-- upvalues: (ref) v_u_118, (ref) v_u_204, (ref) v_u_551
				local v567
				if p566 then
					v567 = v_u_118.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
				else
					v567 = v_u_118.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
				end
				if v_u_204.MovementMode then
					local v568
					if v567 then
						v568 = #v_u_551 > 0
					else
						v568 = v567
					end
					v_u_204.MovementMode.SelectorFrame.Visible = v568
					v_u_204.MovementMode:SetInteractable(v568)
					v_u_204.MovementModeOverrideText.Visible = not v568
				end
				if v_u_204.MovementModeOverrideText then
					v_u_204.MovementModeOverrideText.Visible = not v567
				end
			end
			local function v_u_577() -- name: updateMovementModes
				-- upvalues: (ref) v_u_5, (copy) v_u_556, (ref) v_u_551, (ref) v_u_552, (ref) v_u_553, (ref) v_u_554, (ref) v_u_204, (ref) v_u_73, (ref) v_u_77, (ref) v_u_83, (ref) v_u_84, (ref) v_u_14, (copy) v_u_565, (ref) v_u_569
				local v570 = v_u_5.PreferredInput == Enum.PreferredInput.Touch
				if v_u_556 then
					if v570 then
						v_u_551 = v_u_556:GetRegisteredTouchMovementModes()
					else
						v_u_551 = v_u_556:GetRegisteredComputerMovementModes()
					end
				end
				v_u_552 = {}
				v_u_553 = {}
				v_u_554 = {}
				if #v_u_551 <= 0 then
					if v_u_204.MovementMode then
						v_u_204.MovementMode.SelectorFrame.Visible = false
						v_u_204.MovementMode:SetInteractable(false)
						v_u_204.MovementModeOverrideText.Visible = true
					end
				else
					if v_u_204.MovementMode then
						local v571 = #v_u_551 > 0
						v_u_204.MovementMode.SelectorFrame.Visible = v571
						v_u_204.MovementMode:SetInteractable(v571)
						v_u_204.MovementModeOverrideText.Visible = not v571
					end
					for v572, v573 in v_u_551 do
						v_u_553[v572] = v573
						local v574 = v_u_554
						local v575 = v573.Name
						if v575 == "Default" then
							if v_u_5.PreferredInput == Enum.PreferredInput.Touch then
								v575 = v_u_73:FormatByKey(v_u_77.MovementModeDynamicThumbstickKey)
							else
								v575 = v_u_83.DEFAULT_KEYBOARD
							end
						elseif v575 == "KeyboardMouse" then
							v575 = "Keyboard + Mouse"
						elseif v575 == "ClickToMove" then
							if v_u_5.PreferredInput == Enum.PreferredInput.Touch then
								v575 = v_u_83.TAP_TO_MOVE
							else
								v575 = v_u_83.CLICK_TO_MOVE
							end
						elseif v575 == "DynamicThumbstick" then
							v575 = "Dynamic Thumbstick"
						elseif v575 == "Thumbstick" then
							v575 = v_u_84
						end
						v574[v572] = v575
						v_u_552[v573] = v572
					end
					if v_u_204.MovementMode then
						v_u_204.MovementMode:UpdateOptions(v_u_554)
					end
					local v576
					if v570 then
						v576 = v_u_14.TouchMovementMode
					else
						v576 = v_u_14.ComputerMovementMode
					end
					if v576 then
						v_u_565(v576)
						v_u_204.MovementMode:SetSelectionIndex(v_u_552[v576])
					end
					v_u_569(v570)
				end
			end
			v_u_577()
			if v_u_556 then
				v_u_556.TouchMovementModeRegistered:connect(function(_)
					-- upvalues: (ref) v_u_5, (copy) v_u_577
					if v_u_5.TouchEnabled then
						v_u_577()
					end
				end)
				v_u_556.ComputerMovementModeRegistered:connect(function(_)
					-- upvalues: (ref) v_u_5, (copy) v_u_577
					if v_u_5.MouseEnabled then
						v_u_577()
					end
				end)
			end
			v_u_5:GetPropertyChangedSignal("PreferredInput"):Connect(function()
				-- upvalues: (copy) v_u_577
				v_u_577()
			end)
			v_u_204.MovementMode.IndexChanged:connect(function(p578)
				-- upvalues: (copy) v_u_565, (ref) v_u_553, (ref) v_u_190
				v_u_565(v_u_553[p578])
				v_u_190()
			end)
			v_u_555 = v_u_569
		else
			v_u_555 = function(_) end
		end
		local v579 = v_u_5.PreferredInput == Enum.PreferredInput.Touch
		local v580
		if v579 then
			v580 = v_u_118.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
		else
			v580 = v_u_118.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
		end
		if v580 then
			v_u_204.CameraModeOverrideText.Visible = false
			setCameraModeVisible(true)
		else
			v_u_204.CameraModeOverrideText.Visible = true
			setCameraModeVisible(false)
		end
		local v581
		if v579 then
			v581 = v_u_118.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
		else
			v581 = v_u_118.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
		end
		if v_u_204.MovementModeOverrideText then
			if v581 then
				v_u_204.MovementModeOverrideText.Visible = false
				if v_u_204.MovementMode then
					local v582 = #v_u_551 > 0
					v_u_204.MovementMode.SelectorFrame.Visible = v582
					v_u_204.MovementMode:SetInteractable(v582)
					v_u_204.MovementModeOverrideText.Visible = not v582
				end
			else
				v_u_204.MovementModeOverrideText.Visible = true
				if v_u_204.MovementMode then
					v_u_204.MovementMode.SelectorFrame.Visible = false
					v_u_204.MovementMode:SetInteractable(false)
					v_u_204.MovementModeOverrideText.Visible = true
				end
			end
		end
		local v583 = not v_u_118.DevEnableMouseLock
		if v_u_204.ShiftLockOverrideText then
			v_u_204.ShiftLockOverrideText.Visible = v583
			local v584 = not v583
			if v584 then
				v584 = v_u_118.DevEnableMouseLock
			end
			if v_u_204.ShiftLockMode then
				v_u_204.ShiftLockMode.SelectorFrame.Visible = v584
				v_u_204.ShiftLockMode:SetInteractable(v584)
			end
		end
		local function v_u_594(p585) -- name: updateUserSettingsMenu
			-- upvalues: (ref) v_u_118, (ref) v_u_204, (ref) v_u_555, (ref) v_u_551
			if p585 == "DevEnableMouseLock" then
				local v586 = not v_u_118.DevEnableMouseLock
				if v_u_204.ShiftLockOverrideText then
					v_u_204.ShiftLockOverrideText.Visible = v586
					local v587 = not v586
					if v587 then
						v587 = v_u_118.DevEnableMouseLock
					end
					if v_u_204.ShiftLockMode then
						v_u_204.ShiftLockMode.SelectorFrame.Visible = v587
						v_u_204.ShiftLockMode:SetInteractable(v587)
						return
					end
				end
			else
				if p585 == "DevComputerCameraMode" then
					local v588 = v_u_118.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice
					setCameraModeVisible(v588)
					v_u_204.CameraModeOverrideText.Visible = not v588
					return
				end
				if p585 == "DevComputerMovementMode" then
					if v_u_555 ~= nil then
						v_u_555(false)
						return
					end
					local v589 = v_u_118.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice
					if v_u_204.MovementMode then
						local v590
						if v589 then
							v590 = #v_u_551 > 0
						else
							v590 = v589
						end
						v_u_204.MovementMode.SelectorFrame.Visible = v590
						v_u_204.MovementMode:SetInteractable(v590)
						v_u_204.MovementModeOverrideText.Visible = not v590
					end
					if v_u_204.MovementModeOverrideText then
						v_u_204.MovementModeOverrideText.Visible = not v589
						return
					end
				elseif p585 == "DevTouchMovementMode" then
					if v_u_555 ~= nil then
						v_u_555(true)
						return
					end
					local v591 = v_u_118.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice
					if v_u_204.MovementMode then
						local v592
						if v591 then
							v592 = #v_u_551 > 0
						else
							v592 = v591
						end
						v_u_204.MovementMode.SelectorFrame.Visible = v592
						v_u_204.MovementMode:SetInteractable(v592)
						v_u_204.MovementModeOverrideText.Visible = not v592
					end
					if v_u_204.MovementModeOverrideText then
						v_u_204.MovementModeOverrideText.Visible = not v591
						return
					end
				elseif p585 == "DevTouchCameraMode" then
					local v593 = v_u_118.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice
					setCameraModeVisible(v593)
					v_u_204.CameraModeOverrideText.Visible = not v593
				end
			end
		end
		v_u_118.Changed:connect(function(p595)
			-- upvalues: (ref) v_u_80, (copy) v_u_594, (ref) v_u_79
			if v_u_80[p595] then
				v_u_594(p595)
			end
			if v_u_79[p595] then
				v_u_594(p595)
			end
		end)
	end
	local function v_u_612() -- name: createFeedbackModeOptions
		-- upvalues: (ref) v_u_17, (ref) v_u_6, (ref) v_u_145, (copy) v_u_204, (ref) v_u_19, (ref) v_u_20, (ref) v_u_159, (ref) v_u_144, (ref) v_u_103, (ref) v_u_86, (ref) v_u_73, (ref) v_u_88, (ref) v_u_139, (ref) v_u_127
		local v_u_597 = v_u_17.ROLES_URL .. "v1/users/authenticated/roles"
		local v598 = v_u_6:RequestInternal({
			["Url"] = nil,
			["Method"] = "GET",
			["Url"] = v_u_597
		})
		local function v_u_603(p599) -- name: rolesCheckCallback
			-- upvalues: (ref) v_u_145, (ref) v_u_204, (ref) v_u_19, (ref) v_u_20, (ref) v_u_159, (ref) v_u_144, (ref) v_u_103, (ref) v_u_86, (ref) v_u_73, (ref) v_u_88
			if p599 then
				if not v_u_145 and (game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not v_u_204.FeedbackEntryPointEnabled) then
					return
				end
				local function v600() -- name: onToggleFeedbackMode
					-- upvalues: (ref) v_u_145, (ref) v_u_204, (ref) v_u_19, (ref) v_u_20, (ref) v_u_159
					if not v_u_145 or (not game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") or v_u_204.FeedbackEntryPointEnabled) then
						v_u_204.HubRef:PopMenu(false, true)
						if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
							v_u_19.IsCaptureModeForReport = false
						end
						if v_u_20 ~= nil then
							v_u_20:ToggleCaptureMode()
						end
						v_u_159("translation_feedback", "", "pressed")
					end
				end
				local v601, v602
				if v_u_144 then
					v601, v602 = v_u_103:MakeStyledButton("toggleFeedbackModeButton", v_u_86, UDim2.new(1, 0, 1, -20), v600, v_u_204)
					v601.Size = UDim2.new(0.6, 0, 0, 40)
					v601.Position = UDim2.new(0.4, 0, 0.5, 0)
					v601.AnchorPoint = Vector2.new(0, 0.5)
				else
					v601, v602 = v_u_103:MakeStyledButton("toggleFeedbackModeButton", v_u_86, UDim2.new(0, 300, 1, -20), v600, v_u_204)
					v601.Size = UDim2.new(0, 300, 0, 30)
					v601.Position = UDim2.new(0.4, 0, 0.5, 0)
					v601.AnchorPoint = Vector2.new(0, 0.5)
				end
				v601.ZIndex = 2
				v601.Selectable = true
				v602.ZIndex = 2
				if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
					v_u_204.toggleFeedbackModeButton = v601
					v_u_204.toggleFeedbackModeText = v602
				end
				if v_u_144 then
					v_u_103:AddNewRowObject(v_u_204, v_u_73:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v601, nil, true).LayoutOrder = v_u_88.FeedbackModeButton
					return
				end
				v_u_103:AddNewRowObject(v_u_204, v_u_73:FormatByKey("CoreScripts.Feedback.EntryPoint.OptionText"), v601).LayoutOrder = v_u_88.FeedbackModeButton
			end
		end
		if v_u_139 then
			v_u_603(true)
		else
			v598:Start(function(p604, p_u_605)
				-- upvalues: (ref) v_u_6, (ref) v_u_127, (copy) v_u_597, (copy) v_u_603
				local v_u_606 = false
				local v607 = false
				local v608
				if p604 then
					if p_u_605.StatusCode == 401 then
						v608 = "Roles Api Request: Unauthorized"
					elseif p_u_605.StatusCode < 200 or p_u_605.StatusCode >= 400 then
						v608 = "Roles Api Status code: " .. p_u_605.StatusCode
					else
						local function v611()
							-- upvalues: (ref) v_u_6, (copy) p_u_605, (ref) v_u_606
							local v609 = v_u_6:JSONDecode(p_u_605.Body)
							for _, v610 in pairs(v609.roles) do
								if v610 ~= "Soothsayer" then
									continue
								end
								v_u_606 = true
							end
						end
						v607, v608 = pcall(v611)
					end
				else
					v608 = "Roles Api Request: Connection error"
				end
				if not v607 then
					v_u_127:warning("Feedback Mode initialization api call failed with url: " .. v_u_597 .. " and with error message: " .. v608)
				end
				v_u_603(v_u_606)
			end)
		end
	end
	local function v_u_729() -- name: createTranslationOptions
		-- upvalues: (ref) v_u_9, (ref) v_u_17, (ref) v_u_6, (ref) v_u_127, (copy) v_u_204, (ref) v_u_103, (ref) v_u_73, (ref) v_u_85, (ref) v_u_88, (ref) v_u_118, (ref) v_u_159, (ref) v_u_7
		local v_u_613 = 1
		local v_u_614 = 1
		local v_u_615 = false
		local v_u_616 = nil
		local v_u_617 = nil
		local v_u_618 = v_u_9.LocalPlayer.LocaleId
		local v_u_619 = nil
		local v_u_620 = nil
		local v_u_621 = {}
		local v_u_622 = {}
		local v_u_623 = {}
		local v_u_624 = {}
		local v_u_625 = {}
		local v_u_626 = v_u_17.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", v_u_9.LocalPlayer.LocaleId:gsub("-", "_"))
		local v627 = v_u_6:RequestInternal({
			["Url"] = nil,
			["Method"] = "GET",
			["Url"] = v_u_626
		})
		local v_u_628 = v_u_17.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId)
		local v_u_629 = v_u_6:RequestInternal({
			["Url"] = nil,
			["Method"] = "GET",
			["Url"] = v_u_628
		})
		local v_u_630 = v_u_17.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId)
		local v_u_631 = v_u_6:RequestInternal({
			["Url"] = nil,
			["Method"] = "GET",
			["Url"] = v_u_630
		})
		local v_u_632 = v_u_17.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
		local v_u_633 = v_u_6:RequestInternal({
			["Url"] = nil,
			["Method"] = "GET",
			["Url"] = v_u_632
		})
		local function v_u_674(p634, p635) -- name: userExperienceLanguageSettingsCallback
			-- upvalues: (ref) v_u_127, (ref) v_u_204, (ref) v_u_103, (ref) v_u_73, (ref) v_u_85, (ref) v_u_88, (copy) v_u_625, (copy) v_u_623, (ref) v_u_616, (copy) v_u_621, (ref) v_u_620, (copy) v_u_622, (ref) v_u_613, (ref) v_u_614, (ref) v_u_118, (ref) v_u_617, (ref) v_u_159, (ref) v_u_17, (ref) v_u_6, (ref) v_u_615, (ref) v_u_7
			if p634 then
				local v636 = v_u_625
				local v637 = v_u_623[v_u_616].languageName .. " (Original)"
				table.insert(v636, v637)
				local v638 = false
				for _, v639 in pairs(v_u_621) do
					v638 = v639 == v_u_620 and true or v638
					if v639 == v_u_616 then
						continue
					end
					local v640 = v_u_625
					local v641 = v_u_623[v639].languageName
					table.insert(v640, v641)
				end
				if v638 == true then
					for v642, v643 in pairs(v_u_625) do
						if v642 == 1 or v_u_622[v643] ~= v_u_620 then
							continue
						end
						v_u_613 = v642
						v_u_614 = v642
					end
				end
				local v644 = v_u_204
				local v645 = v_u_204
				local v646 = v_u_204
				local v647, v648, v649 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v_u_625, v_u_613)
				v644.LanguageSelectorFrame = v647
				v645.LanguageSelectorLabel = v648
				v646.LanguageSelectorMode = v649
				v_u_204.LanguageSelectorFrame.LayoutOrder = v_u_88.LanguageSelectorFrame
				if v_u_613 == 1 then
					v_u_118:SetExperienceSettingsLocaleId(v_u_617)
				else
					v_u_118:SetExperienceSettingsLocaleId(v_u_623[v_u_622[v_u_625[v_u_613]]].localeCode)
				end
				v_u_204.LanguageSelectorMode.CurrentLanguage = v_u_204.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text
				local function v666(p_u_650) -- name: toggleTranslation
					-- upvalues: (ref) v_u_204, (ref) v_u_623, (ref) v_u_616, (ref) v_u_622, (ref) v_u_625, (ref) v_u_159, (ref) v_u_17, (ref) v_u_6, (ref) v_u_614, (ref) v_u_118, (ref) v_u_617, (ref) v_u_127, (ref) v_u_615, (ref) v_u_7
					v_u_204.LanguageSelectorMode:SetInteractable(false)
					local v651
					if p_u_650 == 1 then
						v651 = v_u_623[v_u_616].id
					else
						v651 = v_u_623[v_u_622[v_u_625[p_u_650]]].id
					end
					local v652 = v_u_204.LanguageSelectorMode.CurrentLanguage
					local v653 = v_u_625[p_u_650]
					if v652 ~= v653 then
						v_u_204.LanguageSelectorMode.CurrentLanguage = v653
						v_u_159("experience_language", v652, v653)
					end
					local v654 = {
						["settingValue"] = {
							["settingType"] = "LanguageFamily",
							["settingTargetId"] = nil,
							["settingTargetId"] = v651
						}
					}
					local v_u_655 = v_u_17.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId)
					local v656 = v_u_6
					local v657 = {
						["Url"] = nil,
						["Method"] = "POST",
						["Headers"] = nil,
						["Body"] = nil,
						["Url"] = v_u_655,
						["Headers"] = {
							["Content-Type"] = "application/json"
						},
						["Body"] = v_u_6:JSONEncode(v654)
					}
					local v658 = v656:RequestInternal(v657)
					local function v_u_661(p659, p660) -- name: callback
						-- upvalues: (ref) v_u_614, (copy) p_u_650, (ref) v_u_118, (ref) v_u_617, (ref) v_u_622, (ref) v_u_625, (ref) v_u_623, (ref) v_u_127, (ref) v_u_615, (ref) v_u_204
						if p659 then
							v_u_614 = p_u_650
							if p_u_650 == 1 then
								v_u_118:SetExperienceSettingsLocaleId(v_u_617)
							else
								v_u_118:SetExperienceSettingsLocaleId(v_u_623[v_u_622[v_u_625[p_u_650]]].localeCode)
							end
						else
							v_u_127:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. p660)
							v_u_615 = true
							v_u_204.LanguageSelectorMode:SetSelectionIndex(v_u_614)
						end
						v_u_204.LanguageSelectorMode:SetInteractable(true)
					end
					if v_u_7:IsStudio() then
						v_u_614 = p_u_650
						if p_u_650 == 1 then
							v_u_118:SetExperienceSettingsLocaleId(v_u_617)
						else
							v_u_118:SetExperienceSettingsLocaleId(v_u_623[v_u_622[v_u_625[p_u_650]]].localeCode)
						end
						v_u_204.LanguageSelectorMode:SetInteractable(true)
						return
					elseif v_u_615 then
						v_u_615 = false
						v_u_614 = p_u_650
						if p_u_650 == 1 then
							v_u_118:SetExperienceSettingsLocaleId(v_u_617)
						else
							v_u_118:SetExperienceSettingsLocaleId(v_u_623[v_u_622[v_u_625[p_u_650]]].localeCode)
						end
						v_u_204.LanguageSelectorMode:SetInteractable(true)
					else
						v658:Start(function(p662, p663)
							-- upvalues: (ref) v_u_127, (copy) v_u_655, (copy) v_u_661
							local v664 = false
							local v665 = nil
							if p662 then
								if p663.StatusCode == 401 then
									v665 = "User Experience Language Settings Update Request: Unauthorized"
								elseif p663.StatusCode < 200 or p663.StatusCode >= 400 then
									v665 = "User Experience Language Settings Update Request Status Code: " .. p663.StatusCode
								else
									v_u_127:info("User Experience Language Settings Update Request succeeded with code: " .. p663.StatusCode)
									v664 = true
								end
							else
								v665 = "User Experience Language Settings Update Request: Connection error"
							end
							if not v664 then
								v_u_127:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v_u_655 .. " with error message: " .. v665)
							end
							v_u_661(v664, v665)
						end)
					end
				end
				v_u_204.LanguageSelectorMode.IndexChanged:connect(v666)
			else
				v_u_127:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. (p635 == nil and "Execution path did not set earliest error to non-nil value." or p635))
				local v667 = v_u_204
				local v668 = v_u_204
				local v669 = v_u_204
				local v670 = { v_u_85 }
				local v671, v672, v673 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v670, 1)
				v667.LanguageSelectorFrame = v671
				v668.LanguageSelectorLabel = v672
				v669.LanguageSelectorMode = v673
				v_u_204.LanguageSelectorMode:SetInteractable(false)
				v_u_204.LanguageSelectorFrame.LayoutOrder = v_u_88.LanguageSelectorFrame
			end
		end
		v627:Start(function(p675, p_u_676)
			-- upvalues: (ref) v_u_6, (copy) v_u_623, (copy) v_u_624, (copy) v_u_622, (copy) v_u_618, (ref) v_u_619, (ref) v_u_127, (copy) v_u_626, (copy) v_u_629, (ref) v_u_616, (ref) v_u_617, (copy) v_u_628, (copy) v_u_631, (copy) v_u_621, (copy) v_u_630, (copy) v_u_633, (ref) v_u_620, (copy) v_u_632, (copy) v_u_674, (ref) v_u_204, (ref) v_u_103, (ref) v_u_73, (ref) v_u_85, (ref) v_u_88
			local v_u_677 = false
			local v_u_678
			if p675 then
				if p_u_676.StatusCode == 401 then
					v_u_678 = "Locale Code to Language Code Mapping Request: Unauthorized"
				elseif p_u_676.StatusCode < 200 or p_u_676.StatusCode >= 400 then
					v_u_678 = "Locale Code to Language Code Mapping Request Status code: " .. p_u_676.StatusCode
				else
					local function v685()
						-- upvalues: (ref) v_u_6, (copy) p_u_676, (ref) v_u_623, (ref) v_u_624, (ref) v_u_622, (ref) v_u_618, (ref) v_u_619
						local v679 = v_u_6:JSONDecode(p_u_676.Body)
						for _, v680 in pairs(v679.data) do
							local v681 = v680.locale.language.languageCode
							local v682 = v680.locale.locale
							local v683 = v680.locale.language.name
							local v684 = v680.locale.language.id
							v_u_623[v681] = {
								["localeCode"] = v682,
								["languageName"] = v683,
								["id"] = v684
							}
							v_u_624[v684] = v681
							v_u_622[v683] = v681
							if v680.locale.locale ~= v_u_618:gsub("-", "_") then
								continue
							end
							v_u_619 = v680.locale.language.languageCode
						end
					end
					v_u_677, v_u_678 = pcall(v685)
				end
			else
				v_u_678 = "Locale Code to Language Code Mapping Request: Connection error"
			end
			if not v_u_677 then
				v_u_127:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v_u_626 .. " with error message: " .. v_u_678)
			end
			if v_u_677 then
				v_u_629:Start(function(p686, p_u_687)
					-- upvalues: (ref) v_u_6, (ref) v_u_616, (ref) v_u_617, (ref) v_u_623, (ref) v_u_127, (ref) v_u_628, (ref) v_u_678, (copy) v_u_677, (ref) v_u_631, (ref) v_u_621, (ref) v_u_630, (ref) v_u_633, (ref) v_u_620, (ref) v_u_619, (ref) v_u_624, (ref) v_u_632, (ref) v_u_674, (ref) v_u_204, (ref) v_u_103, (ref) v_u_73, (ref) v_u_85, (ref) v_u_88
					local v_u_688 = false
					local v689
					if p686 then
						if p_u_687.StatusCode == 401 then
							v689 = "Experience Source Language Request: Unauthorized"
						elseif p_u_687.StatusCode < 200 or p_u_687.StatusCode >= 400 then
							v689 = "Experience Source Language Status code: " .. p_u_687.StatusCode
						else
							local function v690()
								-- upvalues: (ref) v_u_6, (copy) p_u_687, (ref) v_u_616, (ref) v_u_617, (ref) v_u_623
								v_u_616 = v_u_6:JSONDecode(p_u_687.Body).languageCode
								v_u_617 = v_u_623[v_u_616].localeCode
							end
							v_u_688, v689 = pcall(v690)
						end
					else
						v689 = "Experience Source Language Request: Connection error"
					end
					if not v_u_688 then
						v_u_127:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v_u_628 .. " with error message: " .. v689)
					end
					if v_u_678 == nil then
						v_u_678 = v689
					end
					if v_u_688 then
						v_u_688 = v_u_677
					end
					local v_u_691 = v_u_678
					if v_u_688 then
						v_u_631:Start(function(p692, p_u_693)
							-- upvalues: (ref) v_u_6, (ref) v_u_621, (ref) v_u_127, (ref) v_u_630, (ref) v_u_691, (copy) v_u_688, (ref) v_u_633, (ref) v_u_620, (ref) v_u_619, (ref) v_u_616, (ref) v_u_624, (ref) v_u_632, (ref) v_u_674, (ref) v_u_204, (ref) v_u_103, (ref) v_u_73, (ref) v_u_85, (ref) v_u_88
							local v694 = false
							local v695
							if p692 then
								if p_u_693.StatusCode == 401 then
									v695 = "Experience Supported Language Request: Unauthorized"
								elseif p_u_693.StatusCode < 200 or p_u_693.StatusCode >= 400 then
									v695 = "Experience Supported Language Request Status code: " .. p_u_693.StatusCode
								else
									local function v699()
										-- upvalues: (ref) v_u_6, (copy) p_u_693, (ref) v_u_621
										local v696 = v_u_6:JSONDecode(p_u_693.Body)
										for v697, v698 in pairs(v696.data) do
											v_u_621[v697] = v698.languageCode
										end
									end
									v694, v695 = pcall(v699)
								end
							else
								v695 = "Experience Supported Language Request: Connection error"
							end
							if not v694 then
								v_u_127:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v_u_630 .. " with error message: " .. v695)
							end
							if v_u_691 == nil then
								v_u_691 = v695
							end
							if v694 then
								v694 = v_u_688
							end
							local v700 = v_u_691
							if v694 then
								v_u_633:Start(function(p701, p_u_702)
									-- upvalues: (ref) v_u_6, (ref) v_u_620, (ref) v_u_619, (ref) v_u_616, (ref) v_u_624, (ref) v_u_127, (ref) v_u_632, (ref) v_u_674
									local v703 = false
									local v704
									if p701 then
										if p_u_702.StatusCode == 401 then
											v704 = "User Experience Language Setting Request: Unauthorized"
										elseif p_u_702.StatusCode < 200 or p_u_702.StatusCode >= 400 then
											v704 = "User Experience Language Setting Request Status code: " .. p_u_702.StatusCode
										else
											local function v706()
												-- upvalues: (ref) v_u_6, (copy) p_u_702, (ref) v_u_620, (ref) v_u_619, (ref) v_u_616, (ref) v_u_624
												local v705 = v_u_6:JSONDecode(p_u_702.Body).userUniverseLocalizationSettingValue
												if v705 == nil then
													v_u_620 = v_u_619
												else
													if v705.settingType == "SourceOrTranslation" then
														if v705.settingTargetId == 1 then
															v_u_620 = v_u_616
														else
															v_u_620 = v_u_619
														end
													end
													if v705.settingType == "LanguageFamily" then
														if v_u_624[v705.settingTargetId] == nil then
															v_u_620 = v_u_619
															return
														end
														v_u_620 = v_u_624[v705.settingTargetId]
													end
												end
											end
											v703, v704 = pcall(v706)
										end
									else
										v704 = "User Experience Language Setting Request: Connection error"
									end
									if not v703 then
										v_u_127:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v_u_632 .. " with error message: " .. v704)
									end
									v_u_674(v703, v704)
								end)
							else
								v_u_127:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. (v700 == nil and "Execution path did not set earliest error to non-nil value." or v700))
								local v707 = v_u_204
								local v708 = v_u_204
								local v709 = v_u_204
								local v710 = { v_u_85 }
								local v711, v712, v713 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v710, 1)
								v707.LanguageSelectorFrame = v711
								v708.LanguageSelectorLabel = v712
								v709.LanguageSelectorMode = v713
								v_u_204.LanguageSelectorMode:SetInteractable(false)
								v_u_204.LanguageSelectorFrame.LayoutOrder = v_u_88.LanguageSelectorFrame
							end
						end)
					else
						local v714 = v_u_691
						v_u_127:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. (v714 == nil and "Execution path did not set earliest error to non-nil value." or v714))
						local v715 = v_u_204
						local v716 = v_u_204
						local v717 = v_u_204
						local v718 = { v_u_85 }
						local v719, v720, v721 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v718, 1)
						v715.LanguageSelectorFrame = v719
						v716.LanguageSelectorLabel = v720
						v717.LanguageSelectorMode = v721
						v_u_204.LanguageSelectorMode:SetInteractable(false)
						v_u_204.LanguageSelectorFrame.LayoutOrder = v_u_88.LanguageSelectorFrame
					end
				end)
			else
				v_u_127:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. (v_u_678 == nil and "Execution path did not set earliest error to non-nil value." or v_u_678))
				local v722 = v_u_204
				local v723 = v_u_204
				local v724 = v_u_204
				local v725 = { v_u_85 }
				local v726, v727, v728 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v725, 1)
				v722.LanguageSelectorFrame = v726
				v723.LanguageSelectorLabel = v727
				v724.LanguageSelectorMode = v728
				v_u_204.LanguageSelectorMode:SetInteractable(false)
				v_u_204.LanguageSelectorFrame.LayoutOrder = v_u_88.LanguageSelectorFrame
			end
		end)
	end
	local function v_u_735(p_u_730) -- name: getChatTranslationLayerData
		-- upvalues: (ref) v_u_93, (ref) v_u_89, (ref) v_u_95
		local v731 = {
			["ChatTranslationEnabled"] = false,
			["ChatTranslationToggleEnabled"] = false
		}
		if not p_u_730 or p_u_730 == "" then
			return v731
		end
		if p_u_730 == "override" then
			v731.ChatTranslationEnabled = true
			return v731
		end
		if v_u_93() then
			v_u_89:WaitForInitialization()
		end
		local function v732()
			-- upvalues: (ref) v_u_89, (copy) p_u_730
			return v_u_89:GetLayerData(p_u_730)
		end
		local v733, v734 = pcall(v732)
		if v733 then
			if v_u_95() then
				v731.ChatTranslationEnabled = v734.ChatTranslationEnabled or true
				v731.ChatTranslationToggleEnabled = v734.ChatTranslationToggleEnabled or false
				return v731
			end
			v731.ChatTranslationEnabled = v734.chatTranslationEnabled or false
			v731.ChatTranslationToggleEnabled = v734.chatTranslationToggleEnabled or false
		end
		return v731
	end
	local function v751() -- name: createVolumeOptions
		-- upvalues: (ref) v_u_14, (copy) v_u_204, (ref) v_u_103, (ref) v_u_58, (ref) v_u_73, (ref) v_u_88, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v736 = v_u_14.MasterVolume * 10
		local v737 = math.floor(v736)
		local v738 = v_u_204
		local v739 = v_u_204
		local v740 = v_u_204
		local v741, v742, v743 = v_u_103:AddNewRow(v_u_204, not v_u_58 and "Volume" or v_u_73:FormatByKey("CoreScripts.InGameMenu.GameSettings.MainVolume"), "Slider", 10, v737)
		v738.VolumeFrame = v741
		v739.VolumeLabel = v742
		v740.VolumeSlider = v743
		v_u_204.VolumeFrame.LayoutOrder = v_u_88.VolumeFrame
		local v_u_744 = Instance.new("Sound", game:GetService("CoreGui").RobloxGui.Sounds)
		v_u_744.Name = "VolumeChangeSound"
		v_u_744.SoundId = "rbxasset://sounds/uuhhh.mp3"
		v_u_204.VolumeSlider.ValueChanged:connect(function(p745)
			-- upvalues: (ref) v_u_137, (ref) v_u_14, (copy) v_u_744, (ref) v_u_159, (ref) v_u_190
			local v746
			if v_u_137() then
				local v747 = v_u_14.MasterVolume * 10 + 0.5
				v746 = math.floor(v747)
			else
				v746 = nil
			end
			local v748 = p745 / 10
			v_u_744.Volume = v748
			v_u_744:Play()
			v_u_14.MasterVolume = v748
			if v_u_137() then
				local v749 = v_u_159
				local v750 = v_u_14.MasterVolume * 10 + 0.5
				v749("volume", v746, (math.floor(v750)))
			end
			v_u_190()
		end)
	end
	local function v765() -- name: createPartyVoiceVolumeOptions
		-- upvalues: (ref) v_u_14, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_35, (ref) v_u_123, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v752 = v_u_14.PartyVoiceVolume * 10
		local v_u_753 = math.floor(v752)
		local v754 = v_u_204
		local v755 = v_u_204
		local v756 = v_u_204
		local v757, v758, v759 = v_u_103:AddNewRow(v_u_204, "Party Voice Volume", "Slider", 10, v_u_753)
		v754.PartyVoiceVolumeFrame = v757
		v755.PartyVoiceVolumeLabel = v758
		v756.PartyVoiceVolumeSlider = v759
		v_u_204.PartyVoiceVolumeFrame.LayoutOrder = v_u_88.PartyVoiceVolumeFrame
		if v_u_35() then
			v_u_204.PartyVoiceVolumeFrame.Visible = v_u_123.hasExperienceStarted
			v_u_123.ExperienceJoined.Event:Connect(function()
				-- upvalues: (ref) v_u_204
				v_u_204.PartyVoiceVolumeFrame.Visible = true
			end)
			v_u_123.ExperienceLeft.Event:Connect(function()
				-- upvalues: (ref) v_u_204
				v_u_204.PartyVoiceVolumeFrame.Visible = false
			end)
		end
		v_u_204.PartyVoiceVolumeSlider.ValueChanged:connect(function(p760)
			-- upvalues: (ref) v_u_137, (copy) v_u_753, (ref) v_u_14, (ref) v_u_159, (ref) v_u_190
			local v761
			if v_u_137() then
				if v_u_753 == nil then
					v761 = 0
				else
					local v762 = v_u_753 * 10 + 0.5
					v761 = math.floor(v762)
				end
			else
				v761 = nil
			end
			v_u_14.PartyVoiceVolume = p760 / 10
			if v_u_137() then
				local v763 = v_u_159
				local v764 = p760 * 10 + 0.5
				v763("party_voice_volume", v761, (math.floor(v764)))
			end
			v_u_190()
		end)
	end
	local function v788() -- name: createVoiceChatVolumeOptions
		-- upvalues: (ref) v_u_14, (ref) v_u_24, (ref) v_u_127, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_69, (ref) v_u_137, (ref) v_u_71, (ref) v_u_159, (ref) v_u_190
		local v766 = v_u_14.VoiceChatVolume * 5 + 0.5
		local v767 = math.floor(v766)
		local function v768()
			-- upvalues: (ref) v_u_24
			return v_u_24:Format("CoreScripts.InGameMenu.GameSettings.VoiceChatVolume")
		end
		local v769, v770 = pcall(v768)
		if not v769 then
			v_u_127:debug("[GameSettings] createVoiceChatVolumeOptions failed to get translation for Voice Chat Volume label, using placeholder text instead")
			v770 = "Voice Chat Volume"
		end
		local v771 = v_u_204
		local v772 = v_u_204
		local v773 = v_u_204
		local v774, v775, v776 = v_u_103:AddNewRow(v_u_204, v770, "Slider", 10, v767)
		v771.VoiceChatVolumeFrame = v774
		v772.VoiceChatVolumeLabel = v775
		v773.VoiceChatVolumeSlider = v776
		v_u_204.VoiceChatVolumeFrame.LayoutOrder = v_u_88.VoiceChatVolumeFrame
		v_u_204.VoiceChatVolumeFrame.Visible = false
		if v_u_69 then
			local function v779(p777) -- name: updateVoiceChatVolumeSliderInteractable
				-- upvalues: (ref) v_u_14, (ref) v_u_204
				local v778
				if p777 == nil then
					v778 = v_u_14.MasterVolume == 0
				else
					v778 = p777 == 0
				end
				if v778 then
					v_u_204.VoiceChatVolumeSlider:SetZIndex(1)
					v_u_204.VoiceChatVolumeLabel.ZIndex = 1
					v_u_204.VoiceChatVolumeSlider:SetInteractable(false)
				else
					v_u_204.VoiceChatVolumeSlider:SetZIndex(2)
					v_u_204.VoiceChatVolumeLabel.ZIndex = 2
					v_u_204.VoiceChatVolumeSlider:SetInteractable(true)
				end
			end
			v779()
			v_u_204.VolumeSlider.ValueChanged:connect(v779)
		end
		v_u_204.VoiceChatVolumeSlider.ValueChanged:connect(function(p780)
			-- upvalues: (ref) v_u_137, (ref) v_u_14, (ref) v_u_71, (ref) v_u_204, (ref) v_u_159, (ref) v_u_190
			local v781
			if v_u_137() then
				local v782 = v_u_14.VoiceChatVolume * 5 + 0.5
				v781 = math.floor(v782)
			else
				v781 = nil
			end
			v_u_14.VoiceChatVolume = p780 / 5
			if v_u_71 and v_u_204.maxVoiceChatVolumeDuringSession ~= nil then
				local v783 = v_u_204
				local v784 = v_u_204.maxVoiceChatVolumeDuringSession
				local v785 = v_u_14.VoiceChatVolume
				v783.maxVoiceChatVolumeDuringSession = math.max(v784, v785)
			end
			if v_u_137() then
				local v786 = v_u_159
				local v787 = v_u_14.VoiceChatVolume * 5 + 0.5
				v786("voice_chat_volume", v781, (math.floor(v787)))
			end
			v_u_190()
		end)
	end
	local function v797() -- name: createHapticsToggle
		-- upvalues: (ref) v_u_14, (ref) v_u_124, (ref) v_u_24, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v789 = v_u_14.HapticStrength == 0 and 1 or 2
		local v790 = v_u_204
		local v791 = v_u_204
		local v792, v793, v794 = v_u_103:AddNewRow(v_u_204, not v_u_124().getShouldUseVibrationInsteadOfHaptics() and "Haptics" or v_u_24:Format("CoreScripts.InGameMenu.Vibration"), "Selector", { "Off", "On" }, v789)
		v790.HapticsFrame = v792
		_ = v793
		v791.HapticsSelector = v794
		v_u_204.HapticsFrame.LayoutOrder = v_u_88.HapticsFrame
		v_u_204.HapticsSelector.IndexChanged:connect(function(p795)
			-- upvalues: (ref) v_u_14, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
			local v796 = v_u_14.HapticStrength
			if p795 == 2 then
				v_u_14.HapticStrength = 1
			else
				v_u_14.HapticStrength = 0
			end
			if v_u_137() then
				v_u_159("haptics_toggle", v796, v_u_14.HapticStrength)
			end
			v_u_190()
		end)
	end
	local function v_u_807() -- name: createCameraInvertedOptions
		-- upvalues: (ref) v_u_14, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (copy) v_u_206, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v_u_798 = 1
		local function v799()
			-- upvalues: (ref) v_u_14, (ref) v_u_798
			if v_u_14.CameraYInverted == true then
				v_u_798 = 2
			end
		end
		if pcall(v799) ~= false then
			local v800 = v_u_204
			local v801 = v_u_204
			local v802, v803, v804 = v_u_103:AddNewRow(v_u_204, "Camera Inverted", "Selector", { "Off", "On" }, v_u_798)
			v800.CameraInvertedFrame = v802
			_ = v803
			v801.CameraInvertedSelector = v804
			v_u_204.CameraInvertedFrame.LayoutOrder = v_u_88.CameraInvertedFrame
			v_u_206[v_u_204.CameraInvertedFrame] = true
			v_u_204.CameraInvertedSelector.IndexChanged:connect(function(p805)
				-- upvalues: (ref) v_u_137, (ref) v_u_14, (ref) v_u_159, (ref) v_u_190
				local v806
				if v_u_137() then
					v806 = v_u_14.CameraYInverted
				else
					v806 = nil
				end
				if p805 == 2 then
					v_u_14.CameraYInverted = true
				else
					v_u_14.CameraYInverted = false
				end
				if v_u_137() then
					v_u_159("camera_y_inverted", v806, v_u_14.CameraYInverted)
				end
				v_u_190()
			end)
		end
	end
	local function v_u_816(p808) -- name: setCameraSensitivity
		-- upvalues: (ref) v_u_5, (ref) v_u_14, (ref) v_u_137, (ref) v_u_159, (ref) v_u_190
		local v809 = nil
		local v810 = nil
		if v_u_5.GamepadEnabled and v_u_14.IsUsingGamepadCameraSensitivity then
			if v_u_137() then
				v810 = v_u_14.GamepadCameraSensitivity
				v809 = "gamepad"
			end
			v_u_14.GamepadCameraSensitivity = p808
		end
		if v_u_5.MouseEnabled then
			if v_u_137() then
				v810 = v_u_14.MouseSensitivityFirstPerson.X
				v809 = "mouse"
			end
			local v811 = Vector2.new(p808, p808)
			v_u_14.MouseSensitivityFirstPerson = v811
			v_u_14.MouseSensitivityThirdPerson = v811
		end
		if v_u_137() and (typeof(v810) == "number" and typeof(p808) == "number") then
			local v812 = v_u_159
			local v813 = string.format
			local v814 = tonumber(v813("%.2f", v810))
			local v815 = string.format
			v812("camera_sensitivity", v814, tonumber(v815("%.2f", p808)), {
				["sensitivity_type"] = v809
			})
		end
		v_u_190()
	end
	local function v858() -- name: createMouseOptions
		-- upvalues: (ref) v_u_14, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (copy) v_u_206, (ref) v_u_110, (ref) v_u_107, (copy) v_u_816
		local v817 = v_u_14.MouseSensitivity
		local v818, v819
		if v817 <= 1 then
			local v820 = (v817 - 0.2) / 0.16 + 0.5
			v818 = math.floor(v820)
			if not v818 then
				v819 = (v817 + 2) / 0.6 + 0.5
				v818 = math.floor(v819)
			end
		else
			v819 = (v817 + 2) / 0.6 + 0.5
			v818 = math.floor(v819)
		end
		local v821 = v817 <= 0.2 and 0 or v818
		local v_u_822 = true
		local v823 = v_u_14.MouseSensitivityFirstPerson.X
		tostring(v823)
		local v824 = v_u_204
		local v825 = v_u_204
		local v826 = v_u_204
		local v827, v828, v829 = v_u_103:AddNewRow(v_u_204, "Camera Sensitivity", "Slider", 10, v821)
		v824.MouseAdvancedFrame = v827
		v825.MouseAdvancedLabel = v828
		v826.MouseAdvancedEntry = v829
		v_u_204.MouseAdvancedFrame.LayoutOrder = v_u_88.MouseAdvancedFrame
		v_u_206[v_u_204.MouseAdvancedFrame] = true
		v_u_204.MouseAdvancedEntry.SliderFrame.Size = UDim2.new(v_u_204.MouseAdvancedEntry.SliderFrame.Size.X.Scale, v_u_204.MouseAdvancedEntry.SliderFrame.Size.X.Offset - 60 - 20, v_u_204.MouseAdvancedEntry.SliderFrame.Size.Y.Scale, v_u_204.MouseAdvancedEntry.SliderFrame.Size.Y.Offset - 6)
		v_u_204.MouseAdvancedEntry.SliderFrame.Position = UDim2.new(v_u_204.MouseAdvancedEntry.SliderFrame.Position.X.Scale, v_u_204.MouseAdvancedEntry.SliderFrame.Position.X.Offset - 60 - 20, v_u_204.MouseAdvancedEntry.SliderFrame.Position.Y.Scale, v_u_204.MouseAdvancedEntry.SliderFrame.Position.Y.Offset)
		v_u_204.MouseAdvancedLabel.ZIndex = 2
		v_u_204.MouseAdvancedEntry:SetInteractable(true)
		local v_u_830 = v_u_110("TextBox")({
			["Name"] = "CameraSensitivityTextBox",
			["TextColor3"] = nil,
			["BorderColor3"] = nil,
			["BackgroundColor3"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ZIndex"] = 3,
			["Selectable"] = false,
			["Parent"] = nil,
			["BorderSizePixel"] = 0,
			["TextColor3"] = Color3.new(1, 1, 1),
			["BorderColor3"] = Color3.new(0.8, 0.8, 0.8),
			["BackgroundColor3"] = Color3.new(0.2, 0.2, 0.2),
			["Font"] = v_u_107.font(Enum.Font.SourceSans),
			["TextSize"] = v_u_107.textSize(18),
			["Size"] = UDim2.new(0, 60, 0.8, 0),
			["Position"] = UDim2.new(1, 10, 0.5, 0),
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Parent"] = v_u_204.MouseAdvancedEntry.SliderFrame
		})
		v_u_110("UICorner")({
			["CornerRadius"] = v_u_107.DefaultCornerRadius,
			["Parent"] = v_u_830
		})
		local v831 = v_u_14.MouseSensitivityFirstPerson.X * 1000 + 0.5
		local v832 = math.floor(v831) / 1000
		local v833 = string.format("%.3f", v832)
		local v834 = tonumber(v833)
		v_u_830.Text = tostring(v834)
		local v835 = v_u_204.MouseAdvancedEntry
		local v836 = v_u_14.MouseSensitivityFirstPerson.X
		local v837, v838
		if v836 <= 1 then
			local v839 = (v836 - 0.2) / 0.16 + 0.5
			v837 = math.floor(v839)
			if not v837 then
				v838 = (v836 + 2) / 0.6 + 0.5
				v837 = math.floor(v838)
			end
		else
			v838 = (v836 + 2) / 0.6 + 0.5
			v837 = math.floor(v838)
		end
		v835:SetValue(v836 <= 0.2 and 0 or v837)
		function clampMouseSensitivity(p840) -- name: clampMouseSensitivity
			if p840 < 0 then
				p840 = -p840
			end
			return p840 > 100 and 100 or (p840 < 0.001 and 0.001 or p840)
		end
		function setMouseSensitivity(p841, p842) -- name: setMouseSensitivity
			-- upvalues: (ref) v_u_822, (ref) v_u_816, (ref) v_u_204, (copy) v_u_830
			if not v_u_822 then
				return
			end
			v_u_816(p841)
			v_u_822 = false
			local v843, v844, v845, v846, v847
			if p842 == v_u_204.MouseAdvancedEntry then
				v843 = p841 * 1000 + 0.5
				v844 = math.floor(v843) / 1000
				v845 = string.format("%.3f", v844)
				v846 = v_u_830
				v847 = tonumber(v845)
				v846.Text = tostring(v847)
				v_u_822 = true
			else
				local v848 = v_u_204.MouseAdvancedEntry
				local v849, v850
				if p841 <= 1 then
					local v851 = (p841 - 0.2) / 0.16 + 0.5
					v849 = math.floor(v851)
					if v849 then
						v848:SetValue(p841 <= 0.2 and 0 or v849)
					else
						v850 = (p841 + 2) / 0.6 + 0.5
						v849 = math.floor(v850)
						v848:SetValue(p841 <= 0.2 and 0 or v849)
					end
				else
					v850 = (p841 + 2) / 0.6 + 0.5
					v849 = math.floor(v850)
					v848:SetValue(p841 <= 0.2 and 0 or v849)
				end
				v843 = p841 * 1000 + 0.5
				v844 = math.floor(v843) / 1000
				v845 = string.format("%.3f", v844)
				v846 = v_u_830
				v847 = tonumber(v845)
				v846.Text = tostring(v847)
				v_u_822 = true
			end
		end
		v_u_830.FocusLost:connect(function()
			-- upvalues: (ref) v_u_204, (copy) v_u_830, (ref) v_u_14
			v_u_204.MouseAdvancedEntry:SetInteractable(true)
			local v852 = string.match(v_u_830.Text, "([%d%.]+)")
			local v853 = tonumber(v852)
			if v853 then
				setMouseSensitivity(clampMouseSensitivity(v853), v_u_830)
			else
				setMouseSensitivity(v_u_14.MouseSensitivityFirstPerson.X, v_u_830)
			end
		end)
		v_u_830.Focused:connect(function()
			-- upvalues: (ref) v_u_204
			v_u_204.MouseAdvancedEntry:SetInteractable(false)
		end)
		v_u_204.MouseAdvancedEntry.ValueChanged:connect(function(p854)
			-- upvalues: (ref) v_u_204
			local v855 = clampMouseSensitivity(p854)
			local v856 = v855 <= 5 and 0.16 * v855 + 0.2 or 0.6 * v855 - 2
			local v857 = v856 <= 0.2 and 0.2 or v856
			setMouseSensitivity(v857, v_u_204.MouseAdvancedEntry)
		end)
	end
	local function v_u_873() -- name: createGamepadOptions
		-- upvalues: (ref) v_u_14, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (copy) v_u_816
		local v859 = v_u_14.GamepadCameraSensitivity
		local v860, v861
		if v859 <= 1 then
			local v862 = (v859 - 0.2) / 0.16 + 0.5
			v860 = math.floor(v862)
			if not v860 then
				v861 = (v859 + 2) / 0.6 + 0.5
				v860 = math.floor(v861)
			end
		else
			v861 = (v859 + 2) / 0.6 + 0.5
			v860 = math.floor(v861)
		end
		local v863 = v859 <= 0.2 and 0 or v860
		local v864 = v_u_204
		local v865 = v_u_204
		local v866 = v_u_204
		local v867, v868, v869 = v_u_103:AddNewRow(v_u_204, "Camera Sensitivity", "Slider", 10, v863)
		v864.GamepadSensitivityFrame = v867
		v865.GamepadSensitivityLabel = v868
		v866.GamepadSensitivitySlider = v869
		v_u_204.GamepadSensitivityFrame.LayoutOrder = v_u_88.GamepadSensitivityFrame
		v_u_204.GamepadSensitivitySlider.ValueChanged:connect(function(p870)
			-- upvalues: (ref) v_u_816
			local v871 = v_u_816
			local v872 = p870 <= 5 and 0.16 * p870 + 0.2 or 0.6 * p870 - 2
			v871(v872 <= 0.2 and 0.2 or v872)
		end)
	end
	local function v886() -- name: createOverscanOption
		-- upvalues: (ref) v_u_2, (ref) v_u_4, (ref) v_u_8, (ref) v_u_103, (copy) v_u_204, (ref) v_u_107, (ref) v_u_7, (ref) v_u_88
		local function v881()
			-- upvalues: (ref) v_u_2, (ref) v_u_4, (ref) v_u_8
			local v_u_874 = require(v_u_2.Modules.Settings.SettingsHub)
			local v875 = require(v_u_2.Modules.Shell.Components.Overscan10ft.Overscan)
			local v876 = require(v_u_2.Modules.Settings.Components.OverscanWrapper)(v875)
			local v_u_877 = require(v_u_4.Packages.Roact)
			local v_u_878 = nil
			local v879 = {
				["onUnmount"] = function()
					-- upvalues: (ref) v_u_878, (copy) v_u_877, (ref) v_u_8, (copy) v_u_874
					if v_u_878 then
						v_u_877.unmount(v_u_878)
						v_u_8:UnbindCoreAction("RbxStopOverscanMovement")
						v_u_874:SetVisibility(true, true)
					end
				end,
				["ImageVisible"] = false,
				["BackgroundTransparency"] = 0.2
			}
			v_u_874:SetVisibility(false, true)
			v_u_8:BindCoreAction("RbxStopOverscanMovement", function() end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			local v880 = v_u_877.createElement(v876, v879)
			v_u_878 = v_u_877.mount(v880, v_u_2, (tostring(v876)))
		end
		local v882, v883, v884 = v_u_103:MakeStyledButton("AdjustButton", "Adjust", UDim2.new(0, 300, 1, -20), v881, v_u_204)
		v883.Font = v_u_107.font(Enum.Font.SourceSans)
		v882.Position = UDim2.new(1, -400, 0, 12)
		v882.Size = UDim2.new(0, 300, 0, 40)
		v882.Position = UDim2.new(1, -400, 0.5, 0)
		v882.AnchorPoint = Vector2.new(0, 0.5)
		if v_u_7:IsStudio() then
			v882.Selectable = false
			v882.Active = false
			v882.Enabled.Value = false
			v883.TextColor3 = Color3.fromRGB(100, 100, 100)
		end
		local v885 = v_u_103:AddNewRowObject(v_u_204, "Safe Zone", v882)
		v885.LayoutOrder = v_u_88.OverscanAdjustButton
		v884(v885)
	end
	local function v899() -- name: createDeveloperConsoleOption
		-- upvalues: (ref) v_u_159, (ref) v_u_142, (ref) v_u_103, (copy) v_u_204, (ref) v_u_107, (ref) v_u_88, (ref) v_u_7, (ref) v_u_105, (ref) v_u_9
		local function v_u_898() -- name: makeDevConsoleOption
			-- upvalues: (ref) v_u_159, (ref) v_u_142, (ref) v_u_103, (ref) v_u_204, (ref) v_u_107, (ref) v_u_88
			local function v889() -- name: onOpenDevConsole
				-- upvalues: (ref) v_u_159
				local v887 = require(script.Parent.Parent.Parent.DevConsoleMaster)
				if v887 then
					v887:SetVisibility(true)
					local v888 = require(script.Parent.Parent.SettingsHub)
					if v888 then
						v888:SetVisibility(false)
					end
					v_u_159("dev_console", "", "pressed")
				end
			end
			if v_u_142 then
				local v890, v891, v892 = v_u_103:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(1, 0, 1, -20), v889, v_u_204)
				v891.Font = v_u_107.font(Enum.Font.SourceSans)
				v890.Size = UDim2.new(0.6, -10, 0, 35)
				v890.Position = UDim2.new(0.4, 10, 0.5, 0)
				v890.AnchorPoint = Vector2.new(0, 0.5)
				local v893 = v_u_103:AddNewRowObject(v_u_204, "Developer Console", v890, nil, true)
				v893.LayoutOrder = v_u_88.DeveloperConsoleButton
				v892(v893)
			else
				local v894, v895, v896 = v_u_103:MakeStyledButton("DevConsoleButton", "Open", UDim2.new(0, 300, 1, -20), v889, v_u_204)
				v895.Font = v_u_107.font(Enum.Font.SourceSans)
				v894.Size = UDim2.new(0.6, -10, 0, 35)
				v894.Position = UDim2.new(1, -400, 0.5, 0)
				v894.AnchorPoint = Vector2.new(0, 0.5)
				local v897 = v_u_103:AddNewRowObject(v_u_204, "Developer Console", v894)
				v897.LayoutOrder = v_u_88.DeveloperConsoleButton
				v896(v897)
			end
		end
		if v_u_7:IsStudio() then
			v_u_898()
		else
			spawn(function()
				-- upvalues: (ref) v_u_105, (ref) v_u_9, (copy) v_u_898
				if v_u_105.CanPlayerManagePlaceAsync(v_u_9.LocalPlayer) then
					v_u_898()
				end
			end)
		end
	end
	local function v_u_924() -- name: createUiToggleOptions
		-- upvalues: (ref) v_u_141, (ref) v_u_140, (ref) v_u_73, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_3, (ref) v_u_118
		if v_u_141 or v_u_140 then
			local v900 = {
				{
					["label"] = "Custom",
					["type"] = nil,
					["layoutOrderKey"] = "UiToggleRowCustom",
					["type"] = Enum.GuiType.Custom
				},
				{
					["label"] = "CustomBillboards",
					["type"] = nil,
					["layoutOrderKey"] = "UiToggleRowBillboards",
					["type"] = Enum.GuiType.CustomBillboards
				},
				{
					["label"] = "PlayerNameplates",
					["type"] = nil,
					["layoutOrderKey"] = "UiToggleRowNameplates",
					["type"] = Enum.GuiType.PlayerNameplates
				}
			}
			local v901 = v_u_73:FormatByKey("InGame.CommonUI.Label.On")
			local v902 = v_u_73:FormatByKey("InGame.CommonUI.Label.Off")
			v_u_204.uiToggleSelectors = {}
			for _, v_u_903 in v900 do
				local v904 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.ShowGuiType", {
					["GuiType"] = v_u_903.label
				})
				local v905, v906, v907 = v_u_103:AddNewRow(v_u_204, v904, "Selector", { v901, v902 }, 1)
				v905.LayoutOrder = v_u_88[v_u_903.layoutOrderKey]
				v907.IndexChanged:Connect(function(p908)
					-- upvalues: (ref) v_u_3, (copy) v_u_903
					if (v_u_3:GetGuiIsVisible(v_u_903.type) and 1 or 2) ~= p908 then
						v_u_3:ToggleGuiIsVisibleIfAllowed(v_u_903.type)
					end
				end)
				v_u_204.uiToggleSelectors[v_u_903.label] = {
					["label"] = v904,
					["type"] = v_u_903.type,
					["row"] = v905,
					["frame"] = v906,
					["selector"] = v907
				}
			end
			local v909 = v_u_204
			local v910 = v_u_204
			local v911 = v_u_204
			local v912, v913, v914 = v_u_103:AddNewRow(v_u_204, v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.GuiVisibility.Freecam"), "Selector", { v902, v901 }, 1)
			v909.freecamRow = v912
			v910.freecamFrame = v913
			v911.freecamSelector = v914
			v_u_204.freecamRow.LayoutOrder = v_u_88.FreecamToggleRow
			v_u_204.freecamSelector.IndexChanged:Connect(function(p915)
				-- upvalues: (ref) v_u_118
				local v916 = p915 == 2
				local v917 = v_u_118:FindFirstChild("FreecamScript", true)
				if v917 then
					v917:SetAttribute("FreecamEnabled", v916)
				else
					warn("Freecam not present")
				end
			end)
		else
			local v918 = v_u_204
			local v919 = v_u_204
			local v920 = v_u_204
			local v921, v922, v923 = v_u_103:AddNewRow(v_u_204, "BillboardGui Visibility", "Selector", { "All visible", "Hide nameplates/bubble chat" }, 1)
			v918.uiToggleRow = v921
			v919.uiToggleFrame = v922
			v920.uiToggleSelector = v923
			v_u_204.uiToggleRow.LayoutOrder = v_u_88.UiToggleRow
			v_u_204.uiToggleSelector.IndexChanged:connect(function(_)
				-- upvalues: (ref) v_u_3
				v_u_3:ToggleGuiIsVisibleIfAllowed(Enum.GuiType.PlayerNameplates)
			end)
		end
	end
	local function v_u_930() -- name: updateUiToggleSelection
		-- upvalues: (ref) v_u_141, (ref) v_u_140, (copy) v_u_204, (ref) v_u_3, (ref) v_u_118
		if v_u_141 or v_u_140 then
			if not v_u_204.uiToggleSelectors then
				return
			end
			for _, v925 in v_u_204.uiToggleSelectors do
				local v926 = v_u_3:GetGuiIsVisible(v925.type) and 1 or 2
				if v926 == v925.selector:GetSelectedIndex() then
					continue
				end
				v925.selector:SetSelectionIndex(v926)
			end
			local v927 = v_u_118:FindFirstChild("FreecamScript", true)
			if v927 then
				local v928 = v927:GetAttribute("FreecamEnabled") and 2 or 1
				v_u_204.freecamSelector:SetSelectionIndex(v928)
				return
			end
		else
			if not v_u_204.uiToggleSelector then
				return
			end
			local v929 = v_u_3:GetGuiIsVisible(Enum.GuiType.PlayerNameplates) and 1 or 2
			if v929 == v_u_204.uiToggleSelector:GetSelectedIndex() then
				return
			end
			v_u_204.uiToggleSelector:SetSelectionIndex(v929)
		end
	end
	local function v_u_953(p_u_931) -- name: createDeviceOptions
		-- upvalues: (copy) v_u_204, (ref) v_u_73, (ref) v_u_103, (ref) v_u_88, (ref) v_u_133, (ref) v_u_121, (ref) v_u_11, (ref) v_u_127, (ref) v_u_36, (ref) v_u_123, (ref) v_u_159
		local v932 = v_u_204[p_u_931 .. "DeviceIndex"] or 0
		local v933 = v_u_204[p_u_931 .. "DeviceNames"] or {}
		local v934 = v_u_204[p_u_931 .. "DeviceGuids"] or {}
		local v935 = p_u_931 == "Input" and v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.InputDevice") or v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.OutputDevice")
		local v936 = v_u_204
		local v937 = p_u_931 .. "DeviceFrame"
		local v938 = v_u_204
		local v939 = p_u_931 .. "DeviceSelector"
		local v940, v941, v942 = v_u_103:AddNewRow(v_u_204, v935, "Selector", v933, v932)
		v936[v937] = v940
		_ = v941
		v938[v939] = v942
		v_u_204[p_u_931 .. "DeviceFrame"].LayoutOrder = p_u_931 == "Input" and v_u_88.DeviceFrameInput or v_u_88.DeviceFrameOutput
		local v943 = v_u_204
		local v944 = p_u_931 .. "DeviceInfo"
		local v945 = {}
		local v946
		if v932 > 0 then
			v946 = v933[v932] or nil
		else
			v946 = nil
		end
		v945.Name = v946
		v945.Guid = v932 > 0 and v934[v932] or nil
		v943[v944] = v945
		v_u_204[p_u_931 .. "PrevDeviceName"] = v_u_204[p_u_931 .. "DeviceInfo"].Name
		local v_u_947 = 0
		local v_u_948 = v_u_133()
		v_u_204[p_u_931 .. "DeviceSelector"].IndexChanged:connect(function(p949)
			-- upvalues: (ref) v_u_204, (copy) p_u_931, (ref) v_u_947, (copy) v_u_948, (ref) v_u_121, (ref) v_u_11, (ref) v_u_127, (ref) v_u_36, (ref) v_u_123, (ref) v_u_159
			if v_u_204[p_u_931 .. "DeviceInfo"].Name ~= v_u_204[p_u_931 .. "DeviceNames"][p949] or v_u_204[p_u_931 .. "DeviceInfo"].Guid ~= v_u_204[p_u_931 .. "DeviceGuids"][p949] then
				local v950 = v_u_947 + 1
				v_u_947 = v950
				wait(v_u_948)
				if v950 == v_u_947 then
					v_u_947 = 0
					v_u_204[p_u_931 .. "DeviceInfo"] = {
						["Name"] = v_u_204[p_u_931 .. "DeviceNames"][p949],
						["Guid"] = v_u_204[p_u_931 .. "DeviceGuids"][p949]
					}
					local v951 = v_u_204[p_u_931 .. "DeviceInfo"].Name
					local v952 = v_u_204[p_u_931 .. "DeviceInfo"].Guid
					if v_u_204.VoiceChatOptionsEnabled then
						v_u_121:SwitchDevice(p_u_931, v951, v952)
					else
						v_u_11:SetOutputDevice(v951, v952)
						v_u_127:info("[SwitchOutputDevice] Setting SS Speaker Device To {} {}", v951, v952)
					end
					if v_u_36() then
						v_u_127:debug("[GameSettings] Changing {} device to {} {} ", p_u_931, v951, v952)
						if p_u_931 == "Input" then
							v_u_123:changeInputDevice(v951, v952)
						else
							v_u_123:changeOutputDevice(v951, v952)
						end
					end
					v_u_159(p_u_931, v_u_204[p_u_931 .. "PrevDeviceName"], v951)
					v_u_204[p_u_931 .. "PrevDeviceName"] = v951
				end
			end
		end)
	end
	local function v964() -- name: createChatModerationOptions
		-- upvalues: (copy) v_u_204, (ref) v_u_103, (ref) v_u_24, (ref) v_u_88, (ref) v_u_4, (ref) v_u_115, (ref) v_u_159
		local v954 = v_u_204
		local v955 = v_u_204
		local v956, v957, v958 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyView"), "Selector", { v_u_24:Format("InGame.CommonUI.Label.Off"), v_u_24:Format("InGame.CommonUI.Label.On") }, 1, nil, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.ReadOnlyViewDescription"))
		v954.ChatModerationFrame = v956
		_ = v957
		v955.ChatModerationSelector = v958
		v_u_204.ChatModerationFrame.LayoutOrder = v_u_88.ChatModerationFrame
		v_u_204.ChatModerationFrame.Visible = false
		local v_u_959 = require(v_u_4.Workspace.Packages.ExpChat).Stores.GetChatModerationStore(false)
		v_u_204.ChatModerationDisposeEffect = v_u_115.createEffect(function(p960)
			-- upvalues: (ref) v_u_204, (copy) v_u_959
			v_u_204.ChatModerationFrame.Visible = v_u_959.getIsSettingVisible(p960)
			local v961 = v_u_959.getIsSettingEnabled(p960) and 2 or 1
			if v_u_204.ChatModerationSelector:GetSelectedIndex() ~= v961 then
				v_u_204.ChatModerationSelector:SetSelectionIndex(v961)
			end
		end)
		v_u_204.ChatModerationSelector.IndexChanged:connect(function(p962)
			-- upvalues: (copy) v_u_959, (ref) v_u_159
			local v963 = p962 == 2
			v_u_959.setIsSettingEnabled(v963)
			v_u_159("moderate_chat", not v963, v963)
		end)
		v_u_959.initialize()
	end
	local function v987() -- name: createAIRephraseSettingOptions
		-- upvalues: (ref) v_u_73, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_4, (ref) v_u_40, (ref) v_u_115, (ref) v_u_18, (ref) v_u_159, (ref) v_u_151, (ref) v_u_111
		local v965 = v_u_73:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessages")
		local v966 = v_u_73:FormatByKey("CoreScripts.InGameMenu.GameSettings.AIRephraseMessagesDescription")
		local v967 = v_u_73:FormatByKey("InGame.CommonUI.Label.On")
		local v968 = v_u_204
		local v969 = v_u_204
		local v970, v971, v972 = v_u_103:AddNewRow(v_u_204, v965, "Selector", { v_u_73:FormatByKey("InGame.CommonUI.Label.Off"), v967 }, 1, nil, v966)
		v968.AIRephraseFrame = v970
		_ = v971
		v969.AIRephraseSelector = v972
		v_u_204.AIRephraseFrame.LayoutOrder = v_u_88.AIRephraseFrame
		v_u_204.AIRephraseFrame.Visible = false
		local v_u_973 = require(v_u_4.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getAIRephraseSettingStore(false)
		local v_u_974 = v_u_40()
		local v975 = v_u_974 > 0
		local v_u_976 = v_u_973.getIsSettingEnabled(false) and 2 or 1
		v_u_204.AIRephraseDisposeEffect = v_u_115.createEffect(function(p977)
			-- upvalues: (ref) v_u_204, (copy) v_u_973, (ref) v_u_976
			v_u_204.AIRephraseFrame.Visible = v_u_973.getIsSettingVisible(p977)
			local v978 = v_u_973.getIsSettingEnabled(p977) and 2 or 1
			if v_u_204.AIRephraseSelector:GetSelectedIndex() ~= v978 then
				v_u_976 = v978
				v_u_204.AIRephraseSelector:SetSelectionIndex(v978)
			end
		end)
		local function v981(p_u_979)
			-- upvalues: (ref) v_u_976, (ref) v_u_18, (copy) v_u_973, (ref) v_u_159, (ref) v_u_204
			if p_u_979 ~= v_u_976 then
				local v_u_980 = p_u_979 == 2
				task.spawn(function()
					-- upvalues: (ref) v_u_18, (copy) v_u_980, (ref) v_u_973, (ref) v_u_976, (copy) p_u_979, (ref) v_u_159, (ref) v_u_204
					if v_u_18:OnUserChatSettingUpdateAsync("allowAIRephrase", v_u_980 and "Enabled" or "Disabled") then
						v_u_973.setIsSettingEnabled(v_u_980)
						v_u_976 = p_u_979
						v_u_159("ai_rephrase", not v_u_980, v_u_980)
					else
						v_u_204.AIRephraseSelector:SetSelectionIndex(v_u_976)
					end
				end)
			end
		end
		if v_u_151 then
			if v975 then
				local v_u_982 = nil
				v_u_204.AIRephraseSelector.IndexChanged:connect(function(p_u_983)
					-- upvalues: (ref) v_u_982, (copy) v_u_974, (ref) v_u_976, (ref) v_u_18, (copy) v_u_973, (ref) v_u_159, (ref) v_u_204
					if v_u_982 then
						task.cancel(v_u_982)
					end
					v_u_982 = task.delay(v_u_974, function()
						-- upvalues: (ref) v_u_982, (copy) p_u_983, (ref) v_u_976, (ref) v_u_18, (ref) v_u_973, (ref) v_u_159, (ref) v_u_204
						v_u_982 = nil
						local v_u_984 = p_u_983
						if v_u_984 ~= v_u_976 then
							local v_u_985 = v_u_984 == 2
							task.spawn(function()
								-- upvalues: (ref) v_u_18, (copy) v_u_985, (ref) v_u_973, (ref) v_u_976, (copy) v_u_984, (ref) v_u_159, (ref) v_u_204
								if v_u_18:OnUserChatSettingUpdateAsync("allowAIRephrase", v_u_985 and "Enabled" or "Disabled") then
									v_u_973.setIsSettingEnabled(v_u_985)
									v_u_976 = v_u_984
									v_u_159("ai_rephrase", not v_u_985, v_u_985)
								else
									v_u_204.AIRephraseSelector:SetSelectionIndex(v_u_976)
								end
							end)
						end
					end)
				end)
			else
				v_u_204.AIRephraseSelector.IndexChanged:connect(v981)
			end
		else
			local v986 = v_u_204.AIRephraseSelector.IndexChanged
			if v975 then
				v981 = v_u_111(v_u_974, v981)
			end
			v986:connect(v981)
		end
	end
	local function v1009() -- name: createChatSummariesSettingOptions
		-- upvalues: (ref) v_u_73, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_4, (ref) v_u_41, (ref) v_u_115, (ref) v_u_18, (ref) v_u_159
		local v988 = v_u_73:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummaries")
		local v989 = v_u_73:FormatByKey("CoreScripts.InGameMenu.GameSettings.ChatSummariesDescription")
		local v990 = v_u_73:FormatByKey("InGame.CommonUI.Label.On")
		local v991 = v_u_204
		local v992 = v_u_204
		local v993, v994, v995 = v_u_103:AddNewRow(v_u_204, v988, "Selector", { v_u_73:FormatByKey("InGame.CommonUI.Label.Off"), v990 }, 1, nil, v989)
		v991.ChatSummariesFrame = v993
		_ = v994
		v992.ChatSummariesSelector = v995
		v_u_204.ChatSummariesFrame.LayoutOrder = v_u_88.ChatSummariesFrame
		v_u_204.ChatSummariesFrame.Visible = false
		local v_u_996 = require(v_u_4.Workspace.Packages.ExpChat).Stores.GetUserChatSettingsStore.getChatSummariesSettingStore(false)
		local v_u_997 = v_u_41()
		local v998 = v_u_997 > 0
		local v_u_999 = v_u_996.getIsSettingEnabled(false) and 2 or 1
		v_u_204.ChatSummariesDisposeEffect = v_u_115.createEffect(function(p1000)
			-- upvalues: (ref) v_u_204, (copy) v_u_996, (ref) v_u_999
			v_u_204.ChatSummariesFrame.Visible = v_u_996.getIsSettingVisible(p1000)
			local v1001 = v_u_996.getIsSettingEnabled(p1000) and 2 or 1
			if v_u_204.ChatSummariesSelector:GetSelectedIndex() ~= v1001 then
				v_u_999 = v1001
				v_u_204.ChatSummariesSelector:SetSelectionIndex(v1001)
			end
		end)
		local function v1004(p_u_1002)
			-- upvalues: (ref) v_u_999, (ref) v_u_18, (copy) v_u_996, (ref) v_u_159, (ref) v_u_204
			if p_u_1002 ~= v_u_999 then
				local v_u_1003 = p_u_1002 == 2
				task.spawn(function()
					-- upvalues: (ref) v_u_18, (copy) v_u_1003, (ref) v_u_996, (ref) v_u_999, (copy) p_u_1002, (ref) v_u_159, (ref) v_u_204
					if v_u_18:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", v_u_1003 and "Enabled" or "Disabled") then
						v_u_996.setIsSettingEnabled(v_u_1003)
						v_u_999 = p_u_1002
						v_u_159("chat_summaries", not v_u_1003, v_u_1003)
					else
						v_u_204.ChatSummariesSelector:SetSelectionIndex(v_u_999)
					end
				end)
			end
		end
		if v998 then
			local v_u_1005 = nil
			v_u_204.ChatSummariesSelector.IndexChanged:connect(function(p_u_1006)
				-- upvalues: (ref) v_u_1005, (copy) v_u_997, (ref) v_u_999, (ref) v_u_18, (copy) v_u_996, (ref) v_u_159, (ref) v_u_204
				if v_u_1005 then
					task.cancel(v_u_1005)
				end
				v_u_1005 = task.delay(v_u_997, function()
					-- upvalues: (ref) v_u_1005, (copy) p_u_1006, (ref) v_u_999, (ref) v_u_18, (ref) v_u_996, (ref) v_u_159, (ref) v_u_204
					v_u_1005 = nil
					local v_u_1007 = p_u_1006
					if v_u_1007 ~= v_u_999 then
						local v_u_1008 = v_u_1007 == 2
						task.spawn(function()
							-- upvalues: (ref) v_u_18, (copy) v_u_1008, (ref) v_u_996, (ref) v_u_999, (copy) v_u_1007, (ref) v_u_159, (ref) v_u_204
							if v_u_18:OnUserChatSettingUpdateAsync("AllowThirdPartySummary", v_u_1008 and "Enabled" or "Disabled") then
								v_u_996.setIsSettingEnabled(v_u_1008)
								v_u_999 = v_u_1007
								v_u_159("chat_summaries", not v_u_1008, v_u_1008)
							else
								v_u_204.ChatSummariesSelector:SetSelectionIndex(v_u_999)
							end
						end)
					end
				end)
			end)
		else
			v_u_204.ChatSummariesSelector.IndexChanged:connect(v1004)
		end
	end
	local function v1038() -- name: createVoiceTypingModeSettingOptions
		-- upvalues: (ref) v_u_24, (ref) v_u_127, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_4, (ref) v_u_115, (ref) v_u_159
		local v_u_1010 = { "standard", "continuous" }
		local v1011 = v_u_204
		local v1012 = v_u_204
		local v1013 = v_u_103
		local v1014 = v_u_204
		local v_u_1015 = "CoreScripts.InGameMenu.GameSettings.VoiceTypingMode"
		local function v1016()
			-- upvalues: (ref) v_u_24, (copy) v_u_1015
			return v_u_24:Format(v_u_1015)
		end
		local v1017, v1018 = pcall(v1016)
		if not v1017 then
			v_u_127:debug("[GameSettings] createVoiceTypingModeSettingOptions missing translation for {}", "CoreScripts.InGameMenu.GameSettings.VoiceTypingMode")
			v1018 = "Voice typing mode"
		end
		local v1019 = "Selector"
		local v1020 = {}
		local v_u_1021 = "CoreScripts.InGameMenu.GameSettings.VoiceTypingModeStandard"
		local function v1022()
			-- upvalues: (ref) v_u_24, (copy) v_u_1021
			return v_u_24:Format(v_u_1021)
		end
		local v1023, v1024 = pcall(v1022)
		if not v1023 then
			v_u_127:debug("[GameSettings] createVoiceTypingModeSettingOptions missing translation for {}", "CoreScripts.InGameMenu.GameSettings.VoiceTypingModeStandard")
			v1024 = "Manual Send"
		end
		local v_u_1025 = "CoreScripts.InGameMenu.GameSettings.VoiceTypingModeContinuous"
		local function v1026()
			-- upvalues: (ref) v_u_24, (copy) v_u_1025
			return v_u_24:Format(v_u_1025)
		end
		local v1027, v1028 = pcall(v1026)
		if not v1027 then
			v_u_127:debug("[GameSettings] createVoiceTypingModeSettingOptions missing translation for {}", "CoreScripts.InGameMenu.GameSettings.VoiceTypingModeContinuous")
			v1028 = "Auto Send"
		end
		__set_list(v1020, 1, {v1024, v1028})
		local v1029, v1030, v1031 = v1013:AddNewRow(v1014, v1018, v1019, v1020, 1)
		v1011.VoiceTypingModeFrame = v1029
		_ = v1030
		v1012.VoiceTypingModeSelector = v1031
		v_u_204.VoiceTypingModeFrame.LayoutOrder = v_u_88.VoiceTypingModeFrame
		local v_u_1032 = require(v_u_4.Workspace.Packages.ExpChat).Stores.GetDictationModeSettingStore(false)
		v_u_204.VoiceTypingModeDisposeEffect = v_u_115.createEffect(function(p1033)
			-- upvalues: (copy) v_u_1010, (copy) v_u_1032, (ref) v_u_204
			local v1034 = table.find(v_u_1010, v_u_1032.getMode(p1033)) or 1
			if v_u_204.VoiceTypingModeSelector:GetSelectedIndex() ~= v1034 then
				v_u_204.VoiceTypingModeSelector:SetSelectionIndex(v1034)
			end
		end)
		v_u_204.VoiceTypingModeSelector.IndexChanged:connect(function(p1035)
			-- upvalues: (copy) v_u_1032, (copy) v_u_1010, (ref) v_u_159
			local v1036 = v_u_1032.getMode(false)
			local v1037 = v_u_1010[p1035]
			if v1037 ~= nil and v1037 ~= v1036 then
				v_u_1032.setMode(v1037)
				v_u_159("voice_typing_mode", v1036, v1037)
			end
		end)
	end
	local function v1062() -- name: createChatNotificationsSettingOptions
		-- upvalues: (ref) v_u_4, (ref) v_u_73, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_159
		local v1039 = require(v_u_4.Workspace.Packages.ToastNotification)
		local v_u_1040 = v1039.ToastNotificationSnoozeManager.default
		local v_u_1041 = v1039.NotificationGroups
		local v1042 = v1039.ToastNotificationTypeModule
		local v1043 = v1039.Signals.NotificationSnoozedSignal
		local v_u_1044 = v1042.NotificationTypeEnum
		local v_u_1045 = v1042.SnoozeActionEnum
		local v_u_1046 = {
			["Off"] = 1,
			["On"] = 2
		}
		local v1047 = v_u_73:FormatByKey("Feature.Chat.Label.InGameFriendsChatNotifications")
		local v1048 = v_u_73:FormatByKey("InGame.CommonUI.Label.On")
		local v1049 = v_u_73:FormatByKey("InGame.CommonUI.Label.Off")
		local v_u_1050
		if v_u_1040:isSnoozedNotificationType(v_u_1044.ChatNewMessage) then
			v_u_1050 = v_u_1046.Off
		else
			v_u_1050 = v_u_1046.On
		end
		local v1051 = v_u_204
		local v1052 = v_u_204
		local v1053, v1054, v1055 = v_u_103:AddNewRow(v_u_204, v1047, "Selector", { v1049, v1048 }, v_u_1050)
		v1051.ChatNotificationsFrame = v1053
		_ = v1054
		v1052.ChatNotificationsSelector = v1055
		v_u_204.ChatNotificationsFrame.LayoutOrder = v_u_88.ChatNotificationsFrame
		v_u_204.ChatNotificationsSelector.IndexChanged:connect(function(p1056)
			-- upvalues: (ref) v_u_1050, (copy) v_u_1040, (copy) v_u_1041, (ref) v_u_159
			if p1056 ~= v_u_1050 then
				local v1057 = v_u_1050 == 2
				local v1058 = p1056 == 2
				v_u_1050 = p1056
				if v1058 then
					v_u_1040:unmuteNotification({
						["notificationType"] = nil,
						["context"] = "InGameSettings",
						["notificationType"] = v_u_1041.ChatLandingNotificationsGroup
					})
				else
					v_u_1040:snoozeNotification({
						["notificationType"] = nil,
						["durationMinutes"] = -1,
						["context"] = "InGameSettings",
						["notificationType"] = v_u_1041.ChatLandingNotificationsGroup
					})
				end
				v_u_159("chat_notifications", v1057, v1058)
			end
		end)
		v1043:connect(function(p1059)
			-- upvalues: (copy) v_u_1044, (copy) v_u_1045, (ref) v_u_204, (ref) v_u_1050
			if p1059.notificationType == v_u_1044.ChatNewMessage then
				local v1060 = p1059.actionType == v_u_1045.Mute and 1 or 2
				if v_u_204.ChatNotificationsSelector:GetSelectedIndex() ~= v1060 then
					v_u_1050 = v1060
					v_u_204.ChatNotificationsSelector:SetSelectionIndex(v1060)
				end
			end
		end)
		v_u_204.Displayed.Event:Connect(function()
			-- upvalues: (copy) v_u_1040, (copy) v_u_1044, (copy) v_u_1046, (ref) v_u_204, (ref) v_u_1050
			local v1061
			if v_u_1040:isSnoozedNotificationType(v_u_1044.ChatNewMessage) then
				v1061 = v_u_1046.Off
			else
				v1061 = v_u_1046.On
			end
			if v_u_204.ChatNotificationsSelector:GetSelectedIndex() ~= v1061 then
				v_u_1050 = v1061
				v_u_204.ChatNotificationsSelector:SetSelectionIndex(v1061)
			end
		end)
	end
	local function v_u_1076() -- name: createCameraDeviceOptions
		-- upvalues: (copy) v_u_204, (ref) v_u_126, (ref) v_u_103, (ref) v_u_88, (ref) v_u_127, (ref) v_u_16, (ref) v_u_159
		local v1063 = v_u_204.CameraDeviceIndex or 1
		local v1064 = v_u_204.CameraDeviceNames or {}
		local v1065 = v_u_204.CameraDeviceGuids or {}
		local v1066 = v_u_204
		local v1067 = v_u_204
		local v1068, v1069, v1070 = v_u_103:AddNewRow(v_u_204, v_u_126, "Selector", v1064, v1063)
		v1066.CameraDeviceFrame = v1068
		_ = v1069
		v1067.CameraDeviceSelector = v1070
		v_u_204.CameraDeviceFrame.LayoutOrder = v_u_88.CameraDeviceFrame
		local v1071 = v_u_204
		local v1072 = {}
		local v1073
		if v1063 > 0 then
			v1073 = v1064[v1063] or nil
		else
			v1073 = nil
		end
		v1072.Name = v1073
		v1072.Guid = v1063 > 0 and v1065[v1063] or nil
		v1071.CameraDeviceInfo = v1072
		v_u_204.prevCameraDeviceName = v_u_204.CameraDeviceInfo.Name
		v_u_204.CameraDeviceSelector.IndexChanged:connect(function(p1074)
			-- upvalues: (ref) v_u_204, (ref) v_u_127, (ref) v_u_16, (ref) v_u_159
			if v_u_204.CameraDeviceInfo.Name ~= v_u_204.CameraDeviceNames[p1074] or v_u_204.CameraDeviceInfo.Guid ~= v_u_204.CameraDeviceGuids[p1074] then
				v_u_204.CameraDeviceInfo = {
					["Name"] = v_u_204.CameraDeviceNames[p1074],
					["Guid"] = v_u_204.CameraDeviceGuids[p1074]
				}
				local v1075 = v_u_204.CameraDeviceInfo.Guid
				v_u_127:info("Changed webcam to: {}", v1075)
				v_u_16.DefaultCameraID = v1075
				v_u_159("video_camera", v_u_204.prevCameraDeviceName or "None", v_u_204.CameraDeviceInfo.Name)
				v_u_204.prevCameraDeviceName = v_u_204.CameraDeviceInfo.Name
			end
		end)
	end
	local function v_u_1084(p_u_1077) -- name: updateAudioDevices
		-- upvalues: (ref) v_u_11, (ref) v_u_24, (copy) v_u_204, (ref) v_u_134, (ref) v_u_127, (copy) v_u_953
		local function v1078()
			-- upvalues: (copy) p_u_1077, (ref) v_u_11
			if p_u_1077 == "Input" then
				return v_u_11:GetInputDevices()
			else
				return v_u_11:GetOutputDevices()
			end
		end
		local v1079, v1080, v1081, v1082 = pcall(v1078)
		if v1079 then
			local v1083
			if v1080 then
				if v1081 then
					if v1082 then
						if #v1080 > 0 and (v1082 > 0 and v1082 <= #v1080) then
							v1083 = #v1080 == #v1081
						else
							v1083 = false
						end
					else
						v1083 = v1082
					end
				else
					v1083 = v1081
				end
			else
				v1083 = v1080
			end
			if v1083 then
				if v1081[1] == "" then
					v1080[1] = v_u_24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v1080[1] .. ")"
				end
				v_u_204[p_u_1077 .. "DeviceNames"] = v1080
				v_u_204[p_u_1077 .. "DeviceGuids"] = v1081
				v_u_204[p_u_1077 .. "DeviceIndex"] = v1082
				if v_u_204[p_u_1077 .. "DeviceSelector"] then
					v_u_204[p_u_1077 .. "DeviceSelector"]:UpdateOptions(v1080)
					v_u_204[p_u_1077 .. "DeviceSelector"]:SetSelectionIndex(v1082)
				else
					v_u_953(p_u_1077)
				end
			else
				if v_u_134() then
					v_u_127:warning("Errors in get {} device info", p_u_1077)
				end
				v_u_204[p_u_1077 .. "DeviceNames"] = {}
				v_u_204[p_u_1077 .. "DeviceGuids"] = {}
				v_u_204[p_u_1077 .. "DeviceIndex"] = 0
				if v_u_204[p_u_1077 .. "DeviceSelector"] then
					v_u_204[p_u_1077 .. "DeviceSelector"]:UpdateOptions(v1080)
					v_u_204[p_u_1077 .. "DeviceSelector"]:SetSelectionIndex(v1082)
				else
					v_u_953(p_u_1077)
				end
			end
		else
			if v_u_134() then
				v_u_127:warning("Errors in get {} device info", p_u_1077)
			end
			v_u_204[p_u_1077 .. "DeviceNames"] = {}
			v_u_204[p_u_1077 .. "DeviceGuids"] = {}
			v_u_204[p_u_1077 .. "DeviceIndex"] = 0
			if v_u_204[p_u_1077 .. "DeviceSelector"] then
				v_u_204[p_u_1077 .. "DeviceSelector"]:UpdateOptions(v1080)
				v_u_204[p_u_1077 .. "DeviceSelector"]:SetSelectionIndex(v1082)
			else
				v_u_953(p_u_1077)
			end
		end
	end
	local function v_u_1092(p_u_1085) -- name: updateVoiceChatDevices
		-- upvalues: (ref) v_u_134, (ref) v_u_127, (ref) v_u_11, (ref) v_u_24, (copy) v_u_204, (copy) v_u_953
		if p_u_1085 ~= "Input" and (p_u_1085 ~= "Output" and v_u_134()) then
			v_u_127:warning("{} is not supported in VoiceChat devices", p_u_1085)
		end
		local function v1086()
			-- upvalues: (copy) p_u_1085, (ref) v_u_11
			if p_u_1085 == "Input" then
				return v_u_11:GetInputDevices()
			else
				return v_u_11:GetOutputDevices()
			end
		end
		local v1087, v1088, v1089, v1090 = pcall(v1086)
		if v1087 then
			local v1091
			if v1088 then
				if v1089 then
					if v1090 then
						if #v1088 > 0 and (v1090 > 0 and v1090 <= #v1088) then
							v1091 = #v1088 == #v1089
						else
							v1091 = false
						end
					else
						v1091 = v1090
					end
				else
					v1091 = v1089
				end
			else
				v1091 = v1088
			end
			if v1091 then
				if v1089[1] == "" then
					v1088[1] = v_u_24:Format("CoreScripts.InGameMenu.GameSettings.Default") .. " (" .. v1088[1] .. ")"
				end
				v_u_204[p_u_1085 .. "DeviceNames"] = v1088
				v_u_204[p_u_1085 .. "DeviceGuids"] = v1089
				v_u_204[p_u_1085 .. "DeviceIndex"] = v1090
				if v_u_204[p_u_1085 .. "DeviceSelector"] then
					v_u_204[p_u_1085 .. "DeviceSelector"]:UpdateOptions(v1088)
					v_u_204[p_u_1085 .. "DeviceSelector"]:SetSelectionIndex(v1090)
				else
					v_u_953(p_u_1085)
				end
				if v_u_204[p_u_1085 .. "DeviceFrame"] then
					if #v1088 > 0 then
						v_u_204[p_u_1085 .. "DeviceFrame"].Visible = true
						return
					end
					v_u_204[p_u_1085 .. "DeviceFrame"].Visible = false
				end
			else
				if v_u_134() then
					if #v1088 > 0 then
						v_u_127:warning("Errors in get {} device info success: {}", p_u_1085, v1087)
					else
						v_u_127:warning("Empty deviceNames list for {}", p_u_1085)
					end
				end
				v_u_204[p_u_1085 .. "DeviceNames"] = {}
				v_u_204[p_u_1085 .. "DeviceGuids"] = {}
				v_u_204[p_u_1085 .. "DeviceIndex"] = 0
				if v_u_204[p_u_1085 .. "DeviceSelector"] then
					v_u_204[p_u_1085 .. "DeviceSelector"]:UpdateOptions(v1088)
					v_u_204[p_u_1085 .. "DeviceSelector"]:SetSelectionIndex(v1090)
				else
					v_u_953(p_u_1085)
				end
				if v_u_204[p_u_1085 .. "DeviceFrame"] then
					if #v1088 > 0 then
						v_u_204[p_u_1085 .. "DeviceFrame"].Visible = true
						return
					end
					v_u_204[p_u_1085 .. "DeviceFrame"].Visible = false
				end
			end
		else
			if v_u_134() then
				if #v1088 > 0 then
					v_u_127:warning("Errors in get {} device info success: {}", p_u_1085, v1087)
				else
					v_u_127:warning("Empty deviceNames list for {}", p_u_1085)
				end
			end
			v_u_204[p_u_1085 .. "DeviceNames"] = {}
			v_u_204[p_u_1085 .. "DeviceGuids"] = {}
			v_u_204[p_u_1085 .. "DeviceIndex"] = 0
			if v_u_204[p_u_1085 .. "DeviceSelector"] then
				v_u_204[p_u_1085 .. "DeviceSelector"]:UpdateOptions(v1088)
				v_u_204[p_u_1085 .. "DeviceSelector"]:SetSelectionIndex(v1090)
			else
				v_u_953(p_u_1085)
			end
			if v_u_204[p_u_1085 .. "DeviceFrame"] then
				if #v1088 > 0 then
					v_u_204[p_u_1085 .. "DeviceFrame"].Visible = true
					return
				end
				v_u_204[p_u_1085 .. "DeviceFrame"].Visible = false
			end
			return
		end
	end
	local function v_u_1100() -- name: updateCameraDevices
		-- upvalues: (ref) v_u_15, (ref) v_u_125, (ref) v_u_16, (copy) v_u_204, (copy) v_u_1076
		local v1093 = v_u_15:GetCameraDevices()
		local v1094 = {}
		local v1095 = {}
		local v1096 = v_u_125
		table.insert(v1094, v1096)
		table.insert(v1095, "{DefaultDeviceGuid}")
		local v1097 = 1
		for v1098, v1099 in pairs(v1093) do
			if v1098 == v_u_16.DefaultCameraID then
				v1097 = #v1094 + 1
			end
			table.insert(v1094, v1099)
			table.insert(v1095, v1098)
		end
		v_u_204.CameraDeviceNames = v1094
		v_u_204.CameraDeviceGuids = v1095
		v_u_204.CameraDeviceIndex = 0
		if v_u_204.CameraDeviceSelector then
			v_u_204.CameraDeviceSelector:UpdateOptions(v1094)
		else
			v_u_1076()
		end
		v_u_204.CameraDeviceSelector:SetSelectionIndex(v1097)
	end
	local v1101 = nil
	local v_u_1102 = nil
	local function v_u_1103() -- name: updateAudioOptions
		-- upvalues: (copy) v_u_204, (copy) v_u_1092, (ref) v_u_36, (ref) v_u_123, (copy) v_u_1084
		if v_u_204.VoiceChatOptionsEnabled then
			v_u_1092("Input")
			v_u_1092("Output")
		else
			if v_u_36() and v_u_123:getIsConnected() then
				v_u_1084("Input")
			end
			v_u_1084("Output")
		end
	end
	local v_u_1104 = nil
	local v_u_1105 = nil
	local v_u_1106 = nil
	local function v_u_1114() -- name: setupUIScaleViewportChangedListener
		-- upvalues: (ref) v_u_99, (ref) v_u_100, (ref) v_u_1104, (ref) v_u_7, (copy) v_u_204, (copy) v_u_378, (ref) v_u_1105, (copy) v_u_371, (ref) v_u_1106
		if v_u_99 then
			if v_u_100 and not v_u_1104 then
				local v_u_1107 = 0
				v_u_1104 = v_u_7.Heartbeat:Connect(function(p1108)
					-- upvalues: (ref) v_u_1107, (ref) v_u_204, (ref) v_u_378
					v_u_1107 = v_u_1107 + p1108
					if v_u_1107 >= 0.1 and v_u_204.PageOpen then
						v_u_1107 = 0
						v_u_378()
					end
				end)
			end
			local function v1113() -- name: rebindToCurrentCamera
				-- upvalues: (ref) v_u_1105, (ref) v_u_204, (ref) v_u_100, (ref) v_u_378, (ref) v_u_371
				if v_u_1105 then
					v_u_1105:Disconnect()
					v_u_1105 = nil
				end
				local v1109 = workspace.CurrentCamera
				if v1109 then
					v_u_1105 = v1109:GetPropertyChangedSignal("ViewportSize"):Connect(function()
						-- upvalues: (ref) v_u_204, (ref) v_u_100, (ref) v_u_378, (ref) v_u_371
						if v_u_204.PageOpen then
							if v_u_100 then
								v_u_378()
								return
							end
							local v1110 = v_u_371
							local v1111, v1112 = pcall(v1110)
							if not v1111 then
								warn("createUIScaleOptions failed: " .. tostring(v1112))
							end
						end
					end)
				end
			end
			v1113()
			v_u_1106 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v1113)
		end
	end
	local v_u_1115 = false
	local v_u_1116
	if v_u_56 then
		v_u_1116 = false
	else
		v_u_1116 = nil
	end
	local function v_u_1146() -- name: createVoiceChatSelector
		-- upvalues: (ref) v_u_54, (copy) v_u_204, (ref) v_u_24, (ref) v_u_121, (ref) v_u_103, (ref) v_u_88, (ref) v_u_56, (ref) v_u_39, (ref) v_u_1116, (ref) v_u_63, (ref) v_u_135, (ref) v_u_65, (ref) v_u_1115, (ref) v_u_66, (ref) v_u_113, (ref) v_u_111, (ref) v_u_51, (ref) v_u_3, (ref) v_u_64, (ref) v_u_57
		if not (v_u_54 and (v_u_204.VoiceConnectDisconnectFrame and v_u_204.VoiceConnectDisconnectSelector)) then
			local v_u_1117 = v_u_24:Format("Feature.GameDetails.Label.VoiceChat")
			local v1118 = v_u_24:Format("Feature.SettingsHub.Label.Disconnected")
			local v1119 = v_u_24:Format("Feature.SettingsHub.Label.Connected")
			local v1120 = v_u_121:VoiceChatEnded() and 1 or 2
			local v1121 = v_u_204
			local v1122 = v_u_204
			local v1123, v1124, v1125 = v_u_103:AddNewRow(v_u_204, v_u_1117, "Selector", { v1118, v1119 }, v1120)
			v1121.VoiceConnectDisconnectFrame = v1123
			_ = v1124
			v1122.VoiceConnectDisconnectSelector = v1125
			v_u_204.VoiceConnectDisconnectFrame.LayoutOrder = v_u_88.VoiceConnectDisconnectSelector
			local v1126 = v_u_121:getService()
			if v1126 and not v_u_56 then
				v1126.StateChanged:Connect(function(p1127, p1128)
					-- upvalues: (ref) v_u_54, (ref) v_u_204, (ref) v_u_121
					if v_u_54 then
						if p1127 == p1128 then
							return
						end
						if p1128 == Enum.VoiceChatState.Joined and v_u_204.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
							v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
							return
						end
						if (p1128 == Enum.VoiceChatState.Ended or (p1128 == Enum.VoiceChatState.Failed or p1128 == Enum.VoiceChatState.Idle)) and v_u_204.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
							v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
							return
						end
					else
						if p1127 == p1128 then
							return
						end
						if p1128 == Enum.VoiceChatState.Joined then
							v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
							return
						end
						if v_u_121:VoiceChatEnded() then
							v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
						end
					end
				end)
			end
			local v_u_1129 = v1120
			local v1130 = v_u_39()
			local v1131 = v1130 > 0
			local function v_u_1139(p_u_1132)
				-- upvalues: (ref) v_u_1129, (ref) v_u_56, (ref) v_u_1116, (ref) v_u_63, (ref) v_u_121, (ref) v_u_135, (ref) v_u_65, (ref) v_u_1115, (ref) v_u_204
				if p_u_1132 == v_u_1129 then
					return
				else
					v_u_1129 = p_u_1132
					if not (v_u_56 and v_u_1116) then
						if v_u_63 then
							local v1133, v1134, v1135, v1136 = v_u_121:GetConnectDisconnectButtonAnalyticsData(p_u_1132 == 2)
							v_u_121.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", v1133, v1134, v1135, v1136, v_u_121.joinVoiceButtonContext)
						else
							v_u_121.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", v_u_121:GetConnectDisconnectButtonAnalyticsData(p_u_1132 == 2))
						end
						if p_u_1132 == 2 then
							v_u_121.pendingConnectionSource = v_u_135.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
							v_u_121:JoinVoice()
						elseif v_u_65 then
							local v1137 = v_u_121:getService()
							local v1138
							if v1137 == nil then
								v1138 = false
							else
								v1138 = v1137.VoiceChatState == Enum.VoiceChatState.Failed
							end
							if not (v_u_121:VoiceChatEnded() or v1138) then
								v_u_121.pendingDisconnectReason = v_u_135.VOICE_DISCONNECT_REASON.USER_DISCONNECT
								v_u_121:Leave()
							end
						elseif not v_u_121:VoiceChatEnded() then
							v_u_121.pendingDisconnectReason = v_u_135.VOICE_DISCONNECT_REASON.USER_DISCONNECT
							v_u_121:Leave()
						end
						if v_u_1115 then
							task.spawn(function()
								-- upvalues: (copy) p_u_1132, (ref) v_u_204
								task.wait(0.5)
								if p_u_1132 ~= 1 then
									v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
								end
							end)
						end
					end
				end
			end
			if v_u_66 then
				local v_u_1140
				if v1131 then
					v_u_1140 = v_u_113(v_u_1139, v1130)
				else
					v_u_1140 = v_u_1139
				end
				v_u_204.VoiceConnectDisconnectSelector.IndexChanged:connect(function(p1141)
					-- upvalues: (ref) v_u_56, (ref) v_u_1116, (copy) v_u_1139, (copy) v_u_1140
					if v_u_56 and v_u_1116 then
						v_u_1139(p1141)
					else
						v_u_1140(p1141)
					end
				end)
			else
				local v1142 = v_u_204.VoiceConnectDisconnectSelector.IndexChanged
				if v1131 then
					v_u_1139 = v_u_111(v1130, v_u_1139)
				end
				v1142:connect(v_u_1139)
			end
			if v_u_51 then
				v_u_204.VoiceConnectDisconnectFrame.SelectionChanged:Connect(function(_, p1143, p1144)
					-- upvalues: (copy) v_u_1117, (ref) v_u_204, (ref) v_u_3
					if p1144 and (p1143 and (p1143.Parent and (p1143.Parent.Name == v_u_1117 .. "Frame" and (p1144.Name == "ImageButton" and v_u_204.Active)))) then
						v_u_3.SelectedCoreObject = p1143
					end
				end)
			end
			v_u_121:subscribe("OnStateChanged", function(_, p1145)
				-- upvalues: (ref) v_u_56, (ref) v_u_1116, (ref) v_u_64, (ref) v_u_204, (ref) v_u_66, (ref) v_u_57
				if v_u_56 then
					v_u_1116 = true
					if v_u_64 then
						if p1145 == Enum.VoiceChatState.Joined and v_u_204.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
							v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						end
					elseif p1145 == Enum.VoiceChatState.Joined then
						v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
					end
				end
				if v_u_64 then
					if p1145 == Enum.VoiceChatState.Failed and v_u_204.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
						v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					end
				elseif p1145 == Enum.VoiceChatState.Failed then
					v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
				if v_u_66 and (v_u_56 and (p1145 == Enum.VoiceChatState.Ended or p1145 == Enum.VoiceChatState.Idle)) and v_u_204.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 1 then
					v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
				end
				if v_u_56 then
					if v_u_57 then
						task.defer(function()
							-- upvalues: (ref) v_u_1116
							v_u_1116 = false
						end)
						return
					end
					v_u_1116 = false
				end
			end)
			v_u_121:subscribe("OnRequestMicPermissionRejected", function()
				-- upvalues: (ref) v_u_1115, (ref) v_u_56, (ref) v_u_1116, (ref) v_u_204, (ref) v_u_57
				task.spawn(function()
					-- upvalues: (ref) v_u_1115, (ref) v_u_56, (ref) v_u_1116, (ref) v_u_204, (ref) v_u_57
					task.wait(0.5)
					v_u_1115 = true
					if v_u_56 then
						v_u_1116 = true
					end
					v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(1)
					if v_u_56 then
						if v_u_57 then
							task.defer(function()
								-- upvalues: (ref) v_u_1116
								v_u_1116 = false
							end)
							return
						end
						v_u_1116 = false
					end
				end)
			end)
		end
	end
	local function v1191() -- name: createVRComfortSettingOptions
		-- upvalues: (ref) v_u_24, (ref) v_u_14, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88
		local v_u_1147 = Enum.VRComfortSetting:GetEnumItems()
		local v1148 = {
			["title"] = "CoreScripts.InGameMenu.PageTitle.VRComfortSettings",
			["description"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription",
			["Enum.VRComfortSetting.Comfort"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingComfort",
			["Enum.VRComfortSetting.Normal"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingNormal",
			["Enum.VRComfortSetting.Expert"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingExpert",
			["Enum.VRComfortSetting.Custom"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingCustom",
			["vignetteEnabled"] = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
			["steppedRotationEnabled"] = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled",
			["thirdPersonFixedCamEnabled"] = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled",
			["on"] = "InGame.CommonUI.Label.On",
			["off"] = "InGame.CommonUI.Label.Off"
		}
		local v1149 = {}
		for v1150, v1151 in ipairs(v_u_1147) do
			v1149[v1150] = v_u_24:Format(v1148[tostring(v1151)])
		end
		local v1152 = table.find(v_u_1147, v_u_14.VRComfortSetting)
		local v1153 = v_u_204
		local v1154 = v_u_204
		local v1155 = v_u_204
		local v1156, v1157, v1158 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.PageTitle.VRComfortSettings"), "Selector", v1149, v1152, nil, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription"))
		v1153.VRComfortSettingFrame = v1156
		v1154.VRComfortSettingLabel = v1157
		v1155.VRComfortSettingSelector = v1158
		v_u_204.VRComfortSettingFrame.LayoutOrder = v_u_88.VRComfortSettingFrame
		local v1159 = v_u_14.VignetteEnabled and 1 or 2
		local v1160 = v_u_204
		local v1161 = v_u_204
		local v1162 = v_u_204
		local v1163, v1164, v1165 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.VignetteEnabled"), "Selector", { v_u_24:Format("InGame.CommonUI.Label.On"), v_u_24:Format("InGame.CommonUI.Label.Off") }, v1159)
		v1160.VRVignetteEnabledFrame = v1163
		v1161.VRVignetteEnabledLabel = v1164
		v1162.VRVignetteEnabledSelector = v1165
		v_u_204.VRVignetteEnabledFrame.LayoutOrder = v_u_88.VRVignetteEnabledFrame
		local v1166 = v_u_14.VRSmoothRotationEnabled and 2 or 1
		local v1167 = v_u_204
		local v1168 = v_u_204
		local v1169 = v_u_204
		local v1170, v1171, v1172 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled"), "Selector", { v_u_24:Format("InGame.CommonUI.Label.On"), v_u_24:Format("InGame.CommonUI.Label.Off") }, v1166)
		v1167.VRSteppedRotationEnabledFrame = v1170
		v1168.VRSteppedRotationEnabledLabel = v1171
		v1169.VRSteppedRotationEnabledSelector = v1172
		v_u_204.VRSteppedRotationEnabledFrame.LayoutOrder = v_u_88.VRSteppedRotationEnabledFrame
		local v1173 = v_u_14.VRThirdPersonFollowCamEnabled and 2 or 1
		local v1174 = v_u_204
		local v1175 = v_u_204
		local v1176 = v_u_204
		local v1177, v1178, v1179 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled"), "Selector", { v_u_24:Format("InGame.CommonUI.Label.On"), v_u_24:Format("InGame.CommonUI.Label.Off") }, v1173)
		v1174.VRThirdPersonFixedCamEnabledFrame = v1177
		v1175.VRThirdPersonFixedCamEnabledLabel = v1178
		v1176.VRThirdPersonFixedCamEnabledSelector = v1179
		v_u_204.VRThirdPersonFixedCamEnabledFrame.LayoutOrder = v_u_88.VRThirdPersonFixedCamEnabledFrame
		local function v_u_1181(p1180)
			-- upvalues: (ref) v_u_204
			if p1180 == Enum.VRComfortSetting.Custom then
				v_u_204.VRVignetteEnabledSelector:SetZIndex(2)
				v_u_204.VRVignetteEnabledLabel.ZIndex = 2
				v_u_204.VRVignetteEnabledSelector:SetInteractable(true)
				v_u_204.VRSteppedRotationEnabledSelector:SetZIndex(2)
				v_u_204.VRSteppedRotationEnabledLabel.ZIndex = 2
				v_u_204.VRSteppedRotationEnabledSelector:SetInteractable(true)
				v_u_204.VRThirdPersonFixedCamEnabledSelector:SetZIndex(2)
				v_u_204.VRThirdPersonFixedCamEnabledLabel.ZIndex = 2
				v_u_204.VRThirdPersonFixedCamEnabledSelector:SetInteractable(true)
			else
				v_u_204.VRVignetteEnabledSelector:SetZIndex(1)
				v_u_204.VRVignetteEnabledLabel.ZIndex = 1
				v_u_204.VRVignetteEnabledSelector:SetInteractable(false)
				v_u_204.VRSteppedRotationEnabledSelector:SetZIndex(1)
				v_u_204.VRSteppedRotationEnabledLabel.ZIndex = 1
				v_u_204.VRSteppedRotationEnabledSelector:SetInteractable(false)
				v_u_204.VRThirdPersonFixedCamEnabledSelector:SetZIndex(1)
				v_u_204.VRThirdPersonFixedCamEnabledLabel.ZIndex = 1
				v_u_204.VRThirdPersonFixedCamEnabledSelector:SetInteractable(false)
			end
		end
		v_u_204.VRComfortSettingSelector.IndexChanged:connect(function(p1182)
			-- upvalues: (copy) v_u_1147, (ref) v_u_14, (copy) v_u_1181
			local v1183 = v_u_1147[p1182]
			v_u_14.VRComfortSetting = v1183
			v_u_1181(v1183)
		end)
		v_u_1181(v_u_14.VRComfortSetting)
		v_u_204.VRVignetteEnabledSelector.IndexChanged:connect(function(p1184)
			-- upvalues: (ref) v_u_14
			if v_u_14.VRComfortSetting == Enum.VRComfortSetting.Custom then
				v_u_14.VignetteEnabledCustomOption = p1184 == 1
			end
		end)
		v_u_204.VRSteppedRotationEnabledSelector.IndexChanged:connect(function(p1185)
			-- upvalues: (ref) v_u_14
			if v_u_14.VRComfortSetting == Enum.VRComfortSetting.Custom then
				v_u_14.VRSmoothRotationEnabledCustomOption = p1185 == 2
			end
		end)
		v_u_204.VRThirdPersonFixedCamEnabledSelector.IndexChanged:connect(function(p1186)
			-- upvalues: (ref) v_u_14
			if v_u_14.VRComfortSetting == Enum.VRComfortSetting.Custom then
				v_u_14.VRThirdPersonFollowCamEnabledCustomOption = p1186 == 2
			end
		end)
		v_u_14:GetPropertyChangedSignal("VRComfortSetting"):Connect(function()
			-- upvalues: (copy) v_u_1147, (ref) v_u_14, (ref) v_u_204
			local v1187 = table.find(v_u_1147, v_u_14.VRComfortSetting)
			if v_u_204.VRComfortSettingSelector:GetSelectedIndex() ~= v1187 then
				v_u_204.VRComfortSettingSelector:SetSelectionIndex(v1187)
			end
		end)
		v_u_14:GetPropertyChangedSignal("VignetteEnabled"):Connect(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_204
			local v1188 = v_u_14.VignetteEnabled and 1 or 2
			if v_u_204.VRVignetteEnabledSelector:GetSelectedIndex() ~= v1188 then
				v_u_204.VRVignetteEnabledSelector:SetSelectionIndex(v1188)
			end
		end)
		v_u_14:GetPropertyChangedSignal("VRSmoothRotationEnabled"):Connect(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_204
			local v1189 = v_u_14.VRSmoothRotationEnabled and 2 or 1
			if v_u_204.VRSteppedRotationEnabledSelector:GetSelectedIndex() ~= v1189 then
				v_u_204.VRSteppedRotationEnabledSelector:SetSelectionIndex(v1189)
			end
		end)
		v_u_14:GetPropertyChangedSignal("VRThirdPersonFollowCamEnabled"):Connect(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_204
			local v1190 = v_u_14.VRThirdPersonFollowCamEnabled and 2 or 1
			if v_u_204.VRThirdPersonFixedCamEnabledSelector:GetSelectedIndex() ~= v1190 then
				v_u_204.VRThirdPersonFixedCamEnabledSelector:SetSelectionIndex(v1190)
			end
		end)
	end
	local function v1206() -- name: createVRSafetyBubbleModeOptions
		-- upvalues: (ref) v_u_24, (ref) v_u_14, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88
		local v_u_1192 = Enum.VRSafetyBubbleMode:GetEnumItems()
		local v1193 = {
			["title"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle",
			["description"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription",
			["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne",
			["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends",
			["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
		}
		local v_u_1194 = {}
		for v1195, v1196 in ipairs(v_u_1192) do
			v_u_1194[v1195] = v_u_24:Format(v1193[tostring(v1196)])
		end
		local v_u_1197 = table.find(v_u_1192, v_u_14.VRSafetyBubbleMode)
		task.defer(function()
			-- upvalues: (ref) v_u_204, (ref) v_u_103, (ref) v_u_24, (copy) v_u_1194, (copy) v_u_1197, (ref) v_u_88, (copy) v_u_1192, (ref) v_u_14
			local v1198 = v_u_204
			local v1199 = v_u_204
			local v1200 = v_u_204
			local v1201, v1202, v1203 = v_u_103:AddNewRow(v_u_204, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle"), "DropDown", v_u_1194, v_u_1197, nil, v_u_24:Format("CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription"))
			v1198.VRSafetyBubbleModeFrame = v1201
			v1199.VRSafetyBubbleModeLabel = v1202
			v1200.VRSafetyBubbleModeSelector = v1203
			v_u_204.VRSafetyBubbleModeFrame.LayoutOrder = v_u_88.VRSafetyBubbleModeFrame
			v_u_204.VRSafetyBubbleModeSelector.IndexChanged:connect(function(p1204)
				-- upvalues: (ref) v_u_1192, (ref) v_u_14
				v_u_14.VRSafetyBubbleMode = v_u_1192[p1204]
			end)
			v_u_14:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function()
				-- upvalues: (ref) v_u_1192, (ref) v_u_14, (ref) v_u_204
				local v1205 = table.find(v_u_1192, v_u_14.VRSafetyBubbleMode)
				if v_u_204.VRSafetyBubbleModeSelector:GetSelectedIndex() ~= v1205 then
					v_u_204.VRSafetyBubbleModeSelector:SetSelectionIndex(v1205)
				end
			end)
		end)
	end
	v_u_204.VoiceChatOptionsEnabled = false
	local v_u_1207 = nil
	if game:GetEngineFeature("VoiceChatSupported") then
		spawn(function()
			-- upvalues: (ref) v_u_49, (ref) v_u_121, (copy) v_u_1146, (ref) v_u_31, (copy) v_u_204, (ref) v_u_32, (ref) v_u_67, (ref) v_u_68, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_122, (ref) v_u_127, (ref) v_u_54, (ref) v_u_136, (ref) v_u_71, (ref) v_u_66, (ref) v_u_56, (ref) v_u_57, (ref) v_u_1116, (ref) v_u_134
			if (not v_u_49 and v_u_121:EligibleForFaeUpsell() or v_u_121:IsSeamlessVoice()) and v_u_121:verifyUniverseAndPlaceCanUseVoice() then
				v_u_1146()
				if v_u_31() and v_u_204.VoiceConnectDisconnectFrame then
					v_u_204.VoiceConnectDisconnectFrame.Visible = false
				end
				v_u_32(function(p1208)
					-- upvalues: (ref) v_u_204
					if p1208 then
						if v_u_204.VoiceConnectDisconnectFrame then
							v_u_204.VoiceConnectDisconnectFrame.Visible = false
							return
						end
					elseif v_u_204.VoiceConnectDisconnectFrame then
						v_u_204.VoiceConnectDisconnectFrame.Visible = true
					end
				end)
			end
			v_u_121:asyncInit():andThen(function()
				-- upvalues: (ref) v_u_121, (ref) v_u_204, (ref) v_u_67, (ref) v_u_68, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_31, (ref) v_u_122, (ref) v_u_127, (ref) v_u_32, (ref) v_u_54, (ref) v_u_1146, (ref) v_u_136, (ref) v_u_71, (ref) v_u_66, (ref) v_u_56, (ref) v_u_57, (ref) v_u_1116
				VoiceChatService = v_u_121:getService()
				if v_u_121:VoiceChatAvailable() then
					v_u_204.VoiceChatOptionsEnabled = true
				end
				if v_u_67 and v_u_204.VoiceChatVolumeFrame then
					local v_u_1209 = nil
					local function v1217()
						-- upvalues: (ref) v_u_121, (ref) v_u_68, (copy) v_u_1209, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_31, (ref) v_u_204, (ref) v_u_122
						local v1210 = game:GetService("VoiceChatService")
						local v1211 = v_u_121:getService()
						if v_u_68 then
							local v1212 = v_u_1209
							if v1212 then
								v1211 = v1212
							elseif v1211 then
								v1211 = v1211.VoiceChatState
							end
						elseif v1211 then
							v1211 = v1211.VoiceChatState
						end
						local v1213 = v1211 == Enum.VoiceChatState.Joined
						if v1210 then
							v1210 = v1210.UseNewAudioApi
						end
						local v1214 = v_u_72 and (v_u_36() and v_u_43())
						if v1214 then
							v1214 = v_u_31()
						end
						local v1215 = v_u_204.VoiceChatVolumeFrame
						local v1216 = v_u_122.isVoiceChatVolumeSliderVisible(v1213, v1210)
						if v1216 then
							v1216 = not v1214
						end
						v1215.Visible = v1216
					end
					local v1218, v1219 = pcall(v1217)
					if not v1218 then
						v_u_127:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", v1219)
					end
					if v_u_72 and (v_u_36() and v_u_43()) then
						v_u_32(function()
							-- upvalues: (ref) v_u_121, (ref) v_u_68, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_31, (ref) v_u_204, (ref) v_u_122, (ref) v_u_127
							local v_u_1220 = nil
							local function v1228()
								-- upvalues: (ref) v_u_121, (ref) v_u_68, (copy) v_u_1220, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_31, (ref) v_u_204, (ref) v_u_122
								local v1221 = game:GetService("VoiceChatService")
								local v1222 = v_u_121:getService()
								if v_u_68 then
									local v1223 = v_u_1220
									if v1223 then
										v1222 = v1223
									elseif v1222 then
										v1222 = v1222.VoiceChatState
									end
								elseif v1222 then
									v1222 = v1222.VoiceChatState
								end
								local v1224 = v1222 == Enum.VoiceChatState.Joined
								if v1221 then
									v1221 = v1221.UseNewAudioApi
								end
								local v1225 = v_u_72 and (v_u_36() and v_u_43())
								if v1225 then
									v1225 = v_u_31()
								end
								local v1226 = v_u_204.VoiceChatVolumeFrame
								local v1227 = v_u_122.isVoiceChatVolumeSliderVisible(v1224, v1221)
								if v1227 then
									v1227 = not v1225
								end
								v1226.Visible = v1227
							end
							local v1229, v1230 = pcall(v1228)
							if not v1229 then
								v_u_127:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", v1230)
							end
						end)
					end
					if v_u_68 then
						v_u_121:subscribe("OnStateChanged", function(_, p_u_1231)
							-- upvalues: (ref) v_u_121, (ref) v_u_68, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_31, (ref) v_u_204, (ref) v_u_122, (ref) v_u_127
							local function v1239()
								-- upvalues: (ref) v_u_121, (ref) v_u_68, (copy) p_u_1231, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_31, (ref) v_u_204, (ref) v_u_122
								local v1232 = game:GetService("VoiceChatService")
								local v1233 = v_u_121:getService()
								if v_u_68 then
									local v1234 = p_u_1231
									if v1234 then
										v1233 = v1234
									elseif v1233 then
										v1233 = v1233.VoiceChatState
									end
								elseif v1233 then
									v1233 = v1233.VoiceChatState
								end
								local v1235 = v1233 == Enum.VoiceChatState.Joined
								if v1232 then
									v1232 = v1232.UseNewAudioApi
								end
								local v1236 = v_u_72 and (v_u_36() and v_u_43())
								if v1236 then
									v1236 = v_u_31()
								end
								local v1237 = v_u_204.VoiceChatVolumeFrame
								local v1238 = v_u_122.isVoiceChatVolumeSliderVisible(v1235, v1232)
								if v1238 then
									v1238 = not v1236
								end
								v1237.Visible = v1238
							end
							local v1240, v1241 = pcall(v1239)
							if not v1240 then
								v_u_127:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", v1241)
							end
						end)
					else
						local v1242 = v_u_121:getService()
						if v1242 then
							v1242.StateChanged:Connect(function()
								-- upvalues: (ref) v_u_121, (ref) v_u_68, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_31, (ref) v_u_204, (ref) v_u_122, (ref) v_u_127
								local v_u_1243 = nil
								local function v1251()
									-- upvalues: (ref) v_u_121, (ref) v_u_68, (copy) v_u_1243, (ref) v_u_72, (ref) v_u_36, (ref) v_u_43, (ref) v_u_31, (ref) v_u_204, (ref) v_u_122
									local v1244 = game:GetService("VoiceChatService")
									local v1245 = v_u_121:getService()
									if v_u_68 then
										local v1246 = v_u_1243
										if v1246 then
											v1245 = v1246
										elseif v1245 then
											v1245 = v1245.VoiceChatState
										end
									elseif v1245 then
										v1245 = v1245.VoiceChatState
									end
									local v1247 = v1245 == Enum.VoiceChatState.Joined
									if v1244 then
										v1244 = v1244.UseNewAudioApi
									end
									local v1248 = v_u_72 and (v_u_36() and v_u_43())
									if v1248 then
										v1248 = v_u_31()
									end
									local v1249 = v_u_204.VoiceChatVolumeFrame
									local v1250 = v_u_122.isVoiceChatVolumeSliderVisible(v1247, v1244)
									if v1250 then
										v1250 = not v1248
									end
									v1249.Visible = v1250
								end
								local v1252, v1253 = pcall(v1251)
								if not v1252 then
									v_u_127:debug("[GameSettings] updateVoiceChatVolumeVisibility ERROR:", v1253)
								end
							end)
						end
					end
				end
				if v_u_54 and (v_u_121:UserVoiceEnabled() and v_u_121:verifyUniverseAndPlaceCanUseVoice()) then
					v_u_1146()
				end
				if not v_u_136() then
					v_u_121:CheckAndShowNotAudiblePrompt()
					local v1254 = v_u_72 and (v_u_36() and v_u_43())
					if v1254 then
						v1254 = v_u_31()
					end
					if v_u_71 and not v1254 then
						v_u_121:ShowNotAudiblePromptVoiceChatVolume()
					end
				end
				if v_u_66 then
					if v_u_204.VoiceConnectDisconnectSelector:GetSelectedIndex() ~= 2 then
						if v_u_56 and v_u_57 then
							v_u_1116 = true
							v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
							task.defer(function()
								-- upvalues: (ref) v_u_1116
								v_u_1116 = false
							end)
						else
							v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						end
					end
				else
					if v_u_56 and v_u_57 then
						v_u_1116 = true
						v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
						task.defer(function()
							-- upvalues: (ref) v_u_1116
							v_u_1116 = false
						end)
						return
					end
					v_u_204.VoiceConnectDisconnectSelector:SetSelectionIndex(2)
				end
			end):catch(function()
				-- upvalues: (ref) v_u_134, (ref) v_u_127, (ref) v_u_136, (ref) v_u_121
				if v_u_134() then
					v_u_127:warning("Failed to init VoiceChatServiceManager")
				end
				if not v_u_136() then
					v_u_121:CheckAndShowPermissionPrompt()
				end
			end)
		end)
	end
	if v_u_36() and not (v_u_21 and v_u_75()) then
		local v_u_1256 = v_u_123.ExperienceJoined.Event:Connect(function()
			-- upvalues: (copy) v_u_204, (ref) v_u_36, (ref) v_u_123, (ref) v_u_82
			local v1255 = not v_u_204.VoiceChatOptionsEnabled and v_u_36()
			if v1255 then
				v1255 = v_u_123:getIsConnected()
			end
			if v_u_204[v_u_82.Input .. "DeviceFrame"] then
				v_u_204[v_u_82.Input .. "DeviceFrame"].Visible = v1255
			end
		end)
		local v_u_1258 = v_u_123.ExperienceLeft.Event:Connect(function()
			-- upvalues: (copy) v_u_204, (ref) v_u_36, (ref) v_u_123, (ref) v_u_82
			local v1257 = not v_u_204.VoiceChatOptionsEnabled and v_u_36()
			if v1257 then
				v1257 = v_u_123:getIsConnected()
			end
			if v_u_204[v_u_82.Input .. "DeviceFrame"] then
				v_u_204[v_u_82.Input .. "DeviceFrame"].Visible = v1257
			end
		end)
		v_u_1207 = function()
			-- upvalues: (ref) v_u_1256, (ref) v_u_1258
			if v_u_1256 then
				v_u_1256:Disconnect()
				v_u_1256 = nil
			end
			if v_u_1258 then
				v_u_1258:Disconnect()
				v_u_1258 = nil
			end
		end
	end
	v_u_204.VideoOptionsEnabled = false
	local v1259 = nil
	local v_u_1260
	if v_u_37() and not (v_u_21 and v_u_75()) then
		local function v1262(p1261)
			-- upvalues: (copy) v_u_204
			v_u_204.VideoOptionsEnabled = p1261.hasCameraPermissions
		end
		if v_u_26() then
			v_u_25(v1262, { v_u_30.Permissions.CAMERA_ACCESS }, true)
			if v1259 then
				v1259:disconnect()
			end
			v1259 = v_u_33:connect(function()
				-- upvalues: (copy) v_u_204, (copy) v_u_1100, (ref) v_u_15, (ref) v_u_1102
				v_u_204.VideoOptionsEnabled = true
				v_u_1100()
				if v_u_15.DevicesChanged then
					v_u_1102 = v_u_15.DevicesChanged:Connect(function()
						-- upvalues: (ref) v_u_204, (ref) v_u_1100
						if v_u_204.PageOpen then
							v_u_1100()
						end
					end)
				end
			end)
			v_u_1260 = v1259
		else
			v_u_1260 = v1259
		end
	else
		v_u_1260 = v1259
	end
	if not v_u_21 then
		v596(v_u_117 and true or false or v_u_5.TouchEnabled or (v_u_5.MouseEnabled or v_u_5.KeyboardEnabled))
	end
	if v_u_5.MouseEnabled then
		v858()
	elseif v_u_5.GamepadEnabled then
		if v_u_14.IsUsingGamepadCameraSensitivity then
			v_u_873()
		else
			local v_u_1263 = nil
			v_u_1263 = v_u_14:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
				-- upvalues: (ref) v_u_14, (ref) v_u_1263, (copy) v_u_873
				if v_u_14.IsUsingGamepadCameraSensitivity then
					if v_u_1263 then
						v_u_1263:disconnect()
					end
					v_u_873()
				end
			end)
		end
	else
		local v_u_1264 = nil
		v_u_1264 = v_u_5.GamepadConnected:connect(function()
			-- upvalues: (ref) v_u_1264, (ref) v_u_14, (copy) v_u_873
			if v_u_1264 then
				v_u_1264:disconnect()
			end
			if v_u_14.IsUsingGamepadCameraSensitivity then
				v_u_873()
			else
				local v_u_1265 = nil
				v_u_1265 = v_u_14:GetPropertyChangedSignal("IsUsingGamepadCameraSensitivity"):connect(function()
					-- upvalues: (ref) v_u_14, (ref) v_u_1265, (ref) v_u_873
					if v_u_14.IsUsingGamepadCameraSensitivity then
						if v_u_1265 then
							v_u_1265:disconnect()
						end
						v_u_873()
					end
				end)
			end
		end)
	end
	if not v_u_21 then
		if v_u_14.IsUsingCameraYInverted then
			v_u_807()
		else
			local v_u_1266 = nil
			v_u_1266 = v_u_14.Changed:connect(function(p1267)
				-- upvalues: (ref) v_u_14, (ref) v_u_1266, (copy) v_u_807
				if p1267 == "IsUsingCameraYInverted" and v_u_14.IsUsingCameraYInverted then
					v_u_1266:disconnect()
					v_u_807()
				end
			end)
		end
	end
	if v_u_21 then
		if v_u_75() then
			v1191()
			v1206()
		else
			v596(v_u_117 and true or false or v_u_5.TouchEnabled or (v_u_5.MouseEnabled or v_u_5.KeyboardEnabled))
			if v_u_14.IsUsingCameraYInverted then
				v_u_807()
			else
				local v_u_1268 = nil
				v_u_1268 = v_u_14.Changed:connect(function(p1269)
					-- upvalues: (ref) v_u_14, (ref) v_u_1268, (copy) v_u_807
					if p1269 == "IsUsingCameraYInverted" and v_u_14.IsUsingCameraYInverted then
						v_u_1268:disconnect()
						v_u_807()
					end
				end)
			end
			v287()
			v315()
		end
	end
	v751()
	if v_u_67 then
		v788()
	end
	if v_u_70 and v_u_67 then
		local v_u_1270 = false
		v_u_204.Displayed.Event:Connect(function()
			-- upvalues: (ref) v_u_1270, (copy) v_u_204, (ref) v_u_121
			v_u_1270 = true
			if v_u_204.VoiceChatVolumeFrame and v_u_204.VoiceChatVolumeFrame.Visible then
				v_u_121:RecordGameSettingsOpened()
			end
		end)
		v_u_204.Hidden.Event:Connect(function()
			-- upvalues: (ref) v_u_1270
			v_u_1270 = false
		end)
		v_u_204.VoiceChatVolumeFrame:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: (copy) v_u_204, (ref) v_u_1270, (ref) v_u_121
			if v_u_204.VoiceChatVolumeFrame.Visible and v_u_1270 then
				v_u_121:RecordGameSettingsOpened()
			end
		end)
	end
	if v_u_74 then
		v765()
	end
	v797()
	v275()
	if v_u_45 and v_u_46() then
		v301()
	end
	if game:GetEngineFeature("InExperiencePlayerChoiceToggle") then
		v_u_149(v_u_204, v_u_88, v_u_159)
	end
	if not v_u_21 then
		v287()
		v315()
	end
	v326()
	if v_u_100 then
		v401()
	elseif v_u_99 then
		local v1271, v1272 = pcall(v_u_371)
		if not v1271 then
			warn("createUIScaleOptions failed: " .. tostring(v1272))
		end
	end
	v416()
	if not v_u_120:IsSubjectToChinaPolicies() then
		v435()
	end
	if v_u_129 then
		v483()
	end
	if v_u_117 and v_u_124().getSupportsOverscan() then
		v886()
	end
	if v_u_45 and v_u_48 then
		spawn(function()
			-- upvalues: (ref) v_u_105, (ref) v_u_118, (ref) v_u_73, (ref) v_u_150, (copy) v_u_204, (ref) v_u_103, (ref) v_u_88, (ref) v_u_14
			local v1273 = v_u_105.IsPlayerInExperienceNameEnabledAsync(v_u_118) and 1 or 2
			local v1274 = v_u_73:FormatByKey("Feature.SettingsHub.Label.Show")
			local v1275 = v_u_73:FormatByKey("Feature.SettingsHub.Label.Hide")
			local v1276
			if v_u_150 then
				v1276 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.MyBadges")
			else
				v1276 = v_u_73:FormatByKey("Feature.SettingsHub.GameSettings.DisplayBadges")
			end
			local v1277 = v_u_204
			local v1278 = v_u_204
			local v1279 = v_u_204
			local v1280, v1281, v1282 = v_u_103:AddNewRow(v_u_204, v1276, "Selector", { v1275, v1274 }, v1273, nil, (v_u_73:FormatByKey("Feature.SettingsHub.Description.PeoplesNames")))
			v1277.badgeVisibleRow = v1280
			v1278.badgeVisibleFrame = v1281
			v1279.badgeVisibleSelector = v1282
			v_u_204.badgeVisibleRow.LayoutOrder = v_u_88.BadgeVisibilityFrame
			v_u_204.badgeVisibleSelector.IndexChanged:connect(function(p1283)
				-- upvalues: (ref) v_u_14, (ref) v_u_105, (ref) v_u_118
				v_u_14.BadgeVisible = p1283 == 2
				v_u_105.SetPlayerInExperienceNameEnabled(v_u_118, p1283 == 1)
			end)
		end)
	end
	if v_u_53 then
		v964()
	end
	if v_u_59 then
		v987()
	end
	if v_u_60 then
		v1009()
	end
	if v_u_61 then
		v1038()
	end
	if v_u_62 then
		v1062()
	end
	v899()
	v_u_106(v_u_7:IsStudio(), v_u_118, v_u_105):andThen(function(p1284)
		-- upvalues: (copy) v_u_924
		if p1284 then
			v_u_924()
		end
	end):catch(function(p1285)
		warn(p1285)
	end)
	v_u_205 = true
	local v_u_1286, v_u_1287, v_u_1288, v_u_1289, v_u_1290, v_u_1291, v_u_1292
	if v_u_10.VREnabled then
		local v1293 = v_u_10.VREnabled
		v_u_1286 = v_u_1106
		v_u_1287 = v_u_328
		v_u_1288 = v_u_1104
		v_u_1289 = v_u_327
		v_u_1290 = v1101
		v_u_1291 = v_u_1105
		v_u_1292 = v_u_1102
		for v1294, _ in pairs(v_u_206) do
			v1294.Visible = not v1293
		end
	else
		v_u_1286 = v_u_1106
		v_u_1287 = v_u_328
		v_u_1288 = v_u_1104
		v_u_1289 = v_u_327
		v_u_1290 = v1101
		v_u_1291 = v_u_1105
		v_u_1292 = v_u_1102
	end
	if v_u_29 then
		v_u_204.MoreSettingsBanner = v_u_29({
			["layoutOrder"] = v_u_88.MoreSettingsBanner,
			["parent"] = v_u_204.Page
		})
	end
	if v_u_22 then
		v_u_204.AudioHeader = v_u_27({
			["headerText"] = "CoreScripts.InGameMenu.GameSettings.AudioHeader",
			["layoutOrder"] = nil,
			["parent"] = nil,
			["layoutOrder"] = v_u_88.AudioHeader,
			["parent"] = v_u_204.Page
		})
		v_u_204.AudioDivider = v_u_28({
			["layoutOrder"] = v_u_88.AudioDivider,
			["parent"] = v_u_204.Page
		})
		v_u_204.DisplayHeader = v_u_27({
			["headerText"] = "CoreScripts.InGameMenu.GameSettings.DisplayHeader",
			["layoutOrder"] = nil,
			["parent"] = nil,
			["layoutOrder"] = v_u_88.DisplayHeader,
			["parent"] = v_u_204.Page
		})
		v_u_204.DisplayDivider = v_u_28({
			["layoutOrder"] = v_u_88.DisplayDivider,
			["parent"] = v_u_204.Page
		})
		if not v_u_75() then
			v_u_204.LanguageHeader = v_u_27({
				["headerText"] = "CoreScripts.InGameMenu.GameSettings.LanguageHeader",
				["layoutOrder"] = nil,
				["parent"] = nil,
				["layoutOrder"] = v_u_88.LanguageHeader,
				["parent"] = v_u_204.Page
			})
			v_u_204.LanguageDivider = v_u_28({
				["layoutOrder"] = v_u_88.LanguageDivider,
				["parent"] = v_u_204.Page
			})
		end
		v_u_204.ViewAndControlsHeader = v_u_27({
			["headerText"] = "CoreScripts.InGameMenu.GameSettings.ViewandControlsHeader",
			["layoutOrder"] = nil,
			["parent"] = nil,
			["layoutOrder"] = v_u_88.ViewAndControlsHeader,
			["parent"] = v_u_204.Page
		})
	end
	v_u_204.TabHeader.Name = "GameSettingsTab"
	local v1295 = v_u_116.uiblox["icons/common/settings"]
	v_u_204.TabHeader.TabLabel.Icon.Text = v1295.name
	v_u_204.TabHeader.TabLabel.Icon.FontFace = v_u_114.Font[v1295.variant]
	v_u_204.TabHeader.TabLabel.Title.Text = "Settings"
	v_u_204.Page.ZIndex = 5
	if v_u_204.PageListLayout then
		v_u_204.PageListLayout.Padding = UDim.new(0, 0)
	end
	v_u_204.PageOpen = false
	if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
		v_u_204.FeedbackEntryPointEnabled = true
	end
	function v_u_204.OpenSettingsPage()
		-- upvalues: (copy) v_u_204, (ref) v_u_21, (ref) v_u_75, (ref) v_u_100, (copy) v_u_378, (ref) v_u_99, (copy) v_u_371, (ref) v_u_147, (ref) v_u_146, (ref) v_u_148, (ref) v_u_88, (ref) v_u_159, (copy) v_u_1103, (ref) v_u_11, (ref) v_u_1290, (copy) v_u_1114, (ref) v_u_14, (ref) v_u_71, (ref) v_u_67, (ref) v_u_37, (copy) v_u_1100, (ref) v_u_15, (ref) v_u_1292, (copy) v_u_930, (ref) v_u_20, (ref) v_u_86, (ref) v_u_107, (ref) v_u_85, (ref) v_u_197, (ref) v_u_44, (ref) v_u_203
		v_u_204.PageOpen = true
		if not (v_u_21 and v_u_75()) then
			if v_u_100 then
				v_u_378()
			elseif v_u_99 then
				local v1296 = v_u_371
				local v1297, v1298 = pcall(v1296)
				if not v1297 then
					warn("createUIScaleOptions failed: " .. tostring(v1298))
				end
			end
			if v_u_147() and (not v_u_204.LanguageSwitcherInitialized and (isLangaugeSelectionDropdownEnabled() and v_u_146())) then
				v_u_204.LanguageSwitcherInitialized = true
				v_u_148(v_u_204, v_u_88, v_u_159)
			end
			v_u_1103()
			if v_u_11.DeviceListChanged then
				v_u_1290 = v_u_11.DeviceListChanged:Connect(function()
					-- upvalues: (ref) v_u_204, (ref) v_u_1103
					if v_u_204.PageOpen then
						v_u_1103()
					end
				end)
			end
			if v_u_99 then
				v_u_1114()
			end
			v_u_204.startVolume = v_u_14.MasterVolume
			if v_u_71 and v_u_67 then
				v_u_204.maxVoiceChatVolumeDuringSession = v_u_14.VoiceChatVolume
			end
			if v_u_37() and (v_u_204.VideoOptionsEnabled and game:GetEngineFeature("VideoCaptureService")) then
				v_u_1100()
				if v_u_15.DevicesChanged then
					v_u_1292 = v_u_15.DevicesChanged:Connect(function()
						-- upvalues: (ref) v_u_204, (ref) v_u_1100
						if v_u_204.PageOpen then
							v_u_1100()
						end
					end)
				end
			end
			v_u_930()
			if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and (v_u_204.toggleFeedbackModeButton and v_u_204.toggleFeedbackModeText) then
				local v1299 = v_u_204
				local v1300
				if v_u_20 == nil then
					v1300 = false
				else
					v1300 = v_u_20:CanEnterCaptureMode()
				end
				v1299.FeedbackEntryPointEnabled = v1300
				if v_u_204.FeedbackEntryPointEnabled then
					v_u_204.toggleFeedbackModeButton.Active = true
					v_u_204.toggleFeedbackModeButton.Enabled.Value = true
					v_u_204.toggleFeedbackModeText.Text = v_u_86
				else
					v_u_204.toggleFeedbackModeButton.Active = false
					v_u_204.toggleFeedbackModeButton.Enabled.Value = false
					v_u_204.toggleFeedbackModeText.TextColor3 = v_u_107.color("ButtonNonInteractable", Color3.fromRGB(100, 100, 100))
					v_u_204.toggleFeedbackModeText.Text = v_u_85
				end
			end
			local v1301 = v_u_204.LastSelectableObjects
			local v1302 = v_u_197(v_u_204)
			table.insert(v1301, v1302)
			if v_u_44 then
				local v1303 = v_u_204.FirstSelectableObjects
				local v1304 = v_u_203
				local v1305 = v_u_204
				table.insert(v1303, v1304(v1305))
				v_u_204.FirstSelectableObjectsUpdated:fire()
			end
		end
	end
	function v_u_204.CloseSettingsPage()
		-- upvalues: (copy) v_u_204, (ref) v_u_21, (ref) v_u_75, (ref) v_u_11, (ref) v_u_1290, (ref) v_u_99, (ref) v_u_1288, (ref) v_u_1291, (ref) v_u_1286, (ref) v_u_1289, (ref) v_u_1287, (ref) v_u_36, (ref) v_u_1207, (ref) v_u_37, (ref) v_u_15, (ref) v_u_1292, (ref) v_u_1260, (ref) v_u_121, (ref) v_u_71, (ref) v_u_67
		v_u_204.PageOpen = false
		if not (v_u_21 and v_u_75()) then
			if v_u_11.DeviceListChanged and v_u_1290 then
				v_u_1290:Disconnect()
			end
			if v_u_99 then
				if v_u_1288 then
					v_u_1288:Disconnect()
					v_u_1288 = nil
				end
				if v_u_1291 then
					v_u_1291:Disconnect()
					v_u_1291 = nil
				end
				if v_u_1286 then
					v_u_1286:Disconnect()
					v_u_1286 = nil
				end
				v_u_1289 = nil
				v_u_1287 = nil
			end
			if v_u_36() and v_u_1207 then
				v_u_1207()
			end
			if v_u_37() then
				if game:GetEngineFeature("VideoCaptureService") and (v_u_15.DevicesChanged and v_u_1292) then
					v_u_1292:Disconnect()
					v_u_1292 = nil
				end
				if v_u_1260 then
					v_u_1260:disconnect()
					v_u_1260 = nil
				end
			end
			if game:GetEngineFeature("VoiceChatSupported") and (v_u_204.VoiceChatOptionsEnabled and (v_u_204.startVolume ~= nil and v_u_204.startVolume > 0)) then
				v_u_121:CheckAndShowNotAudiblePrompt()
			end
			if game:GetEngineFeature("VoiceChatSupported") and (v_u_204.VoiceChatOptionsEnabled and (v_u_71 and (v_u_67 and (v_u_204.maxVoiceChatVolumeDuringSession ~= nil and v_u_204.maxVoiceChatVolumeDuringSession > 0)))) then
				v_u_121:ShowNotAudiblePromptVoiceChatVolume()
			end
		end
	end
	function isLangaugeSelectionDropdownEnabled() -- name: isLangaugeSelectionDropdownEnabled
		-- upvalues: (ref) v_u_118
		if game:GetEngineFeature("EnableSetExperienceSettingsLocaleIdApi") ~= true then
			return false
		end
		if v_u_118.UserId % 1000 + 1 <= game:GetFastInt("V1MenuLanguageSelectionFeaturePerMillageRollout") then
			return true
		end
		for v1306 in game:GetFastString("V1MenuLanguageSelectionFeatureForcedUserIds"):gmatch("%d+") do
			if tonumber(v1306) ~= v_u_118.UserId then
				continue
			end
			return true
		end
		return false
	end
	function v_u_204.SetHub(_, p1307) -- name: SetHub
		-- upvalues: (copy) v_u_204, (ref) v_u_21, (ref) v_u_75, (ref) v_u_146, (ref) v_u_147, (ref) v_u_148, (ref) v_u_88, (ref) v_u_159, (copy) v_u_729, (ref) v_u_90, (ref) v_u_92, (ref) v_u_91, (copy) v_u_735, (ref) v_u_96, (ref) v_u_95, (ref) v_u_14, (ref) v_u_18, (ref) v_u_94, (ref) v_u_97, (ref) v_u_7, (ref) v_u_143, (ref) v_u_117, (copy) v_u_612
		v_u_204.HubRef = p1307
		if not (v_u_21 and v_u_75()) then
			if isLangaugeSelectionDropdownEnabled() then
				if v_u_146() then
					if not v_u_147() then
						v_u_148(v_u_204, v_u_88, v_u_159)
					end
				else
					v_u_729()
				end
			end
			if game:GetEngineFeature("EnableTCSChatTranslation") and v_u_90() then
				if v_u_92() then
					if v_u_735((v_u_91())).ChatTranslationEnabled then
						if v_u_94() then
							v_u_14.ChatTranslationEnabled = true
						end
					elseif v_u_96 then
						if v_u_95() then
							if v_u_14.ChatTranslationLocale == "" then
								v_u_14.ChatTranslationEnabled = false
								v_u_14.ChatTranslationLocale = "en_us"
							end
						else
							v_u_14.ChatTranslationEnabled = false
						end
					else
						local function v1308()
							-- upvalues: (ref) v_u_18
							v_u_18.ChatTranslationEnabled = false
						end
						pcall(v1308)
					end
				end
				v_u_97(v_u_204, v_u_88, v_u_159)
			end
			local v1309
			if v_u_7:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false then
				v1309 = false
			else
				v1309 = not (v_u_143 and v_u_117)
			end
			if v1309 then
				v_u_612()
			end
		end
	end
	return v_u_204
end)()