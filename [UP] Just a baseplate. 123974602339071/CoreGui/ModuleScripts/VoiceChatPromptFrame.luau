-- Path: CoreGui.RobloxGui.Modules.VoiceChatPrompt.Components.VoiceChatPromptFrame
local v_u_1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("RbxAnalyticsService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("GuiService")
local v_u_7 = require(v_u_1.Packages.Roact)
local v8 = require(v_u_1.Packages.t)
local v_u_9 = require(script.Parent.Parent.Parent.VoiceChat.Flags.FFlagVoiceChatBanDurationUseServerTime)
local v_u_10 = require(v_u_1.Packages.Cryo)
local v_u_11 = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local v_u_12 = require(v_u_1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_13 = require(v_u_1.Workspace.Packages.Responsive)
local v_u_14 = v_u_13.useLastInput
local v_u_15 = require(v_u_1.Packages.UIBlox)
local v16 = require(v_u_1.Packages.Foundation)
local v_u_17 = require(v_u_1.Workspace.Packages.Style).GetTextSize
local v_u_18 = v16.Utility.Flags.FoundationFontFaceMigration
local v_u_19 = v_u_15.App.Button.Button
local v_u_20 = v_u_15.App.Button.Enum.ButtonType
local v_u_21 = v_u_15.App.Dialog.Toast
local v_u_22 = v_u_15.App.ImageSet.Images
local v_u_23 = v_u_15.Core.Style.useStyle
local v24 = v_u_15.Style.Validator.validateStyle
local v_u_25 = require(script.Parent.Parent.PromptType)
local v26 = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy)
local v_u_27 = require(script.Parent.VoiceChatConsentModal)
local v_u_28 = require(script.Parent.VoiceChatTooltip)
local v_u_29 = require(script.Parent.DevicePermissionsModal)
local v_u_30 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local v31 = require(v_u_1.Workspace.Packages.VoiceChatCore)
local v_u_32 = v31.Flags
if v_u_32 then
	v_u_32 = v31.Flags.GetFFlagMicConsumerRegistry
end
local v33 = require(v_u_1.Workspace.Packages.VoiceChat).Flags
local v_u_34 = game:GetService("CoreGui")
local v35 = game:GetService("RunService")
local v36 = v_u_34:WaitForChild("RobloxGui")
local v_u_37 = require(v36.Modules.Flags.GetFFlagEnableVoicePromptReasonText)
local v_u_38 = v33.GetFFlagSupportGamepadNavInVoiceModals
local v_u_39 = require(v36.Modules.Flags.GetFIntVoiceToxicityToastDurationSeconds)
local v_u_40 = game:DefineFastFlag("VoiceChatOnlyReportVoiceBans", false)
local v_u_41 = require(v_u_1.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal
local v_u_42 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_43 = require(v36.Modules.Flags.GetFIntVoiceJoinM3ToastDurationSeconds)
local v_u_44 = require(v36.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast)
local v_u_45 = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2)
local v_u_46 = require(script.Parent.Parent.Parent.VoiceChat.Helpers.VoiceNudgeUseNewDACopy)
local v_u_47 = game:DefineFastFlag("VoiceNudgeUseNewConfirmButton", false)
local v48 = require(script.Parent.Parent.Parent.VoiceChat.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local v_u_49 = require(v_u_1.Workspace.Packages.RobloxTranslator)
local v_u_50 = game:GetService("LocalizationService")
local v_u_51 = require(v_u_1.Workspace.Packages.InExperienceLocales).Localization.new(v_u_50.RobloxLocaleId)
local v_u_52 = Color3.fromRGB(255, 255, 255)
local v_u_53 = Color3.fromRGB(220, 220, 220)
local function v58() -- name: getMicPermissionDeniedTitle
	-- upvalues: (copy) v_u_32, (ref) v_u_51
	if not v_u_32() then
		return nil
	end
	local v_u_54 = "Feature.SettingsHub.Prompt.MicPermissionDenied"
	local function v55()
		-- upvalues: (ref) v_u_51, (copy) v_u_54
		return v_u_51:Format(v_u_54)
	end
	local v56, v57 = pcall(v55)
	return not v56 and "Can\'t access microphone" or v57
end
local function v63() -- name: getMicFirstUnmutePrivacyTitle
	-- upvalues: (copy) v_u_32, (ref) v_u_51
	if not v_u_32() then
		return nil
	end
	local v_u_59 = "Feature.SettingsHub.Prompt.MicFirstUnmutePrivacy"
	local function v60()
		-- upvalues: (ref) v_u_51, (copy) v_u_59
		return v_u_51:Format(v_u_59)
	end
	local v61, v62 = pcall(v60)
	return not v61 and "Microphone is active" or v62
end
local function v68() -- name: getMicPermissionDeniedSubtitle
	-- upvalues: (copy) v_u_32, (ref) v_u_51
	if not v_u_32() then
		return nil
	end
	local v_u_64 = "Feature.SettingsHub.Prompt.Subtitle.MicPermissionDenied"
	local function v65()
		-- upvalues: (ref) v_u_51, (copy) v_u_64
		return v_u_51:Format(v_u_64)
	end
	local v66, v67 = pcall(v65)
	return not v66 and "To use your microphone, tap here to update your device settings." or v67
end
local function v73() -- name: getMicFirstUnmutePrivacySubtitle
	-- upvalues: (copy) v_u_32, (ref) v_u_51
	if not v_u_32() then
		return nil
	end
	local v_u_69 = "Feature.SettingsHub.Prompt.Subtitle.MicFirstUnmutePrivacy"
	local function v70()
		-- upvalues: (ref) v_u_51, (copy) v_u_69
		return v_u_51:Format(v_u_69)
	end
	local v71, v72 = pcall(v70)
	return not v71 and "We process and then delete your audio. Tap to view our privacy policy." or v72
end
v_u_7.PureComponent:extend("VoiceChatPromptFrame")
local v_u_74 = {
	[v_u_25.None] = "",
	[v_u_25.NotAudible] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.NotAudible")
}
local v75 = v_u_25.NotAudibleVoiceChatVolume
local v76
if v48 then
	v76 = v_u_51:Format("Feature.SettingsHub.Prompt.NotAudible")
else
	v76 = nil
end
v_u_74[v75] = v76
v_u_74[v_u_25.Permission] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission")
v_u_74[v_u_25.Retry] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission")
v_u_74[v_u_25.Place] = "Exceeds Max Players"
v_u_74[v_u_25.User] = "Not Eligible for Voice"
v_u_74[v_u_25.VoiceChatSuspendedTemporaryAvatarChat] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.MicAndCameraUseSuspended")
v_u_74[v_u_25.VoiceChatSuspendedTemporary] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended")
v_u_74[v_u_25.VoiceChatSuspendedTemporaryB] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended")
v_u_74[v_u_25.VoiceChatSuspendedPermanent] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended")
v_u_74[v_u_25.VoiceLoading] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Connecting")
v_u_74[v_u_25.VoiceToxicityModal] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.RememberRules")
v_u_74[v_u_25.VoiceToxicityToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.RememberRules")
v_u_74[v_u_25.VoiceToxicityFeedbackToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.ThankYouForFeedback")
v_u_74[v_u_25.VoiceChatSuspendedTemporaryToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended")
v_u_74[v_u_25.VoiceConsentDeclinedToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.ChangeYourMind")
v_u_74[v_u_25.VoiceConsentAcceptedToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat")
v_u_74[v_u_25.VoiceConsentModalV1] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat")
v_u_74[v_u_25.VoiceConsentModalV2] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatWithOthers")
v_u_74[v_u_25.VoiceConsentModalV3] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat")
v_u_74[v_u_25.JoinedVoiceToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat")
v_u_74[v_u_25.JoinVoiceSTUX] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat")
v_u_74[v_u_25.LeaveVoice] = v_u_51:Format("Feature.SettingsHub.Prompt.LeaveVoiceChatV2")
v_u_74[v_u_25.JoinVoice] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChatV2")
v_u_74[v_u_25.DevicePermissionsModal] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.NeedMicrophoneAccess")
local v77 = v_u_25.VoiceDataConsentOptOutToast
local v78
if v_u_44() then
	v78 = v_u_51:Format("Feature.SettingsHub.Prompt.Title.ImproveVoiceChat")
else
	v78 = nil
end
v_u_74[v77] = v78
v_u_74[v_u_25.UnifiedJoinVoiceToast] = v_u_51:Format("Feature.SettingsHub.Prompt.JoinedVoiceChatV3")
v_u_74[v_u_25.AgeCheckForVoiceToast] = v_u_51:Format("Feature.SettingsHub.Prompt.Title.AgeCheckForVoiceToast")
v_u_74[v_u_25.UpdateOnAutoJoinToast] = v_u_51:Format("Feature.SettingsHub.Prompt.UpdateToVoiceChat")
local v79 = v_u_25.VoiceChatSuspendedTemporaryBV2
local v80
if v_u_45() then
	v80 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspendedV2")
else
	v80 = nil
end
v_u_74[v79] = v80
local v81 = v_u_25.VoiceToxicityModalV2
local v82
if v_u_45() then
	v82 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.RememberRulesVoiceChat")
else
	v82 = nil
end
v_u_74[v81] = v82
local v83 = v_u_25.VoiceToxicityToastV2
local v84
if v_u_45() then
	v84 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.RememberRulesVoiceChat")
else
	v84 = nil
end
v_u_74[v83] = v84
v_u_74[v_u_25.MicPermissionDenied] = v58
v_u_74[v_u_25.MicFirstUnmutePrivacy] = v63
local v_u_85 = {
	[v_u_25.None] = "",
	[v_u_25.NotAudible] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.NotAudible")
}
local v86 = v_u_25.NotAudibleVoiceChatVolume
local v87
if v48 then
	v87 = v_u_51:Format("Feature.SettingsHub.Prompt.Subtitle.NotAudibleVoiceChatVolume")
else
	v87 = nil
end
v_u_85[v86] = v87
v_u_85[v_u_25.Permission] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicrophonePermission")
v_u_85[v_u_25.Retry] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Retry")
v_u_85[v_u_25.Place] = "Spatial voice is only available for places with Max Players of 30 or less."
v_u_85[v_u_25.User] = "This account is not eligible to use Spatial Voice."
v_u_85[v_u_25.VoiceChatSuspendedTemporary] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Microphone")
v_u_85[v_u_25.VoiceChatSuspendedTemporaryAvatarChat] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicAndCamera")
v_u_85[v_u_25.VoiceChatSuspendedTemporaryB] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1")
v_u_85[v_u_25.VoiceChatSuspendedPermanent] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Revoked")
v_u_85[v_u_25.VoiceLoading] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Connecting")
v_u_85[v_u_25.VoiceToxicityModal] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModal")
v_u_85[v_u_25.VoiceToxicityToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToast")
v_u_85[v_u_25.VoiceToxicityFeedbackToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThanksForLettingUsKnow")
v_u_85[v_u_25.VoiceChatSuspendedTemporaryToast] = function(p88)
	-- upvalues: (copy) v_u_49
	return v_u_49:FormatByKey("Feature.SettingsHub.Description.ChatWithVoiceDisabledUntil", {
		["dateTime"] = p88
	})
end
v_u_85[v_u_25.VoiceConsentDeclinedToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.JoinVoiceLater")
v_u_85[v_u_25.VoiceConsentAcceptedToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MuteAnyoneAnytime")
v_u_85[v_u_25.VoiceConsentModalV1] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell1")
v_u_85[v_u_25.VoiceConsentModalV2] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2")
v_u_85[v_u_25.VoiceConsentModalV3] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2")
v_u_85[v_u_25.JoinedVoiceToast] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMute")
v_u_85[v_u_25.JoinVoiceSTUX] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMuteHere")
v_u_85[v_u_25.DevicePermissionsModal] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess")
local v89 = v_u_25.VoiceDataConsentOptOutToast
local v90
if v_u_44() then
	v90 = v_u_51:Format("Feature.SettingsHub.Prompt.Subtitle.ThanksForVoiceData")
else
	v90 = nil
end
v_u_85[v89] = v90
v_u_85[v_u_25.UnifiedJoinVoiceToast] = v_u_49:FormatByKey("Feature.Captures.Prompt.Subtitle.VoiceChatRecordingTrustedFriendsAgeGroup")
v_u_85[v_u_25.AgeCheckForVoiceToast] = v_u_51:Format("Feature.SettingsHub.Prompt.Subtitle.GoToAccountInfo")
v_u_85[v_u_25.UpdateOnAutoJoinToast] = v_u_51:Format("Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedFriendsUpdate")
local v91 = v_u_25.VoiceChatSuspendedTemporaryBV2
local v92
if v_u_45() then
	v92 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1V2")
else
	v92 = nil
end
v_u_85[v91] = v92
local v93 = v_u_25.VoiceToxicityModalV2
local v94
if v_u_45() then
	v94 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModalV2")
else
	v94 = nil
end
v_u_85[v93] = v94
local v95 = v_u_25.VoiceToxicityToastV2
local v96
if v_u_45() then
	v96 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToastV2")
else
	v96 = nil
end
v_u_85[v95] = v96
v_u_85[v_u_25.MicPermissionDenied] = v68
v_u_85[v_u_25.MicFirstUnmutePrivacy] = v73
if v35:IsStudio() then
	v_u_74[v_u_25.Place] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Place")
	v_u_74[v_u_25.User] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.User")
	v_u_85[v_u_25.Place] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Place")
	v_u_85[v_u_25.User] = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.User")
end
v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Respect")
local v_u_97 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.FutureViolations")
local v_u_98 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.EffectiveUntil")
local v_u_99 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Understand")
local v_u_100 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.GotIt")
local v_u_101 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudge")
local v_u_102 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2")
local v_u_103
if v_u_45() then
	v_u_103 = v_u_49:FormatByKey("Feature.SettingsHub.Action.Ok")
else
	v_u_103 = nil
end
local v_u_104
if v_u_45() then
	v_u_104 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2V2")
else
	v_u_104 = nil
end
local v_u_105
if v_u_45() then
	v_u_105 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudgeV2")
else
	v_u_105 = nil
end
local function v_u_130(p_u_106, p107) -- name: promptSignalCallback
	-- upvalues: (copy) v_u_25, (copy) v_u_45, (copy) v_u_42, (copy) v_u_4, (copy) v_u_74, (copy) v_u_85, (copy) v_u_9, (copy) v_u_50, (copy) v_u_32, (copy) v_u_22, (copy) v_u_1, (copy) v_u_44, (copy) v_u_49, (copy) v_u_98, (copy) v_u_7
	local v108 = p107 ~= v_u_25.VoiceChatSuspendedPermanent and (p107 ~= v_u_25.VoiceChatSuspendedTemporary and (p107 ~= v_u_25.VoiceChatSuspendedTemporaryAvatarChat and p107 ~= v_u_25.VoiceChatSuspendedTemporaryB)) and v_u_45()
	if v108 then
		v108 = p107 == v_u_25.VoiceChatSuspendedTemporaryBV2
	end
	if v108 then
		if p_u_106.props.Analytics then
			p_u_106.props.Analytics:reportBanMessageEvent("Shown")
		end
		if p_u_106.props.VoiceChatServiceManager then
			p_u_106.props.VoiceChatServiceManager:reportBanMessage("Shown")
		end
	end
	if ((p107 == v_u_25.VoiceConsentModalV1 or p107 == v_u_25.VoiceConsentModalV2) and true or p107 == v_u_25.VoiceConsentModalV3) and p_u_106.props.Analytics then
		local v109 = not v_u_42 and "" or v_u_4:GetPlaySessionId()
		p_u_106.props.Analytics:reportInExpConsent("shown", p_u_106.props.VoiceChatServiceManager.inExpUpsellEntrypoint, game.GameId, game.PlaceId, v109)
	end
	if p107 == v_u_25.DevicePermissionsModal and (p_u_106.props.Analytics and p_u_106.props.VoiceChatServiceManager) then
		p_u_106.props.Analytics:reportDevicePermissionsModalEvent("Shown", p_u_106.props.VoiceChatServiceManager:GetSessionId(), p_u_106.props.VoiceChatServiceManager:GetInExpUpsellAnalyticsData())
	end
	if p107 and p107 ~= v_u_25.None then
		local v110 = v_u_74[p107]
		local v111 = v_u_85[p107]
		if ((p107 == v_u_25.JoinVoice or p107 == v_u_25.LeaveVoice) and true or p107 == v_u_25.UnifiedJoinVoiceToast) and (p_u_106.props.VoiceChatServiceManager and p_u_106.props.VoiceChatServiceManager:HasSeamlessVoiceFeature("HideJoinToastSubtitle")) then
			v111 = nil
		end
		local v112 = p_u_106.props.bannedUntil
		if v_u_9 then
			v112 = p_u_106.props.bannedUntil
			if v112 then
				local v113 = p_u_106.props.bannedUntil.absoluteSeconds
				v112 = DateTime.fromUnixTimestamp(v113):FormatLocalTime("l LT", v_u_50.RobloxLocaleId)
			end
		end
		if typeof(v110) == "function" then
			v110 = v110(v112)
		end
		if typeof(v111) == "function" then
			v111 = v111(v112)
		end
		local v114 = nil
		local v115
		if v_u_32() and p107 == v_u_25.MicPermissionDenied then
			v115 = v_u_22["icons/status/alert"]
			v114 = function()
				-- upvalues: (ref) v_u_1
				local v116 = require(v_u_1.Workspace.Packages.LinkingProtocol)
				local v117 = v116.LinkingProtocol.default
				local v118 = v116.Enums.SettingsRoute
				local v119
				if v118 then
					v119 = v118.Microphone
				else
					v119 = nil
				end
				local v120, v121 = v117:supportsSwitchToSettingsApp(v119):await()
				if v120 and v121 then
					v117:switchToSettingsApp(v119):catch(function() end)
				end
			end
		elseif v_u_32() and p107 == v_u_25.MicFirstUnmutePrivacy then
			v115 = v_u_22["icons/controls/microphone"]
			v114 = function()
				-- upvalues: (ref) v_u_1
				require(v_u_1.Workspace.Packages.LinkingProtocol).LinkingProtocol.default:openURL("https://en.help.roblox.com/hc/articles/115004630823"):catch(function() end)
			end
		elseif p107 == v_u_25.UpdateOnAutoJoinToast then
			v115 = v_u_22["icons/controls/microphone"]
		elseif p107 == v_u_25.VoiceConsentDeclinedToast and true or p107 == v_u_25.VoiceConsentAcceptedToast or (p107 == v_u_25.JoinedVoiceToast or p107 == v_u_25.UnifiedJoinVoiceToast) then
			v115 = v_u_22["icons/controls/publicAudioJoin"]
		elseif (p107 == v_u_25.JoinVoice or p107 == v_u_25.LeaveVoice) and true or p107 == v_u_25.UnifiedJoinVoiceToast then
			v115 = v_u_22["icons/actions/info"]
		elseif p107 == v_u_25.VoiceDataConsentOptOutToast and v_u_44() then
			v115 = nil
		else
			v115 = v_u_22["icons/status/alert"]
		end
		local v122 = {
			["showPrompt"] = true,
			["promptType"] = nil,
			["toastContent"] = nil,
			["promptType"] = p107,
			["toastContent"] = {
				["iconImage"] = v115,
				["toastTitle"] = v110,
				["toastSubtitle"] = v111,
				["onActivated"] = v114 or function()
					-- upvalues: (copy) p_u_106
					if p_u_106.props.onPrimaryActivated then
						p_u_106.props.onPrimaryActivated()
					end
				end,
				["onDismissed"] = function() -- name: onDismissed end
			}
		}
		p_u_106:setState(v122)
		local v123 = p107 ~= v_u_25.VoiceChatSuspendedTemporary and (p107 ~= v_u_25.VoiceChatSuspendedTemporaryAvatarChat and (p107 ~= v_u_25.VoiceChatSuspendedTemporaryToast and p107 ~= v_u_25.VoiceChatSuspendedTemporaryB)) and v_u_45()
		if v123 then
			v123 = p107 == v_u_25.VoiceChatSuspendedTemporaryBV2
		end
		if v123 then
			local v124
			if v_u_9 then
				local v125 = v_u_45()
				if v125 then
					v125 = p107 == v_u_25.VoiceChatSuspendedTemporaryBV2
				end
				local v126 = p107 == v_u_25.VoiceChatSuspendedTemporaryB and true or v125
				local v127 = p_u_106.props.bannedUntil.minutes
				if v126 then
					if v127 >= 1 then
						v126 = v127 <= 60
					else
						v126 = false
					end
				end
				if v126 and v125 then
					v124 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspensionV2", {
						["banDurationInMinutes"] = v127
					})
				elseif v126 then
					v124 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", {
						["banDurationInMinutes"] = v127
					})
				else
					local v128 = p_u_106.props.bannedUntil.absoluteSeconds
					v124 = v_u_98 .. " " .. DateTime.fromUnixTimestamp(v128):FormatLocalTime("l LT", v_u_50.RobloxLocaleId) .. "."
				end
			else
				local v129 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", {
					["banDurationInMinutes"] = p_u_106.props.bannedUntil
				})
				if v_u_45() then
					v124 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspensionV2", {
						["banDurationInMinutes"] = p_u_106.props.bannedUntil
					})
				else
					v124 = nil
				end
				if p107 == v_u_25.VoiceChatSuspendedTemporaryB then
					v124 = v129
				elseif not v_u_45() or p107 ~= v_u_25.VoiceChatSuspendedTemporaryBV2 then
					v124 = " " .. p_u_106.props.bannedUntil .. "."
				end
			end
			p_u_106:setState({
				["banEnd"] = v124
			})
			return
		end
	else
		p_u_106:setState({
			["promptType"] = v_u_25.None,
			["toastContent"] = v_u_7.None
		})
	end
end
local v131 = v_u_7.PureComponent:extend("VoiceChatPromptFrame")
local v132 = v8.strictInterface
local v133 = {
	["promptSignal"] = v8.optional(v8.RBXScriptSignal),
	["errorText"] = v8.optional(v8.string)
}
local v134 = v8.optional
local v135
if v_u_9 then
	v135 = v8.interface({
		["minutes"] = v8.number,
		["absoluteSeconds"] = v8.number
	})
else
	v135 = v8.string
end
v133.bannedUntil = v134(v135)
v133.onContinueFunc = v8.optional(v8.callback)
v133.onPrimaryActivated = v8.optional(v8.callback)
v133.onSecondaryActivated = v8.optional(v8.callback)
v133.onReadyForSignal = v8.optional(v8.callback)
v133.Analytics = v8.optional(v8.table)
v133.VoiceChatServiceManager = v8.optional(v8.table)
v133.showNewContent = v8.optional(v8.boolean)
v133.showCheckbox = v8.optional(v8.boolean)
v133.showDataConsentToast = v8.optional(v8.boolean)
v133.policyMapper = v8.optional(v8.callback)
v133.appStyle = v24
v133.settingsAppAvailable = v8.optional(v8.boolean)
v133.UserInputService = v8.optional(v8.table)
v133.lastInput = v8.optional(v8.string)
v131.validateProps = v132(v133)
function v131.init(p_u_136) -- name: init
	-- upvalues: (copy) v_u_25, (copy) v_u_38, (copy) v_u_7, (copy) v_u_49, (copy) v_u_74, (copy) v_u_85, (copy) v_u_130, (copy) v_u_3, (copy) v_u_45, (copy) v_u_46, (copy) v_u_40
	p_u_136.promptStyle = {
		["Theme"] = p_u_136.props.appStyle.Theme,
		["Font"] = p_u_136.props.appStyle.Font
	}
	p_u_136.state = {
		["screenSize"] = nil,
		["promptType"] = nil,
		["toastContent"] = nil,
		["banEnd"] = "",
		["showPrompt"] = true,
		["screenSize"] = Vector2.new(0, 0),
		["promptType"] = v_u_25.None
	}
	local v137
	if v_u_38() then
		v137 = v_u_7.createRef()
	else
		v137 = nil
	end
	p_u_136.ref = v137
	if p_u_136.props.showNewContent then
		local v138 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended")
		local v139 = v_u_49:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporarySuspension2")
		v_u_74[v_u_25.VoiceChatSuspendedTemporary] = v138
		v_u_74[v_u_25.VoiceChatSuspendedPermanent] = v138
		v_u_85[v_u_25.VoiceChatSuspendedTemporary] = v139
	end
	function p_u_136.onScreenSizeChanged(p140)
		-- upvalues: (copy) p_u_136
		if p_u_136.state.screenSize ~= p140.AbsoluteSize then
			p_u_136:setState({
				["screenSize"] = p140.AbsoluteSize
			})
		end
	end
	function p_u_136.promptSignalCallback(p141)
		-- upvalues: (ref) v_u_130, (copy) p_u_136
		v_u_130(p_u_136, p141)
	end
	function p_u_136.closeVoiceBanPrompt()
		-- upvalues: (copy) p_u_136, (ref) v_u_3, (ref) v_u_25, (ref) v_u_45, (ref) v_u_46, (ref) v_u_40
		p_u_136:setState({
			["showPrompt"] = false
		})
		if p_u_136.props.onContinueFunc then
			p_u_136.props.onContinueFunc()
		end
		v_u_3:UnbindCoreAction("CloseVoiceBanPrompt")
		local v142 = p_u_136.state.promptType == v_u_25.VoiceChatSuspendedTemporaryB
		local v143 = v_u_45() and v_u_46()
		if v143 then
			v143 = p_u_136.state.promptType == v_u_25.VoiceChatSuspendedTemporaryBV2
		end
		if v_u_40 then
			local v144 = p_u_136.state.promptType
			local v145 = v144 ~= v_u_25.VoiceChatSuspendedPermanent and (v144 ~= v_u_25.VoiceChatSuspendedTemporary and (v144 ~= v_u_25.VoiceChatSuspendedTemporaryAvatarChat and v144 ~= v_u_25.VoiceChatSuspendedTemporaryB)) and v_u_45()
			if v145 then
				v145 = v144 == v_u_25.VoiceChatSuspendedTemporaryBV2
			end
			if v145 and not (v142 or v143) then
				if p_u_136.props.Analytics then
					p_u_136.props.Analytics:reportBanMessageEvent("Acknowledged")
				end
				if p_u_136.props.VoiceChatServiceManager then
					p_u_136.props.VoiceChatServiceManager:reportBanMessage("Acknowledged")
					return
				end
			end
		elseif not (v142 or v143) then
			if p_u_136.props.Analytics then
				p_u_136.props.Analytics:reportBanMessageEvent("Acknowledged")
			end
			if p_u_136.props.VoiceChatServiceManager then
				p_u_136.props.VoiceChatServiceManager:reportBanMessage("Acknowledged")
			end
		end
	end
	function p_u_136.checkInputStateForClosePrompt(_, p146, _)
		-- upvalues: (copy) p_u_136
		if p146 == Enum.UserInputState.Begin then
			p_u_136.closeVoiceBanPrompt()
		end
	end
	function p_u_136.handlePrimayActivated()
		-- upvalues: (copy) p_u_136
		p_u_136.closeVoiceBanPrompt()
		if p_u_136.props.onPrimaryActivated then
			p_u_136.props.onPrimaryActivated()
		end
	end
	function p_u_136.handleSecondaryActivated()
		-- upvalues: (copy) p_u_136
		p_u_136.closeVoiceBanPrompt()
		if p_u_136.props.onSecondaryActivated then
			p_u_136.props.onSecondaryActivated()
		end
	end
end
function v131.render(p_u_147) -- name: render
	-- upvalues: (copy) v_u_37, (copy) v_u_25, (copy) v_u_45, (copy) v_u_46, (copy) v_u_41, (copy) v_u_18, (copy) v_u_17, (copy) v_u_2, (copy) v_u_9, (copy) v_u_98, (copy) v_u_102, (copy) v_u_104, (copy) v_u_97, (copy) v_u_38, (copy) v_u_47, (copy) v_u_7, (copy) v_u_103, (copy) v_u_100, (copy) v_u_99, (copy) v_u_53, (copy) v_u_52, (copy) v_u_19, (copy) v_u_20, (copy) v_u_15, (copy) v_u_30, (copy) v_u_105, (copy) v_u_101, (copy) v_u_29, (copy) v_u_74, (copy) v_u_85, (copy) v_u_5, (copy) v_u_27, (copy) v_u_34, (copy) v_u_28, (copy) v_u_39, (copy) v_u_43, (copy) v_u_44, (copy) v_u_21, (copy) v_u_12
	local v148
	if v_u_37() then
		v148 = p_u_147.props.errorText or nil
	else
		v148 = nil
	end
	local v149 = p_u_147.state.promptType
	local v150 = v149 ~= v_u_25.VoiceToxicityModal and v_u_45()
	if v150 then
		v150 = v149 == v_u_25.VoiceToxicityModalV2
	end
	local v151 = p_u_147.state.promptType ~= v_u_25.VoiceToxicityToast and v_u_45()
	if v151 then
		v151 = p_u_147.state.promptType == v_u_25.VoiceToxicityToastV2
	end
	local v152 = p_u_147.state.promptType == v_u_25.VoiceChatSuspendedTemporaryB
	local v153 = v_u_45() and v_u_46()
	if v153 then
		v153 = p_u_147.state.promptType == v_u_25.VoiceChatSuspendedTemporaryBV2
	end
	local v154 = v_u_45() and v_u_46()
	if v154 then
		v154 = p_u_147.state.promptType == v_u_25.VoiceToxicityModalV2 and true or p_u_147.state.promptType == v_u_25.VoiceChatSuspendedTemporaryBV2
	end
	local v155 = p_u_147.state.promptType
	local v156 = (v155 == v_u_25.VoiceConsentModalV1 or v155 == v_u_25.VoiceConsentModalV2) and true or v155 == v_u_25.VoiceConsentModalV3
	local v157 = v_u_41()
	if v157 then
		v157 = p_u_147.state.promptType == v_u_25.DevicePermissionsModal
	end
	local v158 = Enum.AutomaticSize.Y
	local v159 = p_u_147.state.promptType
	local v160 = v159 ~= v_u_25.VoiceChatSuspendedPermanent and (v159 ~= v_u_25.VoiceChatSuspendedTemporary and (v159 ~= v_u_25.VoiceChatSuspendedTemporaryAvatarChat and v159 ~= v_u_25.VoiceChatSuspendedTemporaryB)) and v_u_45()
	if v160 then
		v160 = v159 == v_u_25.VoiceChatSuspendedTemporaryBV2
	end
	if not v160 then
		local v161 = v159 ~= v_u_25.VoiceToxicityModal and v_u_45()
		if v161 then
			v161 = v159 == v_u_25.VoiceToxicityModalV2
		end
		v160 = v161 or ((v159 == v_u_25.VoiceConsentModalV1 or v159 == v_u_25.VoiceConsentModalV2) and true or v159 == v_u_25.VoiceConsentModalV3 or v159 == v_u_25.DevicePermissionsModal)
	end
	if not v160 then
		if p_u_147.state.promptType == v_u_25.JoinVoiceSTUX then
			return v_u_7.createElement(v_u_28, {
				["titleText"] = v_u_74[p_u_147.state.promptType],
				["subtitleText"] = v_u_85[p_u_147.state.promptType],
				["promptStyle"] = p_u_147.promptStyle,
				["showPrompt"] = p_u_147.state.showPrompt,
				["onClose"] = function() -- name: onClose
					-- upvalues: (copy) p_u_147
					p_u_147:setState({
						["showPrompt"] = false
					})
				end,
				["onMenuOpen"] = p_u_147.hideOnMenuOpen
			})
		end
		local v162
		if v151 then
			v162 = v_u_39()
		else
			v162 = p_u_147.state.promptType ~= v_u_25.JoinedVoiceToast and 3 or v_u_43()
		end
		local v163 = p_u_147.state.showPrompt
		if p_u_147.state.promptType == v_u_25.VoiceDataConsentOptOutToast and v_u_44() then
			if p_u_147.props.showDataConsentToast then
				v163 = p_u_147.props.showDataConsentToast
			else
				v163 = false
			end
		end
		local v164 = v_u_7.createElement
		local v165 = "Frame"
		local v166 = {
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0),
			[v_u_7.Change.AbsoluteSize] = p_u_147.onScreenSizeChanged
		}
		local v167 = {}
		local v168
		if p_u_147.state.promptType == v_u_25.None then
			v168 = false
		else
			local v169 = v_u_7.createElement
			local v170 = v_u_21
			local v171 = {}
			if v151 then
				v162 = v_u_39()
			end
			v171.duration = v162
			v171.toastContent = p_u_147.state.toastContent
			v171.show = v163
			v168 = v169(v170, v171)
		end
		v167.Toast = v168
		local v172 = p_u_147.props.promptSignal
		if v172 then
			v172 = v_u_7.createElement(v_u_12, {
				["event"] = p_u_147.props.promptSignal,
				["callback"] = p_u_147.promptSignalCallback
			})
		end
		v167.EventConnection = v172
		return v164(v165, v166, v167)
	end
	local v173 = p_u_147.state.toastContent.toastTitle
	local v174 = p_u_147.promptStyle.Font.Header1.Font
	local v175 = p_u_147.promptStyle.Font.Header1.RelativeSize * p_u_147.promptStyle.Font.BaseSize
	local v176
	if v_u_18 then
		v176 = v_u_17(v173, v175, v174, Vector2.new(325, (1 / 0)), {
			["addTemporaryPadding"] = false
		}).Y
	else
		v176 = v_u_2:GetTextSize(v173, v175, v174, Vector2.new(325, (1 / 0))).Y
	end
	local v177 = 20 + v176
	local v178
	if v_u_9 or (v152 or v_u_45() and v153) then
		v178 = p_u_147.state.banEnd
	else
		v178 = v_u_98 .. p_u_147.state.banEnd
	end
	local v179
	if p_u_147.state.banEnd == "" then
		v179 = p_u_147.state.toastContent.toastSubtitle .. p_u_147.state.banEnd
	else
		v179 = "<b>" .. v178 .. "</b><br />" .. p_u_147.state.toastContent.toastSubtitle
	end
	local v180 = v148 or v179
	local v181 = p_u_147.promptStyle.Font.Body.Font
	local v182 = p_u_147.promptStyle.Font.Body.RelativeSize * p_u_147.promptStyle.Font.BaseSize
	local v183
	if v_u_18 then
		v183 = v_u_17(v180, v182, v181, Vector2.new(325, (1 / 0)), {
			["addTemporaryPadding"] = false
		}).Y
	else
		v183 = v_u_2:GetTextSize(v180, v182, v181, Vector2.new(325, (1 / 0))).Y
	end
	local v184 = 20 + v183
	if v152 or v153 then
		v184 = v184 + 20
	end
	local v185
	if v152 then
		v185 = v_u_102
	elseif v_u_45() and v153 then
		v185 = v_u_104
	else
		v185 = v_u_97
	end
	local v186
	if v_u_18 then
		v186 = v_u_17(v185, v182, v181, Vector2.new(325, (1 / 0)), {
			["addTemporaryPadding"] = false
		}).Y
	else
		v186 = v_u_2:GetTextSize(v185, v182, v181, Vector2.new(325, (1 / 0))).Y
	end
	local v187 = 20 + v186
	local v188 = p_u_147.state.promptType
	local v189 = (v188 ~= v_u_25.VoiceChatSuspendedTemporaryB and (not v_u_45() or v188 ~= v_u_25.VoiceChatSuspendedTemporaryBV2) and true or false) and (v188 ~= v_u_25.VoiceToxicityModal and v_u_45())
	if v189 then
		v189 = v188 == v_u_25.VoiceToxicityModalV2
	end
	local v190
	if v_u_38() then
		v190 = Enum.SelectionBehavior.Stop
	else
		v190 = nil
	end
	local v191 = v_u_38() and true or nil
	local v192
	if v_u_47 then
		local v193 = v_u_7.createElement
		local v194 = "TextButton"
		local v195 = {
			["Size"] = UDim2.new(1, -5, 0, 48),
			["LayoutOrder"] = 1
		}
		local v196
		if v_u_45() and (v_u_46() and v153) then
			v196 = v_u_103
		elseif v_u_45() and (v150 and (v_u_46() and p_u_147.state.promptType == v_u_25.VoiceToxicityModalV2)) then
			v196 = v_u_103
		elseif v150 then
			v196 = v_u_100
		else
			v196 = v_u_99
		end
		v195.Text = v196
		v195[v_u_7.Event.Activated] = p_u_147.handlePrimayActivated
		v195[v_u_7.Event.MouseEnter] = function(p197)
			-- upvalues: (ref) v_u_53
			p197.BackgroundColor3 = v_u_53
		end
		v195[v_u_7.Event.MouseLeave] = function(p198)
			-- upvalues: (ref) v_u_52
			p198.BackgroundColor3 = v_u_52
		end
		v195.Selectable = v191
		v195.BackgroundColor3 = v_u_52
		v195.BackgroundTransparency = 0
		v195.TextColor3 = Color3.fromRGB(0, 0, 0)
		v195.BorderSizePixel = 0
		v195.AutoButtonColor = false
		v195.Font = Enum.Font.BuilderSansBold
		v195.TextSize = 20
		v192 = v193(v194, v195, {
			["Corner"] = v_u_7.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 8)
			})
		})
	else
		local v199 = v_u_7.createElement
		local v200 = v_u_19
		local v201 = {
			["buttonType"] = nil,
			["layoutOrder"] = 1,
			["size"] = nil,
			["text"] = nil,
			["onActivated"] = nil,
			["Selectable"] = nil,
			["buttonType"] = v_u_20.PrimarySystem,
			["size"] = UDim2.new(1, -5, 0, 48)
		}
		local v202
		if v_u_45() and (v_u_46() and v153) then
			v202 = v_u_103
		elseif v_u_45() and (v150 and (v_u_46() and p_u_147.state.promptType == v_u_25.VoiceToxicityModalV2)) then
			v202 = v_u_103
		elseif v150 then
			v202 = v_u_100
		else
			v202 = v_u_99
		end
		v201.text = v202
		v201.onActivated = p_u_147.handlePrimayActivated
		v201.Selectable = v191
		v192 = v199(v200, v201)
	end
	local v203 = v_u_7.createElement
	local v204 = "ScreenGui"
	local v205 = {
		["DisplayOrder"] = 8,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["Enabled"] = nil,
		["ZIndexBehavior"] = nil,
		["Enabled"] = p_u_147.state.showPrompt,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v206 = {
		["Overlay"] = v_u_7.createElement("TextButton", {
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["Text"] = "",
			["BackgroundColor3"] = p_u_147.promptStyle.Theme.Overlay.Color,
			["BackgroundTransparency"] = p_u_147.promptStyle.Theme.Overlay.Transparency,
			["Size"] = UDim2.new(1, 0, 1, 0)
		})
	}
	local v207 = v_u_7.createElement
	local v208 = v_u_15.Core.ImageSet.ImageSetLabel
	local v209 = {
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageColor3"] = nil,
		["ImageTransparency"] = nil,
		["Position"] = nil,
		["ScaleType"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["SliceCenter"] = nil,
		["SelectionBehaviorDown"] = nil,
		["SelectionBehaviorLeft"] = nil,
		["SelectionBehaviorRight"] = nil,
		["SelectionBehaviorUp"] = nil,
		["SelectionGroup"] = nil,
		["ref"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Image"] = v_u_30.Images.RoundedRect.Image,
		["ImageColor3"] = p_u_147.promptStyle.Theme.BackgroundUIDefault.Color,
		["ImageTransparency"] = p_u_147.promptStyle.Theme.BackgroundUIDefault.Transparency,
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["ScaleType"] = v_u_30.Images.RoundedRect.ScaleType,
		["Size"] = UDim2.new(0, 365, 0, 55 + v177 + 1 + v184 + 14 + v187 + 36 + 40),
		["AutomaticSize"] = v158,
		["SliceCenter"] = v_u_30.Images.RoundedRect.SliceCenter,
		["SelectionBehaviorDown"] = v190,
		["SelectionBehaviorLeft"] = v190,
		["SelectionBehaviorRight"] = v190,
		["SelectionBehaviorUp"] = v190,
		["SelectionGroup"] = v191
	}
	local v210
	if v_u_38() then
		v210 = p_u_147.ref
	else
		v210 = nil
	end
	v209.ref = v210
	local v211 = {
		["Padding"] = v_u_7.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 20),
			["PaddingBottom"] = UDim.new(0, 20),
			["PaddingLeft"] = UDim.new(0, 20),
			["PaddingRight"] = UDim.new(0, 20)
		}),
		["Layout"] = v_u_7.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Icon"] = v_u_7.createElement(v_u_15.Core.ImageSet.ImageSetLabel, {
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Image"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Image"] = p_u_147.state.toastContent.iconImage,
			["Size"] = UDim2.new(0, 55, 0, 55)
		}),
		["TitleTextContainer"] = v_u_7.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v177),
			["AutomaticSize"] = v158
		}, {
			["TitleText"] = v_u_7.createElement(v_u_15.App.Text.StyledTextLabel, {
				["fontStyle"] = p_u_147.promptStyle.Font.Header1,
				["colorStyle"] = p_u_147.promptStyle.Theme.SystemPrimaryDefault,
				["textXAlignment"] = Enum.TextXAlignment.Center,
				["size"] = UDim2.new(1, 0, 1, 0),
				["text"] = v173
			})
		}),
		["Divider"] = v_u_7.createElement("Frame", {
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = 3,
			["Size"] = nil,
			["BackgroundColor3"] = p_u_147.promptStyle.Theme.Divider.Color,
			["BackgroundTransparency"] = p_u_147.promptStyle.Theme.Divider.Transparency,
			["Size"] = UDim2.new(0.8, 0, 0, 1)
		}),
		["DividerSpaceContainer"] = v_u_7.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 4,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 7)
		}),
		["BodyTextContainer"] = v_u_7.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 5,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v184)
		}, {
			["BodyText"] = v_u_7.createElement(v_u_15.App.Text.StyledTextLabel, {
				["fontStyle"] = p_u_147.promptStyle.Font.Body,
				["colorStyle"] = p_u_147.promptStyle.Theme.TextDefault,
				["textXAlignment"] = Enum.TextXAlignment.Center,
				["size"] = UDim2.new(1, 0, 1, 0),
				["text"] = v180
			})
		}),
		["TextSpaceContainer"] = v_u_7.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 6,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 7)
		})
	}
	local v212 = not v150
	if v212 then
		v212 = v_u_7.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 7,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v187),
			["AutomaticSize"] = v158
		}, {
			["BodyText"] = v_u_7.createElement(v_u_15.App.Text.StyledTextLabel, {
				["fontStyle"] = p_u_147.promptStyle.Font.Body,
				["colorStyle"] = p_u_147.promptStyle.Theme.TextDefault,
				["textXAlignment"] = Enum.TextXAlignment.Center,
				["size"] = UDim2.new(1, 0, 1, 0),
				["text"] = v185
			})
		})
	end
	v211.SubBodyTextContainer = v212
	v211.SpaceContainer2 = v_u_7.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 8,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 10)
	})
	local v213 = v_u_7.createElement
	local v214 = "Frame"
	local v215 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 9,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 36),
		["AutomaticSize"] = v158
	}
	local v216 = {
		["Layout"] = v_u_7.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["Padding"] = UDim.new(0, 20),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}),
		["ConfirmButton"] = v192
	}
	if v189 then
		local v217 = v_u_7.createElement
		local v218 = v_u_15.App.Button.LinkButton
		local v219 = {
			["layoutOrder"] = nil,
			["size"] = nil,
			["text"] = nil,
			["colorStyleDefault"] = "TextMuted",
			["colorStyleHover"] = "TextMuted",
			["onActivated"] = nil,
			["layoutOrder"] = v_u_47 and 2 or 1,
			["size"] = UDim2.new(1, -5, 0, 36)
		}
		local v220
		if v154 then
			v220 = v_u_105
		else
			v220 = v_u_101
		end
		v219.text = v220
		v219.onActivated = p_u_147.handleSecondaryActivated
		v189 = v217(v218, v219)
	end
	v216.SecondaryButton = v189
	v211.ButtonContainer = v213(v214, v215, v216)
	v206.DialogMainFrame = v207(v208, v209, v211)
	local v221 = v203(v204, v205, v206)
	if v157 then
		local v222 = v_u_7.createElement
		local v223 = v_u_29
		local v224 = {
			["titleText"] = v_u_74[p_u_147.state.promptType],
			["bodyText"] = v_u_85[p_u_147.state.promptType],
			["handlePrimaryActivated"] = p_u_147.handlePrimayActivated,
			["handleSecondaryActivated"] = p_u_147.handleSecondaryActivated,
			["Analytics"] = p_u_147.props.Analytics,
			["promptStyle"] = p_u_147.promptStyle,
			["showPrompt"] = p_u_147.state.showPrompt,
			["settingsAppAvailable"] = p_u_147.props.settingsAppAvailable
		}
		local v225
		if p_u_147.props.UserInputService == nil then
			v225 = v_u_5
		else
			v225 = p_u_147.props.UserInputService
		end
		v224.UserInputService = v225
		local v226
		if v_u_38() then
			v226 = p_u_147.ref
		else
			v226 = nil
		end
		v224.ref = v226
		v221 = v222(v223, v224)
	end
	if v156 then
		local v227 = v_u_7.createElement
		local v228 = v_u_27
		local v229 = {
			["titleText"] = v_u_74[p_u_147.state.promptType],
			["bodyText"] = v_u_85[p_u_147.state.promptType],
			["handlePrimaryActivated"] = p_u_147.handlePrimayActivated,
			["handleSecondaryActivated"] = p_u_147.handleSecondaryActivated,
			["Analytics"] = p_u_147.props.Analytics,
			["showCheckbox"] = p_u_147.props.showCheckbox,
			["promptStyle"] = p_u_147.promptStyle,
			["showPrompt"] = p_u_147.state.showPrompt
		}
		local v230
		if v_u_38() then
			v230 = p_u_147.ref
		else
			v230 = nil
		end
		v229.ref = v230
		v221 = v227(v228, v229)
	end
	local v231 = {
		["target"] = v_u_34
	}
	return v_u_7.createElement(v_u_7.Portal, v231, {
		["InGameMenuInformationalDialog"] = v221
	})
end
function v131.didUpdate(p232) -- name: didUpdate
	-- upvalues: (copy) v_u_38, (copy) v_u_13, (copy) v_u_6
	if v_u_38() then
		if p232.props.lastInput == v_u_13.Input.Directional then
			local v233 = p232.ref:getValue()
			if p232.state.showPrompt and v233 then
				v_u_6:Select(v233)
			end
			if not p232.state.showPrompt and v233 then
				v_u_6.SelectedCoreObject = nil
				return
			end
		elseif v_u_6.SelectedCoreObject then
			v_u_6.SelectedCoreObject = nil
		end
	end
end
function v131.didMount(p234) -- name: didMount
	-- upvalues: (copy) v_u_3
	if p234.props.onReadyForSignal then
		p234.props.onReadyForSignal()
	end
	v_u_3:BindCoreAction("CloseVoiceBanPrompt", p234.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonA)
	v_u_3:BindCoreAction("CloseVoiceBanPrompt", p234.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonB)
end
local v_u_238 = v26.connect(function(p235, _)
	local v236 = {
		["showNewContent"] = p235.getGameInfoShowChatFeatures(),
		["showCheckbox"] = p235.getDisplayCheckboxInVoiceConsent()
	}
	local v237
	if p235.getDisplayCheckboxInVoiceConsent() == nil then
		v237 = false
	else
		v237 = p235.getDisplayCheckboxInVoiceConsent()
	end
	v236.showDataConsentToast = v237
	return v236
end)(v131)
local function v_u_246(p239) -- name: WrappedVoiceChatPromptFrame
	-- upvalues: (copy) v_u_23, (copy) v_u_38, (copy) v_u_14, (copy) v_u_7, (ref) v_u_238, (copy) v_u_10
	local v240 = v_u_23()
	local v241
	if v_u_38() then
		v241 = v_u_14()
	else
		v241 = nil
	end
	local v242 = v_u_7.createElement
	local v243 = v_u_238
	local v244 = v_u_10.Dictionary.join
	local v245 = {
		["appStyle"] = v240
	}
	if not v_u_38() then
		v241 = nil
	end
	v245.lastInput = v241
	return v242(v243, v244(p239, v245))
end
return function(p247)
	-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_246
	return v_u_11({ v_u_7.createElement(v_u_246, p247) })
end