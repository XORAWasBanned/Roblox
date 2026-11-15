-- Path: CoreGui.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("VoiceChatService")
local v_u_4 = game:GetService("Workspace")
local v_u_5 = game:GetService("LocalizationService")
local v_u_6 = require(v1.Packages.Promise)
local v_u_7 = require(v1.Packages.Roact)
local v8 = require(v1.Packages.LuauPolyfill)
local v_u_9 = require(v1.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local v_u_10 = game:GetService("CoreGui")
local v11 = game:GetService("RunService")
local v_u_12 = game:GetService("SoundService")
local v13 = v_u_10:WaitForChild("RobloxGui")
local v14 = game:GetService("NotificationService")
local v_u_15 = game:GetService("RbxAnalyticsService")
local v_u_16 = game:GetService("AppStorageService")
local v17 = require(v1.Workspace.Packages.SocialUpsell)
local v_u_18 = require(v1.Workspace.Packages.LoggingProtocol).default
local v_u_19 = require(v1.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local v_u_20 = require(v1.Workspace.Packages.ExperimentLayers).AppUserLayers
local v_u_21 = require(v1.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v_u_22 = require(v1.Workspace.Packages.VoiceChatCore)
local v_u_23 = require(v1.Workspace.Packages.VoiceChat).GlobalVoiceManager.default
local v_u_24 = require(v1.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local v_u_25 = require(v1.Workspace.Packages.VoiceChat.createVoiceRestrictionController_DEPRECATED)
local v_u_26 = require(script.Parent.Helpers.showLegacyVoiceRestriction)
local v_u_27 = require(script.Parent.Helpers.showUFRVoiceRestriction)
local v_u_28 = require(script.Parent.Helpers.getActiveInterventionTimeoutEnd)
local v_u_29 = require(v1.Workspace.Packages.InterventionShared).Signals.voiceInterventionReceivedSignal
local v_u_30 = require(v1.Workspace.Packages.InterventionShared).Utils.Constants
local v_u_31 = require(script.Parent.Flags.FFlagVoiceChatBanDurationUseServerTime)
local v_u_32 = require(v1.Workspace.Packages.SharedFlags).FFlagProactiveVoiceRestrictionsUFR
local v_u_33 = require(v1.Workspace.Packages.SharedFlags).FFlagReactiveVoiceRestrictionsUFR
local v_u_34 = require(script.Parent.Flags.FFlagProactiveVoiceRestrictionsUFRIXPExposure)
local v_u_35 = require(script.Parent.Flags.GetFFlagDisableConsentModalForExistingUsers)
require(script.Parent.Flags.GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses)
local v_u_36 = require(v13.Modules.Flags.GetFFlagEnableUniveralVoiceToasts)
local v_u_37 = require(v13.Modules.Flags.GetFFlagEnableVoicePromptReasonText)
local v_u_38 = require(v1.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local v_u_39 = v_u_22.Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat
local v_u_40 = require(v1.Workspace.Packages.SharedFlags).GetFFlagNonVoiceFTUX
local v_u_41 = require(v1.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions
local v_u_42 = require(v13.Modules.Flags.GetFIntVoiceReverseNudgeUXDisplayTimeSeconds)
local v_u_43 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_44 = require(v13.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast)
local v_u_45 = require(v1.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceConsentToastPolicy
local v_u_46 = v_u_22.Flags.GetFFlagEnableFtuxExitOnMuteToggle
local v_u_47 = v_u_22.Flags.GetFFlagMicConsumerRegistry
local v_u_48 = require(v1.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local v_u_49 = require(v1.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute
local v_u_50 = require(v1.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local v_u_51 = require(v1.Workspace.Packages.SharedFlags).GetFFlagDebugShowAudioDeviceInputDebugger()
local v_u_52 = require(script.Parent.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2)
local v_u_53 = require(script.Parent.Helpers.VoiceNudgeUseNewDACopy)
local v_u_54 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false)
local v_u_55 = game:DefineFastFlag("DebugSimulateConnectDisconnect", false)
local v_u_56 = game:DefineFastFlag("DebugSkipSeamlessVoiceAPICheck", false)
local v_u_57 = game:DefineFastFlag("FixSTUXShowingIncorrectly", false)
local v_u_58 = game:DefineFastInt("DebugConnectDisconnectInterval", 15)
local v_u_59 = game:DefineFastFlag("DisablePermissionPromptDeeplink", false)
local v_u_60 = game:DefineFastFlag("VoiceEndedCheckDisregardIdleState", false)
local v_u_61 = game:DefineFastFlag("DisableLeaveToastInStudio", false)
local v_u_62 = game:DefineFastFlag("EnableVerifiedCheckViaOverlay", false)
local v_u_63 = v_u_22.Flags.GetFIntThrottleParticipantsUpdateMs
local v_u_64 = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure")
local v_u_65 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local v_u_66 = game:DefineFastFlag("VoiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure", false)
local v_u_67 = game:DefineFastString("VoiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer", "Voice.VolumeControls")
local v_u_68 = game:DefineFastInt("SeamlessVoiceSTUXDisplayCount", 3)
local v_u_69 = require(v1.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local v_u_70 = require(v1.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal
local v_u_71 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch
local v_u_72 = game:DefineFastFlag("ShowJoinVoiceWhenDisconnectedV3", false)
local v_u_73 = game:DefineFastFlag("EnableVoiceRewarmReArmV2", false)
local v_u_74 = require(script.Parent.Flags.FFlagVoiceRewarmGrafanaMetrics)
local v_u_75 = require(v13.Modules.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
local v_u_76 = require(script.Parent.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local v_u_77 = require(v1.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry
local v_u_78 = game:DefineFastFlag("GuardVoiceInExpUpsellVariant", false)
local v_u_79 = game:DefineFastFlag("AlwaysSetJoinVoiceButtonContext", false)
local v_u_80 = require(v1.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local v_u_81 = require(v1.Workspace.Packages.SharedFlags).GetFFlagInExperiencePhoneUpsellNewCopy
local v_u_82 = require(v1.Workspace.Packages.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local v_u_83 = require(v1.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchRetries
local v_u_84 = require(v1.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchTimeoutMS
local v85 = require(v1.Workspace.Packages.VoiceChat)
local v86 = v85.Constants
local v_u_87 = v85.AgeVerificationOverlay.PostRecordUserSeenGeneralModal
local v_u_88 = require(v13.Modules.VoiceChat.Constants)
local v_u_89 = require(v13.Modules.VoiceChatPrompt.Components.VoiceChatPrompt)
local v_u_90 = require(v13.Modules.VoiceChat.Components.AudioDeviceInputDebugger)
local v_u_91 = require(v13.Modules.VoiceChatPrompt.PromptType)
local v_u_92 = v85.GetUserSettings
local v_u_93 = v85.GetInformedOfBan
local v_u_94 = v85.PostInformedOfBan
local v_u_95 = require(v13.Modules.Settings.getCamMicPermissions)
local v_u_96 = v_u_88.BAN_REASON
local v_u_97 = require(v13.Modules.Settings.Enum.SeamlessVoiceStatus)
local v_u_98 = require(v1.Workspace.Packages.UniversalAppPolicy)
local v_u_99 = require(v1.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local v_u_100 = v_u_22.Analytics
local v_u_101 = game:GetService("HttpService")
local v_u_102 = game:GetService("HttpRbxApiService")
local v103 = require(v1.Workspace.Packages.BlockingUtility)
local v_u_104 = require(v13.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
local v105
if v_u_38() then
	v105 = game:GetService("AvatarChatService")
else
	v105 = nil
end
local v106
if v_u_48() then
	v106 = game:GetService("CaptureService")
else
	v106 = nil
end
local v_u_107 = require(v1.Workspace.Packages.ExpChat)
local v_u_108 = require(v1.Workspace.Packages.LinkingProtocol).LinkingProtocol.default
local v_u_109 = require(v1.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute
local v_u_110
if v_u_69() then
	v_u_110 = require(v1.Workspace.Packages.PhoneUpsell).PhoneUpsellController
else
	v_u_110 = nil
end
local v_u_111
if v_u_69() then
	v_u_111 = require(v1.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed
else
	v_u_111 = nil
end
local v112 = v_u_22.CoreVoiceManager
local v113 = v_u_22.Constants
local v_u_114 = v17.Overlay.getOverlayStore
local v_u_115 = v17.Overlay.OverlayTypes
local v_u_116 = v17.Enum.SocialUpsellType
local v_u_117 = v17.Analytics.Enum
local v118 = require(v1.Workspace.Packages.SocialExperiments)
local v_u_119 = v118.FFlagTestDeviceForFAEUpsell
local v_u_120 = v118.deviceMeetsRequirementsForFAE
local v_u_121 = game:GetEngineFeature("EnableMutedByLocalUser")
local v_u_122 = require(v1.Workspace.Packages.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local v_u_123 = v_u_22.VoiceVolumeControlsEligibility
local v_u_124 = v86.VOICE_STATE
local v_u_125 = v86.VOICE_CHAT_DEVICE_TYPE
local v_u_126 = v86.VOICE_CHAT_AVAILABILITY
local v_u_127 = v86.MIN_VOICE_CHAT_API_VERSION
local v_u_128 = v86.WATCHED_MESSAGE_TYPES
local v129 = v86.PERMISSION_STATE
local v_u_130 = v113.VOICE_JOIN_PROGRESS
local v_u_131 = {
	["available"] = nil,
	["version"] = nil,
	["participants"] = nil,
	["recentUsersInteractionData"] = nil,
	["permissionPromise"] = nil,
	["canUseServicePromise"] = nil,
	["localMuted"] = nil,
	["isTalking"] = false,
	["previousGroupId"] = nil,
	["previousMutedState"] = nil,
	["pendingDisconnectReason"] = nil,
	["userEligible"] = false,
	["HttpRbxApiService"] = v_u_102,
	["NotificationService"] = v14,
	["runService"] = v11,
	["PermissionsService"] = v_u_9.default,
	["communicationPermissionsResult"] = nil,
	["VoiceJoinProgress"] = v_u_130.Idle,
	["VoiceJoinProgressChanged"] = Instance.new("BindableEvent"),
	["participantJoined"] = Instance.new("BindableEvent"),
	["participantLeft"] = Instance.new("BindableEvent"),
	["participantsUpdate"] = Instance.new("BindableEvent"),
	["muteChanged"] = Instance.new("BindableEvent"),
	["muteAllChanged"] = Instance.new("BindableEvent"),
	["attemptVoiceRejoin"] = Instance.new("BindableEvent"),
	["showVoiceUI"] = Instance.new("BindableEvent"),
	["hideVoiceUI"] = Instance.new("BindableEvent"),
	["voiceUIVisible"] = false,
	["mutedNonFriends"] = Instance.new("BindableEvent"),
	["userAgencySelected"] = Instance.new("BindableEvent"),
	["sendMuteEvent"] = nil,
	["muteAll"] = false,
	["mutedPlayers"] = {},
	["talkingChanged"] = Instance.new("BindableEvent"),
	["SignalREventTable"] = {},
	["audioDevices"] = {},
	["service"] = nil,
	["previousSessionId"] = nil,
	["voiceEnabled"] = false,
	["VOICE_STATE"] = v_u_124
}
local v132
if v_u_41() then
	v132 = v129.IDLE
else
	v132 = nil
end
v_u_131.permissionState = v132
v_u_131.isBanned = false
v_u_131.bannedUntil = nil
v_u_131.errorText = nil
v_u_131.BlockStatusChanged = nil
v_u_131.isInCall = false
v_u_131.callMutedState = false
v_u_131.banReason = nil
v_u_131._mutedAnyone = false
v_u_131.VOICE_CHAT_DEVICE_TYPE = v_u_125
v_u_131.getPermissionsFunction = v_u_95
v_u_131.AvatarChatService = v105
v_u_131.inExpUpsellEntrypoint = nil
v_u_131.seamlessVoiceStatus = nil
v_u_131.isShowingFTUX = false
v_u_131.hideFTUXSignal = Instance.new("BindableEvent")
v_u_131.settingsAppAvailable = nil
v_u_131.hasLeftFTUX = false
v_u_131.deniedMicPermissions = nil
v_u_131.isInitialJoin = false
v_u_131.joinVoiceButtonContext = nil
v_u_131.hasReportedRewarmShown = false
v_u_131.pendingConnectionSource = nil
v_u_131.joinVoiceButtonConsequence = nil
v_u_131.CaptureService = v106
local v_u_133 = v8.Set.new({
	"available",
	"participants",
	"recentUsersInteractionData",
	"permissionPromise",
	"canUseServicePromise",
	"localMuted",
	"isTalking",
	"previousGroupId",
	"previousMutedState",
	"userEligible",
	"sendMuteEvent",
	"mutedPlayers",
	"SignalREventTable",
	"audioDevices",
	"service",
	"previousSessionId",
	"voiceEnabled",
	"permissionState",
	"BlockStatusChanged",
	"isInCall",
	"callMutedState",
	"attemptVoiceRejoin",
	"VoiceJoinProgressChanged",
	"participantJoined",
	"participantLeft",
	"participantsUpdate",
	"muteChanged",
	"audioDeviceInputAdded",
	"talkingChanged",
	"canUseServiceResult"
})
v_u_133:add("_mutedAnyone")
v_u_133:add("muteAllChanged")
local v_u_134 = {}
local v_u_135 = {
	[v_u_88.IN_EXP_UPSELL_VARIANT.VARIANT1] = v_u_91.VoiceConsentModalV1,
	[v_u_88.IN_EXP_UPSELL_VARIANT.VARIANT2] = v_u_91.VoiceConsentModalV2,
	[v_u_88.IN_EXP_UPSELL_VARIANT.VARIANT3] = v_u_91.VoiceConsentModalV3
}
function getIconSrc(p136, p137) -- name: getIconSrc
	return "rbxasset://textures/ui/VoiceChat/" .. (p137 and p137 .. "/" or "") .. p136 .. ".png"
end
function getIcon(p138, p139, p140) -- name: getIcon
	-- upvalues: (copy) v_u_124
	if p138 == v_u_124.MUTED then
		return getIconSrc("Muted", p140)
	end
	if p138 == v_u_124.CONNECTING then
		return getIconSrc("Connecting", p140)
	end
	if p138 == v_u_124.INACTIVE then
		return getIconSrc("Blank", p140)
	end
	if p138 ~= v_u_124.TALKING then
		return getIconSrc("Error", p140)
	end
	local v141 = 0.5 + 5 * (p139 or math.random())
	local v142 = math.floor(v141) * 20
	return p139 and getIconSrc("Unmuted" .. tostring(v142), p140) or getIconSrc("Blank", p140)
end
v_u_131.__index = v_u_131
function v_u_131.__index(p143, p144) -- name: __index
	-- upvalues: (copy) v_u_133, (copy) v_u_131
	if v_u_133:has(p144) then
		return p143.coreVoiceManager[p144]
	end
	local v145 = v_u_131
	return rawget(v145, p144)
end
function v_u_131.__newindex(p146, p147, p148) -- name: __newindex
	-- upvalues: (copy) v_u_133, (copy) v_u_131
	if v_u_133:has(p147) then
		p146.coreVoiceManager[p147] = p148
	else
		local v149 = v_u_131
		rawset(v149, p147, p148)
	end
end
function v_u_131.new(p150, p151, p152, p153, p154, p155, p156, p157, p158, p159) -- name: new
	-- upvalues: (copy) v_u_100, (copy) v_u_95, (copy) v_u_131, (copy) v_u_32, (copy) v_u_33, (copy) v_u_24, (copy) v_u_25, (copy) v_u_92, (copy) v_u_93, (copy) v_u_26, (copy) v_u_27, (copy) v_u_29, (copy) v_u_128, (copy) v_u_63, (copy) v_u_21, (copy) v_u_64, (copy) v_u_65, (copy) v_u_50, (copy) v_u_107, (copy) v_u_36, (copy) v_u_76, (copy) v_u_75, (copy) v_u_54, (copy) v_u_47, (copy) v_u_51, (copy) v_u_122, (copy) v_u_104, (copy) v_u_66, (copy) v_u_123, (copy) v_u_67, (copy) v_u_72, (copy) v_u_73, (copy) v_u_130, (copy) v_u_88, (copy) v_u_61, (copy) v_u_91, (copy) v_u_55, (copy) v_u_19, (copy) v_u_16, (copy) v_u_34, (copy) v_u_20, (copy) v_u_52, (copy) v_u_53, (copy) v_u_70, (copy) v_u_44, (copy) v_u_40, (copy) v_u_48, (copy) v_u_49, (copy) v_u_23
	local v160 = {
		["service"] = nil,
		["HttpRbxApiService"] = nil,
		["NotificationService"] = nil,
		["PermissionsService"] = nil,
		["BlockStatusChanged"] = nil,
		["Analytics"] = nil,
		["getPermissionsFunction"] = nil,
		["AvatarChatService"] = nil,
		["SequenceNumbers"] = nil,
		["SignalREventTable"] = nil,
		["coreVoiceManager"] = nil,
		["_mutedAnyone"] = false,
		["CaptureService"] = nil,
		["voiceConnectEventReportedForActiveSession"] = false,
		["service"] = p151,
		["HttpRbxApiService"] = p152,
		["NotificationService"] = p156,
		["PermissionsService"] = p153,
		["BlockStatusChanged"] = p154,
		["Analytics"] = v_u_100.new(p155),
		["getPermissionsFunction"] = p157 or v_u_95,
		["AvatarChatService"] = p158,
		["SequenceNumbers"] = {},
		["SignalREventTable"] = {},
		["coreVoiceManager"] = p150,
		["CaptureService"] = p159
	}
	local v161 = v_u_131
	local v_u_162 = setmetatable(v160, v161)
	if v_u_32 then
		local v163
		if v_u_33 then
			v163 = v_u_24
		else
			v163 = v_u_25
		end
		local v175 = {
			["getSettings"] = function() -- name: getSettings
				-- upvalues: (ref) v_u_92, (copy) v_u_162
				local v_u_164 = v_u_162
				local v_u_165 = "GetRequest"
				return v_u_92(function(...)
					-- upvalues: (copy) v_u_164, (copy) v_u_165
					return v_u_164[v_u_165](v_u_164, ...)
				end) or nil
			end,
			["getInformedOfBan"] = function() -- name: getInformedOfBan
				-- upvalues: (ref) v_u_93, (copy) v_u_162
				local v_u_166 = v_u_162
				local v_u_167 = "GetRequest"
				local v168 = v_u_93(function(...)
					-- upvalues: (copy) v_u_166, (copy) v_u_167
					return v_u_166[v_u_167](v_u_166, ...)
				end)
				if v168 then
					return v168.informedOfBan
				else
					return nil
				end
			end,
			["showLegacyRestriction"] = function(p169, p170, p171) -- name: showLegacyRestriction
				-- upvalues: (copy) v_u_162, (ref) v_u_26
				v_u_162.bannedUntil = p169.bannedUntil
				v_u_162.banReason = p169.banReason
				v_u_26({
					["manager"] = v_u_162,
					["settings"] = p169,
					["trigger"] = p170,
					["isCurrent"] = p171
				})
			end,
			["onError"] = function(p172) -- name: onError
				-- upvalues: (copy) v_u_162, (ref) v_u_100
				v_u_162:_reportJoinFailed(p172, v_u_100.ERROR)
			end,
			["showUFRRestriction"] = function(p173, _, p174) -- name: showUFRRestriction
				-- upvalues: (ref) v_u_27, (copy) v_u_162
				v_u_27({
					["manager"] = v_u_162,
					["settings"] = p173,
					["onAcknowledgementSuccess"] = p174
				})
			end
		}
		rawset(v_u_162, "voiceRestrictionController", v163(v175))
	end
	if v_u_32 and v_u_33 then
		local v176 = v_u_29
		rawset(v_u_162, "voiceInterventionConnection", v176:connect(function(p177)
			-- upvalues: (copy) v_u_162
			v_u_162:_onUFRInterventionReceived(p177)
		end))
	end
	for _, v178 in v_u_128 do
		v_u_162.SignalREventTable[v178] = Instance.new("BindableEvent")
	end
	v_u_162.shouldThrottleParticipantUpdate = false
	v_u_162.participantsStateThrottleTime = 0
	v_u_162.lastParticipantsStateUpdate = 0
	v_u_162.lastStateUpdateCounter = 0
	v_u_162.reverseNudgeToxicUserRemovalCallbacks = {}
	if v_u_63() > 0 then
		v_u_162.participantsStateThrottleTime = v_u_63() / 1000
		local function v179()
			-- upvalues: (ref) v_u_21, (ref) v_u_64
			return v_u_21:GetLayerData(v_u_64)
		end
		local v180, v181 = pcall(v179)
		if v180 and (v181 and v181[v_u_65]) then
			v_u_162.shouldThrottleParticipantUpdate = true
		end
	end
	v_u_162.MuteStatusIcons = {
		["MicOn"] = v_u_162:GetIcon("Unmuted0", "SpeakerLight"),
		["MicOff"] = v_u_162:GetIcon("Muted", "SpeakerLight"),
		["MicDisabled"] = v_u_162:GetIcon("Muted", "SpeakerLight"),
		["Loading"] = v_u_162:GetIcon("Connecting", "SpeakerLight"),
		["Error"] = v_u_162:GetIcon("Error", "SpeakerLight")
	}
	v_u_162.PlayerMuteStatusIcons = {
		["MicOn"] = v_u_162:GetIcon("Unmuted0", "MicLight"),
		["MicOff"] = v_u_162:GetIcon("Muted", "MicLight"),
		["MicDisabled"] = v_u_162:GetIcon("Muted", "MicLight"),
		["Loading"] = v_u_162:GetIcon("Connecting", "MicLight"),
		["Error"] = v_u_162:GetIcon("Error", "MicLight")
	}
	local v_u_182 = false
	local v_u_183 = v_u_162.attemptVoiceRejoin.Event:Connect(function()
		-- upvalues: (ref) v_u_182
		v_u_182 = true
	end)
	local v_u_184
	if v_u_50() then
		v_u_184 = v_u_107.Stores.GetVoiceStore(false)
	else
		v_u_184 = nil
	end
	v_u_162.coreVoiceManager:subscribe("GetPermissions", function(p185, p186, p187, p188)
		-- upvalues: (copy) v_u_162
		local v189 = v_u_162.inExpUpsellEntrypoint == nil and "VoiceChatServiceManager.requestMicPermission" or v_u_162.inExpUpsellEntrypoint
		v_u_162.getPermissionsFunction(p185, p186, p187, v189, p188)
	end)
	v_u_162.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(p190)
		-- upvalues: (ref) v_u_50, (copy) v_u_184, (ref) v_u_107
		if v_u_50() then
			v_u_184.handleVoiceParticipantRemoved(p190)
		elseif v_u_107.Events.VoiceParticipantRemoved then
			v_u_107.Events.VoiceParticipantRemoved((tostring(p190)))
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(p191)
		-- upvalues: (ref) v_u_50, (copy) v_u_184, (ref) v_u_107
		if v_u_50() then
			v_u_184.handleVoiceParticipantAdded(p191)
		elseif v_u_107.Events.VoiceParticipantAdded then
			v_u_107.Events.VoiceParticipantAdded((tostring(p191)))
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(p192, p193)
		-- upvalues: (ref) v_u_107
		if v_u_107.Events.VoiceParticipantToggleMuted then
			v_u_107.Events.VoiceParticipantToggleMuted(tostring(p192), p193)
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(p194, p195)
		-- upvalues: (copy) v_u_162
		v_u_162:_onUserAndPlaceCanUseVoiceResolved(p194, p195)
	end)
	v_u_162.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function()
		-- upvalues: (ref) v_u_36, (ref) v_u_76, (ref) v_u_75, (copy) v_u_162
		if v_u_36() then
			if v_u_76 and v_u_75 then
				return v_u_162:CheckAndShowNotAudiblePrompt():andThen(function()
					-- upvalues: (ref) v_u_162
					return v_u_162:ShowNotAudiblePromptVoiceChatVolume()
				end)
			else
				return v_u_162:CheckAndShowNotAudiblePrompt()
			end
		else
			return
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function()
		-- upvalues: (copy) v_u_162, (ref) v_u_36, (ref) v_u_54
		if v_u_162:IsSeamlessVoice() then
			v_u_162.deniedMicPermissions = true
		end
		if v_u_36() and not v_u_54 then
			return v_u_162:CheckAndShowPermissionPrompt()
		end
	end)
	if v_u_47() then
		v_u_162.coreVoiceManager:subscribe("OnMicPermissionDeniedToast", function()
			-- upvalues: (copy) v_u_162
			v_u_162:showPrompt("MicPermissionDenied")
		end)
		v_u_162.coreVoiceManager:subscribe("OnMicFirstUnmutePrivacy", function()
			-- upvalues: (copy) v_u_162
			v_u_162:showPrompt("MicFirstUnmutePrivacy")
		end)
	end
	if v_u_51 then
		v_u_162.coreVoiceManager:subscribe("OnDevicePlayerChanged", function()
			-- upvalues: (copy) v_u_162
			v_u_162:UpdateAudioDeviceInputDebugger()
		end)
		v_u_162.coreVoiceManager:subscribe("OnDeviceActiveChanged", function()
			-- upvalues: (copy) v_u_162
			v_u_162:UpdateAudioDeviceInputDebugger()
		end)
		v_u_162.coreVoiceManager:subscribe("OnDeviceMuteChanged", function()
			-- upvalues: (copy) v_u_162
			v_u_162:UpdateAudioDeviceInputDebugger()
		end)
		if v_u_122 then
			v_u_162.coreVoiceManager:subscribe("OnVoiceChangerChanged", function()
				-- upvalues: (copy) v_u_162
				v_u_162:UpdateAudioDeviceInputDebugger()
			end)
		end
		v_u_162.coreVoiceManager:subscribe("OnPlayerMuted", function()
			-- upvalues: (copy) v_u_162
			v_u_162:UpdateAudioDeviceInputDebugger()
		end)
		v_u_162.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function()
			-- upvalues: (copy) v_u_162
			v_u_162:UpdateAudioDeviceInputDebugger()
		end)
		v_u_162.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function()
			-- upvalues: (copy) v_u_162
			v_u_162:UpdateAudioDeviceInputDebugger()
		end)
		v_u_162.coreVoiceManager:subscribe("OnDeviceMutedByLocalUserChanged", function()
			-- upvalues: (copy) v_u_162
			v_u_162:UpdateAudioDeviceInputDebugger()
		end)
	end
	v_u_162.coreVoiceManager:subscribe("OnStateChanged", function(_, p196)
		-- upvalues: (ref) v_u_104, (copy) v_u_162, (ref) v_u_66, (ref) v_u_123, (ref) v_u_21, (ref) v_u_67, (ref) v_u_72, (ref) v_u_73, (ref) v_u_130, (ref) v_u_88, (ref) v_u_182, (copy) v_u_183, (ref) v_u_32, (ref) v_u_61, (ref) v_u_91
		v_u_104:setClientSessionId(v_u_162.coreVoiceManager:GetSessionId())
		if p196 == Enum.VoiceChatState.Ended or p196 == Enum.VoiceChatState.Failed then
			v_u_162.voiceConnectEventReportedForActiveSession = false
		end
		if p196 == Enum.VoiceChatState.Joined and (v_u_66 and v_u_123.isVoiceChatVolumeSliderVisible(true, game:GetService("VoiceChatService").UseNewAudioApi)) then
			v_u_21:LogFlagLinkedUserLayerExposure(v_u_67)
		end
		if v_u_72 and (v_u_73 and (p196 == Enum.VoiceChatState.Joined and v_u_162:ShouldRewarmUser())) then
			v_u_162:ConsumeVoiceRewarm()
		end
		if p196 == Enum.VoiceChatState.Joined and (v_u_162:GetVoiceJoinProgress() == v_u_130.Idle and not v_u_162.voiceConnectEventReportedForActiveSession) then
			local v197 = v_u_162:GetConnectDisconnectAnalyticsData()
			v197.connectionSource = v_u_88.VOICE_CONNECTION_SOURCE.AUTO_CONNECT
			v_u_162.pendingConnectionSource = nil
			v_u_162.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v197)
			v_u_162.voiceConnectEventReportedForActiveSession = true
			v_u_182 = false
			v_u_183:Disconnect()
		end
		local v198 = p196 == Enum.VoiceChatState.Ended
		if v198 then
			local v199 = v_u_162:GetConnectDisconnectAnalyticsData()
			v199.disconnectReason = v_u_162.pendingDisconnectReason or v_u_88.VOICE_DISCONNECT_REASON.SYSTEM
			v_u_162.Analytics:reportConnectDisconnectEvents("voiceDisconnectReasonEvent", v199)
			v_u_162.pendingDisconnectReason = nil
		end
		if v198 and (v_u_162.bannedUntil == nil and (not v_u_32 or v_u_162:GetVoiceRestrictionState(false) == "normal")) then
			if v_u_61 and v_u_162.runService:IsStudio() then
				return
			end
			v_u_162:showPrompt(v_u_91.LeaveVoice)
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function()
		-- upvalues: (copy) v_u_162, (ref) v_u_55, (ref) v_u_19, (ref) v_u_16, (ref) v_u_88, (ref) v_u_91
		v_u_162:ShowVoiceUI()
		if v_u_55 then
			v_u_19:debug("Simulating join voice")
			v_u_162:simulateVoiceConnectDisconnect()
		end
		if not v_u_162.coreVoiceManager.initializedPostSuspension then
			local function v200()
				-- upvalues: (ref) v_u_16, (ref) v_u_88
				return v_u_16:GetItem(v_u_88.VOICE_WITH_TC_TOAST_KEY) == "true"
			end
			local v201, v202 = pcall(v200)
			if v201 and not v202 then
				v_u_162:showPrompt(v_u_91.UpdateOnAutoJoinToast)
				local function v203()
					-- upvalues: (ref) v_u_16, (ref) v_u_88
					v_u_16:SetItem(v_u_88.VOICE_WITH_TC_TOAST_KEY, "true")
					v_u_16:Flush()
				end
				pcall(v203)
			end
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnInitialJoinFailed", function()
		-- upvalues: (copy) v_u_162
		v_u_162:InitialJoinFailedPrompt()
	end)
	v_u_162.coreVoiceManager:subscribe("OnPlayerModerated", function()
		-- upvalues: (copy) v_u_162, (ref) v_u_88
		v_u_162.pendingDisconnectReason = v_u_88.VOICE_DISCONNECT_REASON.MODERATED
		v_u_162:ShowPlayerModeratedMessage()
	end)
	v_u_162.coreVoiceManager:subscribe("OnRetryRequested", function()
		-- upvalues: (copy) v_u_162, (ref) v_u_91
		v_u_162:showPrompt(v_u_91.Retry)
	end)
	v_u_162.coreVoiceManager:subscribe("OnVoiceToxicityModal", function()
		-- upvalues: (ref) v_u_19, (ref) v_u_34, (ref) v_u_21, (ref) v_u_20, (ref) v_u_32, (ref) v_u_26, (copy) v_u_162, (ref) v_u_52, (ref) v_u_53, (ref) v_u_91
		v_u_19:debug("Showing Voice Toxicity Modal")
		if v_u_34 then
			v_u_21:LogFlagLinkedUserLayerExposure(v_u_20.VoiceUserIDLayer)
		end
		if v_u_32 then
			v_u_26({
				["manager"] = nil,
				["settings"] = nil,
				["trigger"] = "toxicityModal",
				["isCurrent"] = nil,
				["manager"] = v_u_162,
				["isCurrent"] = function() -- name: isCurrent
					return true
				end
			})
			return
		elseif v_u_52() and v_u_53() then
			v_u_162:showPrompt(v_u_91.VoiceToxicityModalV2)
		else
			v_u_162:showPrompt(v_u_91.VoiceToxicityModal)
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnVoiceToxicityToast", function()
		-- upvalues: (ref) v_u_19, (ref) v_u_52, (ref) v_u_53, (copy) v_u_162, (ref) v_u_91
		v_u_19:debug("Showing Voice Toxicity Toast")
		if v_u_52() and v_u_53() then
			v_u_162:showPrompt(v_u_91.VoiceToxicityToastV2)
		else
			v_u_162:showPrompt(v_u_91.VoiceToxicityToast)
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnPermissionRequested", function()
		-- upvalues: (ref) v_u_70, (copy) v_u_162, (ref) v_u_91
		if v_u_70() then
			v_u_162:showPrompt(v_u_91.DevicePermissionsModal)
		else
			v_u_162:showPrompt(v_u_91.Permission)
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnShowDataConsentToast", function()
		-- upvalues: (ref) v_u_44, (copy) v_u_162
		if v_u_44() then
			v_u_162:showDataConsentToast()
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(p204)
		-- upvalues: (ref) v_u_19, (ref) v_u_107, (copy) v_u_162
		v_u_19:debug("Showing Reverse Nudge Icon Color Change")
		if v_u_107.Events.AddReverseNudgeToxicUser and v_u_107.Events.RemoveReverseNudgeToxicUser then
			v_u_162:AddReverseNudgeToxicUser(p204.toxicUserId, v_u_107.Events.AddReverseNudgeToxicUser, v_u_107.Events.RemoveReverseNudgeToxicUser)
		end
	end)
	v_u_162.coreVoiceManager.setVoiceUIVisibility.Event:Connect(function(p205)
		-- upvalues: (copy) v_u_162
		if p205 then
			v_u_162:ShowVoiceUI()
		else
			v_u_162:HideVoiceUI()
		end
	end)
	v_u_162.coreVoiceManager:subscribe("OnVoiceJoin", function()
		-- upvalues: (ref) v_u_40, (copy) v_u_162, (ref) v_u_91, (ref) v_u_48, (ref) v_u_49, (ref) v_u_23, (ref) v_u_182, (copy) v_u_183
		if v_u_40() and v_u_162.hasLeftFTUX then
			v_u_162.hasLeftFTUX = false
			v_u_162:showJoinVoicePrompt()
			v_u_162.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", v_u_162:GetConnectDisconnectAnalyticsData())
		elseif v_u_162:IsSeamlessVoice() then
			v_u_162:showJoinVoicePrompt()
			v_u_162:SetVoiceConnectCookieValue(true)
		else
			v_u_162:showPrompt(v_u_91.VoiceConsentAcceptedToast)
		end
		if v_u_48() and v_u_162.CaptureService:IsCapturingVideo() then
			if v_u_49() then
				v_u_23:MuteAll("Capture")
				v_u_162:HideVoiceUI()
			else
				v_u_162:MuteAll(true, "Capture")
				v_u_162:HideVoiceUI()
			end
		end
		if v_u_182 then
			local v206 = v_u_162:GetConnectDisconnectAnalyticsData()
			v206.connectionSource = v_u_162.pendingConnectionSource
			v_u_162.pendingConnectionSource = nil
			v_u_162.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v206)
			v_u_162.voiceConnectEventReportedForActiveSession = true
			v_u_182 = false
			v_u_183:Disconnect()
		end
	end)
	return v_u_162
end
function v_u_131.subscribe(p207, p208, p209) -- name: subscribe
	return p207.coreVoiceManager:subscribe(p208, p209)
end
function v_u_131.unsubscribe(p210, p211, p212) -- name: unsubscribe
	p210.coreVoiceManager:unsubscribe(p211, p212)
end
function v_u_131._reportJoinFailed(p213, p214, p215) -- name: _reportJoinFailed
	return p213.coreVoiceManager:_reportJoinFailed(p214, p215)
end
function v_u_131._asyncInit(p216) -- name: _asyncInit
	return p216.coreVoiceManager:_asyncInit()
end
function v_u_131.asyncInit(p217) -- name: asyncInit
	return p217.coreVoiceManager:asyncInit()
end
function v_u_131.CheckAudioInputExists(p218) -- name: CheckAudioInputExists
	return p218.coreVoiceManager:CheckAudioInputExists()
end
function v_u_131.getService(p219) -- name: getService
	return p219.service
end
function v_u_131.GetMicManager(p220) -- name: GetMicManager
	return p220.coreVoiceManager and p220.coreVoiceManager.micManager or nil
end
function v_u_131.GetMutedAnyone(p221) -- name: GetMutedAnyone
	return p221.coreVoiceManager:GetMutedAnyone()
end
function v_u_131.RecordGameSettingsOpened(p222) -- name: RecordGameSettingsOpened
	p222.coreVoiceManager:RecordGameSettingsOpened()
end
function v_u_131.ReportVoiceVolumeImpressionsIfNeeded(p223) -- name: ReportVoiceVolumeImpressionsIfNeeded
	p223.coreVoiceManager:ReportVoiceVolumeImpressionsIfNeeded()
end
function v_u_131.GetRequest(p224, p225, p226) -- name: GetRequest
	return p224.coreVoiceManager:GetRequest(p225, p226)
end
function v_u_131.PostRequest(p_u_227, p_u_228, _, p_u_229) -- name: PostRequest
	-- upvalues: (copy) v_u_101
	local function v230()
		-- upvalues: (copy) p_u_227, (copy) p_u_228, (copy) p_u_229, (ref) v_u_101
		return v_u_101:JSONDecode((p_u_227.HttpRbxApiService:PostAsyncFullUrl(p_u_228, p_u_229, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)))
	end
	local v231, v232 = pcall(v230)
	return v231 and v232
end
function v_u_131._GetShowAgeVerificationOverlay(p233, p234) -- name: _GetShowAgeVerificationOverlay
	return p233.coreVoiceManager:_GetShowAgeVerificationOverlay(p234)
end
function v_u_131.simulateVoiceConnectDisconnect(p_u_235) -- name: simulateVoiceConnectDisconnect
	-- upvalues: (copy) v_u_58, (copy) v_u_19
	task.spawn(function()
		-- upvalues: (ref) v_u_58, (copy) p_u_235, (ref) v_u_19
		while true do
			while true do
				task.wait(v_u_58)
				if not p_u_235.voiceUIVisible then
					break
				end
				v_u_19:debug("Hiding Voice")
				p_u_235:HideVoiceUI()
			end
			v_u_19:debug("Showing Voice")
			p_u_235:ShowVoiceUI()
		end
	end)
end
function v_u_131.FetchAgeVerificationOverlay(p236, p237) -- name: FetchAgeVerificationOverlay
	return p236.coreVoiceManager:FetchAgeVerificationOverlay(p237)
end
function v_u_131.FetchPhoneVerificationUpsell(p238, p239, p240, p241) -- name: FetchPhoneVerificationUpsell
	return p238.coreVoiceManager:FetchPhoneVerificationUpsell(p239, p240, p241)
end
function v_u_131.RecordUserSeenModal(p_u_242, p243) -- name: RecordUserSeenModal
	-- upvalues: (copy) v_u_87
	local v_u_244 = "PostRequest"
	return v_u_87(function(...)
		-- upvalues: (copy) p_u_242, (copy) v_u_244
		return p_u_242[v_u_244](p_u_242, ...)
	end, p243)
end
function v_u_131.checkAndUpdateSequence(p245, p246, p247) -- name: checkAndUpdateSequence
	return p245.coreVoiceManager:checkAndUpdateSequence(p246, p247)
end
function v_u_131.onMissedSequence(p248, p249) -- name: onMissedSequence
	return p248.coreVoiceManager:onMissedSequence(p249)
end
function v_u_131.watchSignalR(p250) -- name: watchSignalR
	return p250.coreVoiceManager:watchSignalR()
end
function v_u_131.voicePermissionGranted(p251, p252) -- name: voicePermissionGranted
	return p251.coreVoiceManager:voicePermissionGranted(p252)
end
function v_u_131.GetSignalREvent(p253, p254) -- name: GetSignalREvent
	return p253.coreVoiceManager:GetSignalREvent(p254)
end
function v_u_131.avatarChatUserAndPlaceSettingsValueOfClientFeatures(p255, p256) -- name: avatarChatUserAndPlaceSettingsValueOfClientFeatures
	return p255.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p256)
end
function v_u_131.resolveAvatarChatUserAndPlaceSettings(p257) -- name: resolveAvatarChatUserAndPlaceSettings
	return p257.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings()
end
function v_u_131.EnableVoice(p258) -- name: EnableVoice
	return p258.coreVoiceManager:EnableVoice()
end
function v_u_131._VoiceChatFirstTimeUX(p_u_259, p_u_260) -- name: _VoiceChatFirstTimeUX
	-- upvalues: (copy) v_u_88, (copy) v_u_19, (copy) v_u_40, (copy) v_u_107, (copy) v_u_46, (copy) v_u_68, (copy) v_u_57, (copy) v_u_91
	local v_u_261 = nil
	local v_u_262 = nil
	local function v265()
		-- upvalues: (copy) p_u_260, (ref) v_u_88, (ref) v_u_261, (ref) v_u_262
		local v263 = p_u_260:GetItem(v_u_88.SEAMLESS_VOICE_FTUX_KEY)
		local v264 = p_u_260:GetItem(v_u_88.SEAMLESS_VOICE_STUX_KEY)
		v_u_261 = v263 == "true"
		v_u_262 = v264 == nil and 0 or tonumber(v264)
	end
	if pcall(v265) then
		v_u_19:trace("hasShownFTUX: {}. STUXCount: {}", v_u_261, v_u_262)
		if v_u_261 then
			if v_u_262 < v_u_68 and (not v_u_57 or p_u_259:GetVoiceConnectCookieValue()) then
				v_u_19:debug("Showing STUX")
				p_u_259:showPrompt(v_u_91.JoinVoiceSTUX)
				local function v269()
					-- upvalues: (copy) p_u_260, (ref) v_u_88, (ref) v_u_262
					local v266 = p_u_260
					local v267 = v_u_88.SEAMLESS_VOICE_STUX_KEY
					local v268 = v_u_262 + 1
					v266:SetItem(v267, (tostring(v268)))
					p_u_260:Flush()
				end
				pcall(v269)
			end
		else
			v_u_19:debug("Showing FTUX")
			p_u_259.isShowingFTUX = true
			p_u_259.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", p_u_259:GetConnectDisconnectAnalyticsData())
			if v_u_40() then
				v_u_107.Events.VoiceUIVisibilityChanged(true)
			else
				p_u_259:MuteAll(true, "FTUX")
				p_u_259.muteAllChanged.Event:Once(function()
					-- upvalues: (copy) p_u_259, (copy) p_u_260
					p_u_259:HideFTUX(p_u_260)
					p_u_259.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", p_u_259:GetConnectDisconnectAnalyticsData())
				end)
				p_u_259.talkingChanged.Event:Once(function()
					-- upvalues: (copy) p_u_259, (copy) p_u_260
					p_u_259:HideFTUX(p_u_260)
				end)
				if v_u_46() then
					p_u_259.coreVoiceManager.onPlayerMuteToggled.Event:Once(function()
						-- upvalues: (copy) p_u_259, (copy) p_u_260
						p_u_259:HideFTUX(p_u_260)
					end)
				end
			end
		end
	else
		v_u_19:warning("Failed to read FTUX/STUX from AppStorage")
	end
end
function v_u_131.VoiceChatFirstTimeUX(p_u_270, p_u_271) -- name: VoiceChatFirstTimeUX
	-- upvalues: (copy) v_u_57, (copy) v_u_19, (copy) v_u_56, (copy) v_u_88, (copy) v_u_40
	if v_u_57 and not p_u_270:verifyUniverseAndPlaceCanUseVoice() then
		v_u_19:debug("Universe/place is not voice enabled, do not run FTUX/STUX")
		return
	else
		if not v_u_56 then
			local v272 = p_u_270:FetchAgeVerificationOverlay()
			if type(v272) == "table" and (v272.voiceSettings and v272.voiceSettings.seamlessVoiceStatus ~= v_u_88.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER) then
				v_u_19:debug("User not eligible for FTUX/STUX")
				return
			end
		end
		if v_u_40() then
			v_u_19:debug("Starting FTUX")
			p_u_270:_VoiceChatFirstTimeUX(p_u_271)
		else
			p_u_270:asyncInit():andThen(function()
				-- upvalues: (copy) p_u_270, (ref) v_u_19, (copy) p_u_271
				local v_u_273 = nil
				if p_u_270.service.VoiceChatState and p_u_270.service.VoiceChatState == Enum.VoiceChatState.Joined then
					v_u_19:debug("Starting FTUX")
					p_u_270:_VoiceChatFirstTimeUX(p_u_271)
				end
				local _ = p_u_270.service.StateChanged:Connect(function(_, p274)
					-- upvalues: (ref) v_u_19, (ref) p_u_270, (ref) p_u_271, (ref) v_u_273
					if p274 == Enum.VoiceChatState.Joined then
						v_u_19:debug("Starting FTUX")
						p_u_270:_VoiceChatFirstTimeUX(p_u_271)
						v_u_273:Disconnect()
					end
				end)
			end):catch(function(p275)
				-- upvalues: (ref) v_u_19
				v_u_19:trace("Failed to start FTUX: {}", p275)
			end)
		end
	end
end
function v_u_131.HideFTUX(p276, p_u_277) -- name: HideFTUX
	-- upvalues: (copy) v_u_88, (copy) v_u_40, (copy) v_u_91
	p276.isShowingFTUX = false
	p276.hideFTUXSignal:Fire()
	local function v278()
		-- upvalues: (copy) p_u_277, (ref) v_u_88
		p_u_277:SetItem(v_u_88.SEAMLESS_VOICE_FTUX_KEY, "true")
		p_u_277:Flush()
	end
	pcall(v278)
	if v_u_40() then
		p276.hasLeftFTUX = true
		p276.attemptVoiceRejoin:Fire()
	end
	if not v_u_40() then
		p276:MuteAll(false, "FTUX")
		p276:showPrompt(v_u_91.JoinedVoiceToast)
	end
end
function v_u_131._onUserAndPlaceCanUseVoiceResolved(p_u_279, p280, p281) -- name: _onUserAndPlaceCanUseVoiceResolved
	-- upvalues: (copy) v_u_34, (copy) v_u_21, (copy) v_u_20, (copy) v_u_32, (copy) v_u_93, (copy) v_u_38, (copy) v_u_39, (copy) v_u_91, (copy) v_u_96, (copy) v_u_52, (copy) v_u_53, (copy) v_u_37
	p_u_279.bannedUntil = nil
	if p280 and p280.isBanned then
		if v_u_34 then
			v_u_21:LogFlagLinkedUserLayerExposure(v_u_20.VoiceUserIDLayer)
		end
		if v_u_32 then
			p_u_279.voiceRestrictionController.check("gameJoin", p280)
			return
		end
		local v_u_282 = "GetRequest"
		local v283 = v_u_93(function(...)
			-- upvalues: (copy) p_u_279, (copy) v_u_282
			return p_u_279[v_u_282](p_u_279, ...)
		end)
		if v283 and not v283.informedOfBan then
			if v_u_38() and (v_u_39() and p280.bannedUntil == nil) then
				p_u_279:ShowPlayerModeratedMessage()
			elseif p280.bannedUntil == nil then
				p_u_279:showPrompt(v_u_91.VoiceChatSuspendedPermanent)
			else
				p_u_279.bannedUntil = p280.bannedUntil
				if p280.banReason == v_u_96.NUDGE_V3 then
					if v_u_52() and v_u_53() then
						p_u_279:showPrompt(v_u_91.VoiceChatSuspendedTemporaryBV2)
					else
						p_u_279:showPrompt(v_u_91.VoiceChatSuspendedTemporaryB)
					end
				else
					p_u_279:showPrompt(v_u_91.VoiceChatSuspendedTemporary)
				end
			end
		end
		if v283 and v283.informedOfBan then
			p_u_279:ShowPlayerModeratedMessage(true)
			return
		end
	else
		if p_u_279.runService:IsStudio() and (p280 and not p280.isVoiceEnabled) then
			p_u_279:showPrompt(v_u_91.User)
			return
		end
		if p_u_279.runService:IsStudio() and (p281 and not p281.isPlaceEnabledForVoice) then
			local v284 = v_u_91.Place
			local v285
			if v_u_37() then
				v285 = table.concat(p281.reasons or {}, "") or nil
			else
				v285 = nil
			end
			p_u_279:showPrompt(v284, v285)
		end
	end
end
function v_u_131.ChangeVoiceJoinProgress(p286, p287) -- name: ChangeVoiceJoinProgress
	return p286.coreVoiceManager:ChangeVoiceJoinProgress(p287)
end
function v_u_131.GetVoiceJoinProgress(p288) -- name: GetVoiceJoinProgress
	return p288.coreVoiceManager.VoiceJoinProgress
end
function v_u_131.UserOnlyEligibleForVoice(p289) -- name: UserOnlyEligibleForVoice
	return p289.coreVoiceManager:UserOnlyEligibleForVoice()
end
function v_u_131.UserOnlyEligibleForVoiceViaOverlay(p290) -- name: UserOnlyEligibleForVoiceViaOverlay
	return p290.coreVoiceManager:UserOnlyEligibleForVoiceViaOverlay()
end
function v_u_131.UserVoiceEnabled(p291) -- name: UserVoiceEnabled
	return p291.coreVoiceManager:UserVoiceEnabled()
end
function v_u_131.UserInInExperienceUpsellTreatment(p292) -- name: UserInInExperienceUpsellTreatment
	return p292.coreVoiceManager:UserInInExperienceUpsellTreatment()
end
function v_u_131.UserEligibleForInExperienceUpsell(p293) -- name: UserEligibleForInExperienceUpsell
	return p293.coreVoiceManager:UserEligibleForInExperienceUpsell()
end
function v_u_131.ShowInExperienceVoiceUpsell(p294, p295) -- name: ShowInExperienceVoiceUpsell
	-- upvalues: (copy) v_u_78
	local v296 = p294:FetchAgeVerificationOverlay()
	if not v_u_78 or type(v296) == "table" then
		local v297 = v296.showVoiceInExperienceUpsellVariant
		p294:SetInExpUpsellEntrypoint(p295)
		p294:showPrompt((p294:GetInExpUpsellPromptFromEnum(v297)))
	end
end
function v_u_131.ShowInExperiencePhoneVoiceUpsell(p_u_298, p_u_299, p_u_300) -- name: ShowInExperiencePhoneVoiceUpsell
	-- upvalues: (copy) v_u_110, (copy) v_u_81, (copy) v_u_111, (copy) v_u_88, (copy) v_u_91
	p_u_298:SetInExpUpsellEntrypoint(p_u_299)
	local v301 = v_u_110.openPhoneUpsell
	local v306 = {
		["origin"] = "inExperience",
		["eventContext"] = "verificationUpsell",
		["entryConfig"] = nil,
		["onSuccessBeforeToast"] = nil,
		["onSuccess"] = nil,
		["closeUpsell"] = nil,
		["entryConfig"] = {
			["titleKey"] = "Feature.VerificationUpsell.Heading.UnlockVoiceChat",
			["descriptionKey"] = "Feature.VerificationUpsell.Description.UnlockVoiceChatBody",
			["buttonKey"] = nil,
			["extraButtonConfig"] = nil,
			["legalTextKey"] = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2",
			["buttonKey"] = v_u_81() and "Feature.AccountSettings.Action.Verify" or "Feature.VerificationUpsell.Action.AddPhoneNumber",
			["extraButtonConfig"] = {
				["extraButtonKey"] = "Feature.VerificationUpsell.Action.NotNow"
			}
		},
		["onSuccessBeforeToast"] = function() -- name: onSuccessBeforeToast
			-- upvalues: (copy) p_u_298, (ref) v_u_111, (copy) p_u_300
			p_u_298.coreVoiceManager:DisablePhoneVerificationUpsell()
			local v_u_302 = p_u_298
			local v_u_303 = "PostRequest"
			v_u_111(function(...)
				-- upvalues: (copy) v_u_302, (copy) v_u_303
				return v_u_302[v_u_303](v_u_302, ...)
			end, p_u_300, os.time(), false)
		end,
		["onSuccess"] = function() -- name: onSuccess
			-- upvalues: (copy) p_u_298, (ref) v_u_88
			if p_u_298.pendingConnectionSource == nil then
				p_u_298.pendingConnectionSource = v_u_88.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			p_u_298:EnableVoice()
		end,
		["closeUpsell"] = function() -- name: closeUpsell
			-- upvalues: (copy) p_u_299, (ref) v_u_88, (copy) p_u_298, (ref) v_u_91, (ref) v_u_111, (copy) p_u_300
			if p_u_299 ~= v_u_88.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				p_u_298:showPrompt(v_u_91.VoiceConsentDeclinedToast)
			end
			local v_u_304 = p_u_298
			local v_u_305 = "PostRequest"
			v_u_111(function(...)
				-- upvalues: (copy) v_u_304, (copy) v_u_305
				return v_u_304[v_u_305](v_u_304, ...)
			end, p_u_300, os.time(), true)
		end
	}
	v301(v306)
end
function v_u_131.DisablePhoneVerificationUpsell(p307) -- name: DisablePhoneVerificationUpsell
	p307.coreVoiceManager:DisablePhoneVerificationUpsell()
end
function v_u_131.SetInExpUpsellEntrypoint(p308, p309) -- name: SetInExpUpsellEntrypoint
	p308.inExpUpsellEntrypoint = p309
end
function v_u_131.userAndPlaceCanUseVoice(p310) -- name: userAndPlaceCanUseVoice
	return p310.coreVoiceManager:userAndPlaceCanUseVoice()
end
function v_u_131.verifyUniverseAndPlaceCanUseVoice(p311) -- name: verifyUniverseAndPlaceCanUseVoice
	return p311.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice()
end
function v_u_131.GetVoiceConnectCookieValue(p312) -- name: GetVoiceConnectCookieValue
	return p312.coreVoiceManager:GetVoiceConnectCookieValue()
end
function v_u_131.GetVoiceConnectCookie(p313) -- name: GetVoiceConnectCookie
	return p313.coreVoiceManager:GetVoiceConnectCookie()
end
function v_u_131.SetVoiceConnectCookieValue(p314, p315) -- name: SetVoiceConnectCookieValue
	return p314.coreVoiceManager:SetVoiceConnectCookieValue(p315)
end
function v_u_131.GetVoiceRewarmCookie(p316) -- name: GetVoiceRewarmCookie
	return p316.coreVoiceManager:GetVoiceRewarmCookie()
end
function v_u_131.SetVoiceRewarmCookie(p317, p318) -- name: SetVoiceRewarmCookie
	p317.coreVoiceManager:SetVoiceRewarmCookie(p318)
end
function v_u_131.ShouldRewarmUser(p319) -- name: ShouldRewarmUser
	return p319.coreVoiceManager:ShouldRewarmUser()
end
function v_u_131.ConsumeVoiceRewarm(p320) -- name: ConsumeVoiceRewarm
	p320.coreVoiceManager:ConsumeVoiceRewarm()
end
function v_u_131.SetNewUserFTUXCookieValue(p321, p322) -- name: SetNewUserFTUXCookieValue
	return p321.coreVoiceManager:SetNewUserFTUXCookieValue(p322)
end
function v_u_131.ShowPlayerModeratedMessage(p_u_323, p324) -- name: ShowPlayerModeratedMessage
	-- upvalues: (copy) v_u_34, (copy) v_u_21, (copy) v_u_20, (copy) v_u_32, (copy) v_u_92, (copy) v_u_100, (copy) v_u_91, (copy) v_u_96, (copy) v_u_52, (copy) v_u_53
	if v_u_34 then
		v_u_21:LogFlagLinkedUserLayerExposure(v_u_20.VoiceUserIDLayer)
	end
	if v_u_32 then
		p_u_323.voiceRestrictionController.check("removedFromVoice")
		return
	else
		local v_u_325 = "GetRequest"
		local v326 = v_u_92(function(...)
			-- upvalues: (copy) p_u_323, (copy) v_u_325
			return p_u_323[v_u_325](p_u_323, ...)
		end)
		if v326 and v326.isBanned then
			p_u_323.banReason = v326.banReason
			if v326.bannedUntil == nil then
				p_u_323:showPrompt(v_u_91.VoiceChatSuspendedPermanent)
				return
			else
				p_u_323.bannedUntil = v326.bannedUntil
				if p324 then
					p_u_323:showPrompt(v_u_91.VoiceChatSuspendedTemporaryToast)
					return
				elseif p_u_323.banReason == v_u_96.NUDGE_V3 then
					if v_u_52() and v_u_53() then
						p_u_323:showPrompt(v_u_91.VoiceChatSuspendedTemporaryBV2)
					else
						p_u_323:showPrompt(v_u_91.VoiceChatSuspendedTemporaryB)
					end
				else
					p_u_323:showPrompt(v_u_91.VoiceChatSuspendedTemporary)
					return
				end
			end
		else
			p_u_323:_reportJoinFailed("PlayerModeratedBadState", v_u_100.ERROR)
			return
		end
	end
end
function v_u_131.GetVoiceRestrictionState(p327, p328) -- name: GetVoiceRestrictionState
	return p327.voiceRestrictionController.getPresentationState(p328)
end
function v_u_131.ShowVoiceRestriction(p329) -- name: ShowVoiceRestriction
	p329.voiceRestrictionController.check("micTap")
end
function v_u_131._onUFRInterventionReceived(p330, p331) -- name: _onUFRInterventionReceived
	-- upvalues: (copy) v_u_30, (copy) v_u_28, (copy) v_u_88
	if p331.type == v_u_30.NotificationDialogType.ChatTimeout then
		local v332, v333 = v_u_28(p331, DateTime.now().UnixTimestamp)
		if v332 then
			p330.pendingDisconnectReason = v_u_88.VOICE_DISCONNECT_REASON.MODERATED
			p330.voiceRestrictionController.applyUFRTimeout(v333)
			p330.coreVoiceManager:LeaveVoiceForRestriction()
		end
	else
		return
	end
end
function v_u_131.CheckCallState(p334) -- name: CheckCallState
	return p334.coreVoiceManager:CheckCallState()
end
function v_u_131.ShowVoiceChatLoadingMessage(p335) -- name: ShowVoiceChatLoadingMessage
	-- upvalues: (copy) v_u_91
	p335:showPrompt(v_u_91.VoiceLoading)
end
function v_u_131.requestMicPermission(p336) -- name: requestMicPermission
	return p336.coreVoiceManager:requestMicPermission()
end
function v_u_131.canUseServiceAsync(p337) -- name: canUseServiceAsync
	return p337.coreVoiceManager:canUseServiceAsync()
end
function v_u_131.canUseService(p338) -- name: canUseService
	-- upvalues: (copy) v_u_102, (copy) v_u_101, (copy) v_u_126
	if p338.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
		return false
	end
	local function v339()
		-- upvalues: (ref) v_u_102, (ref) v_u_101
		return v_u_101:JSONDecode((v_u_102:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)))
	end
	local v340, v341 = pcall(v339)
	if v340 then
		v340 = v341.isVoiceEnabled
	end
	if not v340 then
		p338.available = v_u_126.UserNotAvailable
	end
	return v340
end
function v_u_131.ensureInitialized(p342, p343) -- name: ensureInitialized
	return p342.coreVoiceManager:ensureInitialized(p343)
end
function v_u_131.GetSessionId(p344) -- name: GetSessionId
	return p344.coreVoiceManager:GetSessionId()
end
function v_u_131.GetChannelId(p345) -- name: GetChannelId
	return p345.coreVoiceManager:GetChannelId()
end
function v_u_131.JoinWithVoiceMuteData(p346, p347) -- name: JoinWithVoiceMuteData
	return p346.coreVoiceManager:JoinWithVoiceMuteData(p347)
end
function v_u_131.calculateBanDuration(_, p348, p349) -- name: calculateBanDuration
	local v350 = (p349 - p348) / 60
	return math.ceil(v350)
end
function v_u_131.getBanEnd(p351, p352, p353) -- name: getBanEnd
	return {
		["minutes"] = p351:calculateBanDuration(p352, p353),
		["absoluteSeconds"] = p353
	}
end
function v_u_131.ShowVoiceUI(p354) -- name: ShowVoiceUI
	-- upvalues: (copy) v_u_107
	p354.voiceUIVisible = true
	p354.showVoiceUI:Fire()
	if v_u_107.Events.VoiceUIVisibilityChanged then
		v_u_107.Events.VoiceUIVisibilityChanged(true)
	end
end
function v_u_131.HideVoiceUI(p355) -- name: HideVoiceUI
	-- upvalues: (copy) v_u_107
	p355.voiceUIVisible = false
	p355.hideVoiceUI:Fire()
	if v_u_107.Events.VoiceUIVisibilityChanged then
		v_u_107.Events.VoiceUIVisibilityChanged(false)
	end
end
function v_u_131.createPromptInstance(p_u_356, p357, p358) -- name: createPromptInstance
	-- upvalues: (copy) v_u_37, (copy) v_u_91, (copy) v_u_52, (copy) v_u_31, (copy) v_u_4, (copy) v_u_5, (copy) v_u_70, (copy) v_u_71, (copy) v_u_83, (copy) v_u_108, (copy) v_u_109, (copy) v_u_84, (copy) v_u_7, (copy) v_u_89, (copy) v_u_100, (copy) v_u_94, (copy) v_u_88, (copy) v_u_59, (copy) v_u_41, (copy) v_u_19, (copy) v_u_10
	if p_u_356.promptSignal then
		p_u_356.promptSignal:Destroy()
		p_u_356.promptSignal = nil
	end
	p_u_356.promptSignal = Instance.new("BindableEvent")
	local v359
	if v_u_37() then
		v359 = p_u_356.errorText
	else
		v359 = nil
	end
	local v360 = p358 == v_u_91.VoiceChatSuspendedTemporaryB
	if v_u_52() then
		v360 = v360 or p358 == v_u_91.VoiceChatSuspendedTemporaryBV2
	end
	local v361 = not v_u_31 and "" or nil
	if p_u_356.bannedUntil ~= nil then
		if v_u_31 then
			v361 = p_u_356:getBanEnd(v_u_4:GetServerTimeNow(), p_u_356.bannedUntil.Seconds)
		elseif v360 then
			local v362 = p_u_356:calculateBanDuration(DateTime.now().UnixTimestamp, p_u_356.bannedUntil.Seconds)
			v361 = tostring(v362)
		else
			v361 = DateTime.fromUnixTimestamp(p_u_356.bannedUntil.Seconds):FormatLocalTime("l LT", v_u_5.RobloxLocaleId)
		end
	end
	local v363 = p358 ~= v_u_91.VoiceToxicityModal and p358 ~= v_u_91.VoiceToxicityToast and v_u_52()
	if v363 then
		v363 = p358 == v_u_91.VoiceToxicityModalV2 and true or p358 == v_u_91.VoiceToxicityToastV2
	end
	local v364 = (p358 == v_u_91.VoiceConsentModalV1 or p358 == v_u_91.VoiceConsentModalV2) and true or p358 == v_u_91.VoiceConsentModalV3
	local v_u_365 = false
	local v_u_366 = nil
	if v_u_70() and (p358 == v_u_91.DevicePermissionsModal and p_u_356.settingsAppAvailable == nil) then
		if v_u_71 then
			for _ = 0, v_u_83 do
				local v369 = task.spawn(function()
					-- upvalues: (ref) v_u_365, (ref) v_u_366, (ref) v_u_108, (ref) v_u_109
					local v367, v368 = v_u_108:supportsSwitchToSettingsApp(v_u_109.Microphone):await()
					v_u_365 = v367
					v_u_366 = v368
				end)
				task.wait(v_u_84 / 1000)
				task.cancel(v369)
				if v_u_366 == nil then
					continue
				end
			end
		else
			v_u_365, v_u_366 = v_u_108:supportsSwitchToSettingsApp(v_u_109.Microphone):await()
		end
		p_u_356.settingsAppAvailable = v_u_365 and v_u_366
	end
	local v370 = v_u_7.mount
	local v371 = v_u_7.createElement
	local v372 = v_u_89
	local v373 = {
		["Analytics"] = v_u_100.new(),
		["promptSignal"] = p_u_356.promptSignal.Event,
		["bannedUntil"] = v361,
		["policyMapper"] = p_u_356.policyMapper,
		["errorText"] = v359,
		["onReadyForSignal"] = p357,
		["VoiceChatServiceManager"] = p_u_356
	}
	local v374
	if p_u_356.settingsAppAvailable == nil then
		v374 = false
	else
		v374 = p_u_356.settingsAppAvailable
	end
	v373.settingsAppAvailable = v374
	local v375
	if p358 == v_u_91.VoiceChatSuspendedTemporary or v360 then
		v375 = function()
			-- upvalues: (ref) v_u_94, (copy) p_u_356
			local v_u_376 = p_u_356
			local v_u_377 = "PostRequest"
			v_u_94(function(...)
				-- upvalues: (copy) v_u_376, (copy) v_u_377
				return v_u_376[v_u_377](v_u_376, ...)
			end, true)
		end
	else
		v375 = v363 and function()
			-- upvalues: (copy) p_u_356
			p_u_356.Analytics:reportClosedNudge(p_u_356:GetNudgeAnalyticsData())
		end or (v364 and function()
			-- upvalues: (copy) p_u_356, (ref) v_u_88
			p_u_356:RecordUserSeenModal(v_u_88.MODAL_IDS.IN_EXP_UPSELL)
		end or nil)
	end
	v373.onContinueFunc = v375
	local v378
	if v363 then
		v378 = function()
			-- upvalues: (copy) p_u_356
			p_u_356.Analytics:reportAcknowledgedNudge(p_u_356:GetNudgeAnalyticsData())
		end
	elseif v_u_59 or (not v_u_41() or p358 ~= v_u_91.Permission) then
		if v_u_41() and (v_u_70() and p358 == v_u_91.DevicePermissionsModal) then
			v378 = function()
				-- upvalues: (ref) v_u_19, (copy) p_u_356, (ref) v_u_108, (ref) v_u_109
				v_u_19:debug("Settings app available: {}", p_u_356.settingsAppAvailable)
				p_u_356.Analytics:reportDevicePermissionsModalEvent(p_u_356.settingsAppAvailable and "OpenedSettings" or "Acknowledged", p_u_356:GetSessionId(), p_u_356:GetInExpUpsellAnalyticsData())
				if p_u_356.settingsAppAvailable then
					v_u_19:debug("Switching to settings app")
					v_u_108:switchToSettingsApp(v_u_109.Microphone):andThen(function()
						-- upvalues: (ref) v_u_19
						v_u_19:debug("Successfully switched to settings app")
					end):catch(function()
						-- upvalues: (ref) v_u_19
						v_u_19:error("Error switching to settings app")
					end)
				else
					v_u_19:debug("Current platform does not support switching to settings app")
				end
			end
		else
			v378 = v360 and function()
				-- upvalues: (copy) p_u_356
				p_u_356:reportBanMessage("Understood")
				p_u_356.Analytics:reportBanMessageEvent("Understood")
			end or (v364 and function()
				-- upvalues: (copy) p_u_356, (ref) v_u_88
				p_u_356.Analytics:reportInExpConsent("accepted", p_u_356.inExpUpsellEntrypoint, p_u_356:GetInExpUpsellAnalyticsData())
				if p_u_356.pendingConnectionSource == nil then
					p_u_356.pendingConnectionSource = v_u_88.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
				end
				p_u_356:EnableVoice()
			end or nil)
		end
	else
		v378 = function()
			-- upvalues: (ref) v_u_109, (ref) v_u_108, (ref) v_u_19
			local v379 = v_u_109.Microphone
			local v380 = v_u_108:supportsSwitchToSettingsApp(v379):await()
			v_u_19:debug("Settings app available: {}", v380)
			if v380 then
				v_u_19:debug("Switching to settings app")
				v_u_108:switchToSettingsApp(v379):andThen(function()
					-- upvalues: (ref) v_u_19
					v_u_19:debug("Successfully switched to settings app")
				end):catch(function()
					-- upvalues: (ref) v_u_19
					v_u_19:error("Error switching to settings app")
				end)
			else
				v_u_19:debug("Current platform does not support switching to settings app")
			end
		end
	end
	v373.onPrimaryActivated = v378
	local v381
	if p358 == v_u_91.VoiceToxicityModal or v_u_52() and p358 == v_u_91.VoiceToxicityModalV2 then
		v381 = function()
			-- upvalues: (copy) p_u_356
			p_u_356:ShowVoiceToxicityFeedbackToast()
			p_u_356.Analytics:reportDeniedNudge(p_u_356:GetNudgeAnalyticsData())
		end
	elseif v363 then
		v381 = function()
			-- upvalues: (copy) p_u_356
			p_u_356.Analytics:reportDeniedNudge(p_u_356:GetNudgeAnalyticsData())
		end
	elseif v360 then
		v381 = function()
			-- upvalues: (copy) p_u_356
			p_u_356:ShowVoiceToxicityFeedbackToast()
			p_u_356:reportBanMessage("Denied")
			p_u_356.Analytics:reportBanMessageEvent("Denied")
		end
	elseif v364 then
		v381 = function()
			-- upvalues: (copy) p_u_356, (ref) v_u_88, (ref) v_u_91
			p_u_356.Analytics:reportInExpConsent("denied", p_u_356.inExpUpsellEntrypoint, p_u_356:GetInExpUpsellAnalyticsData())
			if p_u_356.inExpUpsellEntrypoint ~= v_u_88.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				p_u_356:showPrompt(v_u_91.VoiceConsentDeclinedToast)
			end
		end
	else
		v381 = p358 == v_u_91.DevicePermissionsModal and function()
			-- upvalues: (copy) p_u_356
			p_u_356.Analytics:reportDevicePermissionsModalEvent("Denied", p_u_356:GetSessionId(), p_u_356:GetInExpUpsellAnalyticsData())
		end or nil
	end
	v373.onSecondaryActivated = v381
	p_u_356.voiceChatPromptInstance = v370(v371(v372, v373), v_u_10, "RobloxVoiceChatPromptGui")
end
function v_u_131.showPrompt(p_u_382, p_u_383, p384) -- name: showPrompt
	-- upvalues: (copy) v_u_37, (copy) v_u_19
	if v_u_37() then
		p_u_382.errorText = p384 or nil
	end
	p_u_382:createPromptInstance(function()
		-- upvalues: (ref) v_u_19, (copy) p_u_383, (copy) p_u_382
		v_u_19:debug("Show Prompt: {}", p_u_383)
		p_u_382.promptSignal:fire(p_u_383)
	end, p_u_383)
end
function v_u_131.showJoinVoicePrompt(p385) -- name: showJoinVoicePrompt
	-- upvalues: (copy) v_u_91, (copy) v_u_16, (copy) v_u_88
	p385:showPrompt(v_u_91.UnifiedJoinVoiceToast)
	local function v386()
		-- upvalues: (ref) v_u_16, (ref) v_u_88
		v_u_16:SetItem(v_u_88.VOICE_WITH_TC_TOAST_KEY, "true")
		v_u_16:Flush()
	end
	pcall(v386)
end
function v_u_131.CheckAndShowPermissionPrompt(p_u_387) -- name: CheckAndShowPermissionPrompt
	-- upvalues: (copy) v_u_9, (copy) v_u_91, (copy) v_u_6, (copy) v_u_36
	local function v_u_390() -- name: showPrompt
		-- upvalues: (copy) p_u_387, (ref) v_u_9, (ref) v_u_91, (ref) v_u_6
		local v388 = p_u_387.userEligible
		if p_u_387.voiceEnabled or v388 then
			return p_u_387.PermissionsService:hasPermissions({ v_u_9.Permissions.MICROPHONE_ACCESS }):andThen(function(p389)
				-- upvalues: (ref) v_u_9, (ref) p_u_387, (ref) v_u_91
				if p389 and p389.status == v_u_9.Status.DENIED then
					p_u_387:showPrompt(v_u_91.Permission)
				end
			end)
		else
			return v_u_6.resolve()
		end
	end
	if v_u_36() then
		return v_u_390()
	else
		return p_u_387:asyncInit():andThen(function() end):catch(function()
			-- upvalues: (copy) v_u_390
			return v_u_390()
		end)
	end
end
function v_u_131.showDataConsentToast(p391) -- name: showDataConsentToast
	-- upvalues: (copy) v_u_45, (copy) v_u_98, (copy) v_u_97, (copy) v_u_88, (copy) v_u_91
	local v392 = p391:FetchAgeVerificationOverlay()
	local v393
	if v_u_45() then
		v393 = v_u_98.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false
	else
		v393 = false
	end
	local v394, v395
	if type(v392) == "table" then
		if v392.voiceSettings then
			v394 = v392.voiceSettings.seamlessVoiceStatus
		else
			v394 = v_u_97.Invalid
		end
		v395 = v392.showDataConsentToast
	else
		v394 = v_u_97.Invalid
		v395 = false
	end
	if v395 and v393 then
		if type(p391:_GetShowAgeVerificationOverlay()) == "table" then
			v395 = p391:_GetShowAgeVerificationOverlay().showDataConsentToast
		else
			v395 = false
		end
	end
	if v394 == v_u_97.EnabledExistingUser and (v395 and v393) then
		p391:RecordUserSeenModal(v_u_88.MODAL_IDS.DATA_CONSENT_TOAST)
		return p391:showPrompt(v_u_91.VoiceDataConsentOptOutToast)
	end
end
function v_u_131.CheckAndShowNotAudiblePrompt(p_u_396) -- name: CheckAndShowNotAudiblePrompt
	-- upvalues: (copy) v_u_91, (copy) v_u_6
	if game:GetEngineFeature("VoiceChatSupported") then
		return p_u_396:asyncInit():andThen(function()
			-- upvalues: (copy) p_u_396, (ref) v_u_91
			if UserSettings().GameSettings.MasterVolume == 0 then
				p_u_396:showPrompt(v_u_91.NotAudible)
			end
		end):catch(function() end)
	else
		return v_u_6.resolve()
	end
end
function v_u_131.ShowNotAudiblePromptVoiceChatVolume(p_u_397) -- name: ShowNotAudiblePromptVoiceChatVolume
	-- upvalues: (copy) v_u_76, (copy) v_u_75, (copy) v_u_6, (copy) v_u_123, (copy) v_u_3, (copy) v_u_91
	if v_u_76 and v_u_75 then
		if game:GetEngineFeature("VoiceChatSupported") then
			return p_u_397:asyncInit():andThen(function()
				-- upvalues: (ref) v_u_123, (ref) v_u_3, (copy) p_u_397, (ref) v_u_91
				if UserSettings().GameSettings.MasterVolume > 0 and (v_u_123.isVoiceChatVolumeSliderVisible(true, v_u_3.UseNewAudioApi) and UserSettings().GameSettings.VoiceChatVolume == 0) then
					p_u_397:showPrompt(v_u_91.NotAudibleVoiceChatVolume)
				end
			end):catch(function() end)
		else
			return v_u_6.resolve()
		end
	else
		return v_u_6.resolve()
	end
end
function v_u_131.InitialJoinFailedPrompt(p398) -- name: InitialJoinFailedPrompt
	-- upvalues: (copy) v_u_19, (copy) v_u_99, (copy) v_u_91
	v_u_19:debug("JoinByGroupIdToken returns false")
	if not v_u_99 then
		p398:showPrompt(v_u_91.Retry)
	end
end
function v_u_131.ShowVoiceToxicityFeedbackToast(p399) -- name: ShowVoiceToxicityFeedbackToast
	-- upvalues: (copy) v_u_19, (copy) v_u_91
	v_u_19:debug("Sending feedback toast")
	p399:showPrompt(v_u_91.VoiceToxicityFeedbackToast)
end
function v_u_131.GetNudgeAnalyticsData(p400) -- name: GetNudgeAnalyticsData
	-- upvalues: (copy) v_u_2
	return v_u_2.LocalPlayer.UserId, p400:GetSessionId()
end
function v_u_131.GetInExpUpsellAnalyticsData(_) -- name: GetInExpUpsellAnalyticsData
	-- upvalues: (copy) v_u_43, (copy) v_u_15
	local v401 = not v_u_43 and "" or v_u_15:GetPlaySessionId()
	return game.GameId, game.PlaceId, v401
end
function v_u_131.reportBanMessage(p402, p403) -- name: reportBanMessage
	-- upvalues: (copy) v_u_2
	p402.Analytics:reportBanMessageEventV2(p403, p402.banReason, v_u_2.LocalPlayer.UserId, not p402.service and "" or p402.previousSessionId)
end
function v_u_131.reportJoinVoiceUpsellEvent(p404, p405, p406, p407) -- name: reportJoinVoiceUpsellEvent
	-- upvalues: (copy) v_u_15, (copy) v_u_77
	local v408 = v_u_15:GetPlaySessionId()
	if v_u_77 then
		p404.Analytics:reportJoinVoiceUpsellEvent(p405, v408, p404:UserVoiceEnabled(), p406, p407)
	else
		p404.Analytics:reportJoinVoiceUpsellEvent(p405, v408, p404:UserVoiceEnabled())
	end
end
function v_u_131.reportVoiceRewarmShown(p409) -- name: reportVoiceRewarmShown
	if p409.joinVoiceButtonContext == "Rewarm" and not p409.hasReportedRewarmShown then
		p409.hasReportedRewarmShown = true
		p409.Analytics:reportVoiceRewarmShown(p409:GetVoiceRewarmCookie() ~= "")
	end
end
function v_u_131.SetAndSyncActive(p410, p411, p412) -- name: SetAndSyncActive
	p410.coreVoiceManager:SetAndSyncActive(p411, p412)
end
function v_u_131.CreateAudioDeviceData(p413, p414) -- name: CreateAudioDeviceData
	return p413.coreVoiceManager:CreateAudioDeviceData(p414)
end
function v_u_131.onInstanceAdded(p415, p416) -- name: onInstanceAdded
	return p415.coreVoiceManager:onInstanceAdded(p416)
end
function v_u_131.UpdateAudioDeviceInputDebugger(p417) -- name: UpdateAudioDeviceInputDebugger
	-- upvalues: (copy) v_u_51, (copy) v_u_19, (copy) v_u_7, (copy) v_u_90, (copy) v_u_10
	if v_u_51 then
		if not p417.voiceDebuggerInstance then
			v_u_19:debug("Mounting AudioDeviceInput Debugger")
			p417.voiceDebuggerInstance = v_u_7.mount(v_u_7.createElement(v_u_90, {
				["instances"] = p417.audioDevices,
				["mutedPlayers"] = p417.mutedPlayers
			}), v_u_10, "RobloxVoiceChatPromptGui")
			return
		end
		v_u_7.update(p417.voiceDebuggerInstance, v_u_7.createElement(v_u_90, {
			["instances"] = p417.audioDevices,
			["mutedPlayers"] = p417.mutedPlayers
		}))
	end
end
function v_u_131.AddReverseNudgeToxicUser(p_u_418, p_u_419, p420, p_u_421) -- name: AddReverseNudgeToxicUser
	-- upvalues: (copy) v_u_42
	p420(p_u_419, "iconColorChange")
	local v422 = p_u_418.reverseNudgeToxicUserRemovalCallbacks[p_u_419]
	if v422 ~= nil then
		task.cancel(v422)
	end
	local v423 = task.delay(v_u_42(), function()
		-- upvalues: (copy) p_u_421, (copy) p_u_419, (copy) p_u_418
		p_u_421(p_u_419)
		p_u_418.reverseNudgeToxicUserRemovalCallbacks[p_u_419] = nil
	end)
	p_u_418.reverseNudgeToxicUserRemovalCallbacks[p_u_419] = v423
end
function v_u_131.onInstanceRemove(p424, p425) -- name: onInstanceRemove
	return p424.coreVoiceManager:onInstanceRemove(p425)
end
function v_u_131.hookupAudioDeviceInputListener(p426) -- name: hookupAudioDeviceInputListener
	return p426.coreVoiceManager:hookupAudioDeviceInputListener()
end
function v_u_131.ToggleMutePlayer(p427, p428, p429) -- name: ToggleMutePlayer
	return p427.coreVoiceManager:ToggleMutePlayer(p428, p429)
end
function v_u_131.MuteAll(p430, p431, p432) -- name: MuteAll
	return p430.coreVoiceManager:MuteAll(p431, p432)
end
function v_u_131.ToggleMuteSome(p433, p434, p435, p436, p437) -- name: ToggleMuteSome
	return p433.coreVoiceManager:ToggleMuteSome(p434, p435, p436, p437)
end
function v_u_131.FireMuteNonFriendsEvent(p438) -- name: FireMuteNonFriendsEvent
	p438.mutedNonFriends:Fire()
end
function v_u_131.EnsureCorrectMuteState(p439, p440, p441) -- name: EnsureCorrectMuteState
	-- upvalues: (copy) v_u_3, (copy) v_u_121, (copy) v_u_2
	local v442 = {}
	for _, v443 in p440 do
		local v444 = p439.participants[tostring(v443)]
		if not v444 or v444.isMutedLocally == p441 then
			continue
		end
		if v_u_3.UseNewAudioApi then
			v442[v443] = true
			p439.mutedPlayers[v443] = p441
		else
			p439.service:SubscribePause(v443, p441)
		end
		v444.isMutedLocally = p441
		p439.participantsUpdate:Fire(p439.participants)
	end
	if v_u_3.UseNewAudioApi then
		for v445 in p439.audioDevices do
			if not (v445.Player and v442[v445.Player.UserId]) then
				continue
			end
			if v_u_121 and v445.Player ~= v_u_2.LocalPlayer then
				v445.MutedByLocalUser = p441
			else
				v445.Active = not p441
			end
		end
	end
end
function v_u_131.FireUserAgencySelectedEvent(p446, p447) -- name: FireUserAgencySelectedEvent
	p446.userAgencySelected:Fire(p447)
end
function v_u_131.ParticipantStateToIcon(_, p448, p449) -- name: ParticipantStateToIcon
	-- upvalues: (copy) v_u_124
	local v450 = v_u_124.INACTIVE
	if p448.subscriptionCompleted then
		if p448.isMutedLocally then
			v450 = v_u_124.LOCAL_MUTED
		elseif p448.isMuted then
			v450 = v_u_124.MUTED
		elseif p448.isSignalActive then
			v450 = v_u_124.TALKING
		end
	else
		v450 = v_u_124.CONNECTING
	end
	return getIcon(v450, p449)
end
function v_u_131.VoiceStateToIcon(_, p451, p452, p453) -- name: VoiceStateToIcon
	return getIcon(p451, p452, p453)
end
function v_u_131.GetIcon(_, p454, p455) -- name: GetIcon
	return getIconSrc(p454, p455)
end
function v_u_131.JoinVoice(p_u_456, p457) -- name: JoinVoice
	-- upvalues: (copy) v_u_77, (copy) v_u_74, (copy) v_u_72, (copy) v_u_73, (copy) v_u_19, (copy) v_u_78, (copy) v_u_88, (copy) v_u_40, (copy) v_u_16, (copy) v_u_62, (copy) v_u_35, (copy) v_u_91, (copy) v_u_80, (copy) v_u_69, (copy) v_u_114, (copy) v_u_115, (copy) v_u_116, (copy) v_u_117
	local v458 = nil
	local v459
	if v_u_77 then
		v459 = p_u_456.joinVoiceButtonContext
		p_u_456.joinVoiceButtonContext = nil
	else
		v459 = nil
	end
	local v460
	if v_u_74 and v459 == "Rewarm" then
		v460 = p_u_456:GetVoiceRewarmCookie() ~= ""
	else
		v460 = nil
	end
	if v_u_72 and not v_u_73 then
		v_u_19:debug("Consuming voice re-warm cookie on JoinVoice")
		p_u_456:SetVoiceRewarmCookie("true")
	end
	local v461 = p_u_456:FetchAgeVerificationOverlay()
	local v462
	if v_u_78 then
		if type(v461) == "table" then
			v462 = v461.showVoiceInExperienceUpsellVariant
		else
			v462 = nil
		end
	else
		v462 = v461.showVoiceInExperienceUpsellVariant
	end
	local v463 = v462 or v_u_88.IN_EXP_UPSELL_VARIANT.VARIANT3
	if not v_u_77 then
		p_u_456.Analytics:reportJoinVoiceButtonEvent("clicked", p_u_456:GetInExpUpsellAnalyticsData())
	end
	if p_u_456.previousGroupId then
		v458 = v_u_77 and "RejoinPreviousChannel" or v458
		p_u_456:RejoinPreviousChannel()
		p_u_456:showJoinVoicePrompt()
		p_u_456:ShowVoiceUI()
		p_u_456:SetVoiceConnectCookieValue(true)
	elseif v_u_40() and p_u_456.isShowingFTUX then
		v458 = v_u_77 and "ExitFtux" or v458
		p_u_456:HideFTUX(v_u_16)
	elseif p_u_456.deniedMicPermissions then
		v458 = v_u_77 and "MicPermissionPrompt" or v458
		p_u_456:CheckAndShowPermissionPrompt()
	elseif p_u_456:UserVoiceEnabled() then
		v458 = v_u_77 and "FirstJoinSession" or v458
		p_u_456.isInitialJoin = true
		p_u_456.attemptVoiceRejoin:Fire()
		if p_u_456:IsNewSeamlessVoiceUserDisconnect() then
			p_u_456:SetVoiceConnectCookieValue(true)
			p_u_456:SetNewUserFTUXCookieValue(true)
		end
	elseif v_u_62 and p_u_456:UserOnlyEligibleForVoiceViaOverlay() or p_u_456:UserOnlyEligibleForVoice() then
		v458 = v_u_77 and "ConsentModal" or v458
		if v_u_35() and p_u_456:IsSeamlessVoice() then
			p_u_456:EnableVoice()
		else
			p_u_456:SetInExpUpsellEntrypoint(v_u_88.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE)
			p_u_456:showPrompt((p_u_456:GetInExpUpsellPromptFromEnum(v463)))
		end
	elseif p_u_456:EligibleForAgeCheckToast() then
		v458 = v_u_77 and "AgeCheckToast" or v458
		p_u_456:showPrompt(v_u_91.AgeCheckForVoiceToast)
	elseif v_u_80() and (v_u_69() and (not p_u_456:UserVoiceEnabled() and p_u_456:FetchPhoneVerificationUpsell(v_u_88.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v_u_88.PHONE_UPSELL_VALUE_PROP.VoiceChat)) then
		v458 = v_u_77 and "PhoneUpsell" or v458
		if p457 then
			p457:SetVisibility(false, true)
		end
		p_u_456:ShowInExperiencePhoneVoiceUpsell(v_u_88.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, v_u_88.IN_EXP_PHONE_UPSELL_IXP_LAYER)
	elseif p_u_456:EligibleForFaeUpsell() then
		v458 = v_u_77 and "FaeUpsell" or v458
		if p_u_456.pendingConnectionSource == nil then
			p_u_456.pendingConnectionSource = v_u_88.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		end
		p_u_456.coreVoiceManager:OptUserToJoinVoice()
		local v464 = v_u_114(false)
		if not v_u_77 then
			p_u_456:reportJoinVoiceUpsellEvent("Click")
		end
		v464.setCurrentOverlay(v_u_115.SocialUpsell, {
			["upsellType"] = v_u_116.FacialAgeEstimation,
			["data"] = {
				["isInExperience"] = true,
				["countDownBadgeText"] = nil,
				["isPhase2"] = true,
				["upsellEntrySurface"] = nil,
				["upsellEntryComponent"] = nil,
				["upsellPurpose"] = nil,
				["upsellEntrySurface"] = v_u_117.UpsellEntrySurfaceType.InExperienceVoiceChatIcon,
				["upsellEntryComponent"] = v_u_117.UpsellComponent.Modal,
				["upsellPurpose"] = v_u_117.UpsellStage.Fae
			}
		})
	end
	if v_u_77 then
		local v465, v466, v467 = p_u_456:GetInExpUpsellAnalyticsData()
		p_u_456.Analytics:reportJoinVoiceButtonEvent("clicked", v465, v466, v467, v459, v458)
		p_u_456:reportJoinVoiceUpsellEvent("Click", v459, v458)
	end
	if v_u_74 and v460 ~= nil then
		p_u_456.Analytics:reportVoiceRewarmClicked(v460, v458)
	end
	if p_u_456:IsSeamlessVoice() then
		task.spawn(function()
			-- upvalues: (copy) p_u_456
			p_u_456.coreVoiceManager:PostUserVoiceConnectionStatus(true)
		end)
	end
end
function v_u_131.EligibleForFaeUpsell(p468) -- name: EligibleForFaeUpsell
	-- upvalues: (copy) v_u_119, (copy) v_u_120
	local v469 = p468.coreVoiceManager:EligibleForFaeUpsell() and p468.AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
	if v469 then
		if v_u_119 then
			return v_u_120()
		end
		v469 = true
	end
	return v469
end
function v_u_131.EligibleForAgeCheckToast(p470) -- name: EligibleForAgeCheckToast
	return p470.coreVoiceManager:EligibleForAgeCheckToast()
end
function v_u_131.ShouldShowJoinVoice(p471) -- name: ShouldShowJoinVoice
	-- upvalues: (copy) v_u_77, (copy) v_u_22, (copy) v_u_72, (copy) v_u_73, (copy) v_u_79, (copy) v_u_80, (copy) v_u_69, (copy) v_u_88
	local v472, v473
	if v_u_77 then
		if p471:EligibleForFaeUpsell() then
			p471.joinVoiceButtonContext = "FaeUpsell"
			return true
		end
		if p471:HasSeamlessVoiceFeature(v_u_22.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and p471:GetVoiceConnectCookie() == "" then
			p471.joinVoiceButtonContext = "VoiceFtux"
			return true
		end
		if v_u_72 then
			local v474
			if v_u_73 then
				v474 = p471:ShouldRewarmUser()
			else
				v474 = p471:GetVoiceRewarmCookie() == ""
			end
			if v474 and (p471:GetVoiceConnectCookie() == "false" and p471:UserVoiceEnabled()) then
				p471.joinVoiceButtonContext = "Rewarm"
				return true
			end
		end
		if p471:EligibleForAgeCheckToast() then
			if v_u_79 then
				p471.joinVoiceButtonContext = "AgeCheckToast"
			end
			return true
		else
			v472 = p471:UserInInExperienceUpsellTreatment()
			v473 = p471:UserOnlyEligibleForVoice() or p471:UserVoiceEnabled()
			if v_u_80() and (v_u_69() and (not v473 and (not p471:UserVoiceEnabled() and p471:FetchPhoneVerificationUpsell(v_u_88.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v_u_88.PHONE_UPSELL_VALUE_PROP.VoiceChat))) then
				if v_u_79 then
					p471.joinVoiceButtonContext = "PhoneUpsell"
				end
				return true
			else
				if v_u_79 and (v472 and v473) then
					p471.joinVoiceButtonContext = "InExpUpsell"
				end
				return v472 and v473
			end
		end
	elseif p471:EligibleForFaeUpsell() or p471:HasSeamlessVoiceFeature(v_u_22.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and p471:GetVoiceConnectCookie() == "" then
		return true
	elseif v_u_72 then
		local v475
		if v_u_73 then
			v475 = p471:ShouldRewarmUser()
		else
			v475 = p471:GetVoiceRewarmCookie() == ""
		end
		if v475 and p471:VoiceChatEnded() then
			return true
		elseif p471:EligibleForAgeCheckToast() then
			if v_u_79 then
				p471.joinVoiceButtonContext = "AgeCheckToast"
			end
			return true
		else
			v472 = p471:UserInInExperienceUpsellTreatment()
			v473 = p471:UserOnlyEligibleForVoice() or p471:UserVoiceEnabled()
			if v_u_80() and (v_u_69() and (not v473 and (not p471:UserVoiceEnabled() and p471:FetchPhoneVerificationUpsell(v_u_88.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v_u_88.PHONE_UPSELL_VALUE_PROP.VoiceChat))) then
				if v_u_79 then
					p471.joinVoiceButtonContext = "PhoneUpsell"
				end
				return true
			else
				if v_u_79 and (v472 and v473) then
					p471.joinVoiceButtonContext = "InExpUpsell"
				end
				return v472 and v473
			end
		end
	elseif p471:EligibleForAgeCheckToast() then
		if v_u_79 then
			p471.joinVoiceButtonContext = "AgeCheckToast"
		end
		return true
	else
		v472 = p471:UserInInExperienceUpsellTreatment()
		v473 = p471:UserOnlyEligibleForVoice() or p471:UserVoiceEnabled()
		if v_u_80() and (v_u_69() and (not v473 and (not p471:UserVoiceEnabled() and p471:FetchPhoneVerificationUpsell(v_u_88.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v_u_88.PHONE_UPSELL_VALUE_PROP.VoiceChat))) then
			if v_u_79 then
				p471.joinVoiceButtonContext = "PhoneUpsell"
			end
			return true
		else
			if v_u_79 and (v472 and v473) then
				p471.joinVoiceButtonContext = "InExpUpsell"
			end
			return v472 and v473
		end
	end
end
function v_u_131.ShouldShowJoinVoiceOnDisconnect(p476) -- name: ShouldShowJoinVoiceOnDisconnect
	return p476.coreVoiceManager:ShouldShowJoinVoiceOnDisconnect()
end
function v_u_131.IsSeamlessVoice(p477) -- name: IsSeamlessVoice
	-- upvalues: (copy) v_u_82, (copy) v_u_19, (copy) v_u_97
	if v_u_82() then
		return p477.coreVoiceManager:IsSeamlessVoice()
	else
		local v478 = p477:FetchAgeVerificationOverlay()
		if v478 and v478.voiceSettings then
			local v479 = v478.voiceSettings.seamlessVoiceStatus
			return v479 == v_u_97.EnabledExistingUser and true or v479 == v_u_97.EnabledNewUser
		else
			v_u_19:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil")
			return false
		end
	end
end
function v_u_131.HasSeamlessVoiceFeature(p480, p481) -- name: HasSeamlessVoiceFeature
	return p480.coreVoiceManager:HasSeamlessVoiceFeature(p481)
end
function v_u_131.IsNewSeamlessVoiceUserDisconnect(p482) -- name: IsNewSeamlessVoiceUserDisconnect
	return p482.coreVoiceManager:IsNewSeamlessVoiceUserDisconnect()
end
function v_u_131.GetConnectDisconnectButtonAnalyticsData(p483, p484) -- name: GetConnectDisconnectButtonAnalyticsData
	-- upvalues: (copy) v_u_43, (copy) v_u_15
	local v485 = not v_u_43 and "" or v_u_15:GetPlaySessionId()
	local v486 = { game.GameId, game.PlaceId, v485 }
	if p484 and p483:getService() then
		table.insert(v486, p483:GetSessionId())
	end
	return unpack(v486)
end
function v_u_131.GetConnectDisconnectAnalyticsData(p487) -- name: GetConnectDisconnectAnalyticsData
	-- upvalues: (copy) v_u_43, (copy) v_u_15, (copy) v_u_40, (copy) v_u_18
	local v488 = {}
	local v489 = not v_u_43 and "" or v_u_15:GetPlaySessionId()
	v488.universeId = game.GameId
	v488.placeId = game.PlaceId
	v488.playSessionId = v489
	if v_u_40() then
		v488.voiceSessionId = not p487.service and "" or p487:GetSessionId()
	else
		v488.voiceSessionId = p487:GetSessionId()
	end
	v488.durationTimestamp = v_u_18:getTimestamp()
	return v488
end
function v_u_131.Leave(p_u_490) -- name: Leave
	-- upvalues: (copy) v_u_99
	p_u_490:ensureInitialized("leave")
	p_u_490:SetVoiceConnectCookieValue(false)
	p_u_490.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", p_u_490:GetConnectDisconnectAnalyticsData())
	local v491 = p_u_490.service:GetGroupId()
	local v492 = p_u_490.service:IsPublishPaused()
	if v_u_99() then
		local v493 = game:GetService("VoiceChatService")
		if v493 then
			v493:leaveVoice()
		end
	else
		p_u_490.service:Leave()
	end
	p_u_490:HideVoiceUI()
	p_u_490.previousGroupId = v491
	p_u_490.previousMutedState = v492
	if p_u_490:IsSeamlessVoice() then
		task.spawn(function()
			-- upvalues: (copy) p_u_490
			p_u_490.coreVoiceManager:PostUserVoiceConnectionStatus(false)
		end)
	end
end
function v_u_131.GetVoiceStateFromEnum(_, p494) -- name: GetVoiceStateFromEnum
	-- upvalues: (ref) v_u_134, (copy) v_u_124
	if not v_u_134[p494] then
		v_u_134 = {
			[Enum.VoiceChatState.Idle] = v_u_124.HIDDEN,
			[Enum.VoiceChatState.Joining] = v_u_124.CONNECTING,
			[Enum.VoiceChatState.JoiningRetry] = v_u_124.CONNECTING,
			[Enum.VoiceChatState.Joined] = v_u_124.MUTED,
			[Enum.VoiceChatState.Leaving] = v_u_124.MUTED,
			[Enum.VoiceChatState.Ended] = v_u_124.HIDDEN,
			[Enum.VoiceChatState.Failed] = v_u_124.ERROR
		}
	end
	return v_u_134[p494]
end
function v_u_131.GetInExpUpsellPromptFromEnum(_, p495) -- name: GetInExpUpsellPromptFromEnum
	-- upvalues: (copy) v_u_135
	return v_u_135[p495]
end
function v_u_131.getRecentUsersInteractionData(p496) -- name: getRecentUsersInteractionData
	return p496.coreVoiceManager:getRecentUsersInteractionData()
end
function v_u_131._setRecentUserState(p497, p498, p499) -- name: _setRecentUserState
	return p497.coreVoiceManager:_setRecentUserState(p498, p499)
end
function v_u_131._updateRecentUsersInteractionData(p500) -- name: _updateRecentUsersInteractionData
	return p500.coreVoiceManager:_updateRecentUsersInteractionData()
end
function v_u_131.SetupParticipantListeners(p501) -- name: SetupParticipantListeners
	return p501.coreVoiceManager:SetupParticipantListeners()
end
function v_u_131.Disconnect(p502) -- name: Disconnect
	-- upvalues: (copy) v_u_32, (copy) v_u_33
	if v_u_32 then
		p502.voiceRestrictionController.dispose()
	end
	if v_u_32 and v_u_33 then
		p502.voiceInterventionConnection:disconnect()
	end
	p502.coreVoiceManager:Disconnect()
	p502.coreVoiceManager:unsubscribeAll()
end
function v_u_131.GetSendMuteEvent(p503) -- name: GetSendMuteEvent
	return p503.coreVoiceManager:GetSendMuteEvent()
end
function v_u_131.ToggleMic(p504, p505) -- name: ToggleMic
	return p504.coreVoiceManager:ToggleMic(p505)
end
function v_u_131.SubscribeRetry(p506, p507) -- name: SubscribeRetry
	-- upvalues: (copy) v_u_19
	p506:ensureInitialized("subscribe retry")
	local v508 = v_u_19
	local v509 = tostring(p507)
	v508:debug("Attempting to retry connection to user: {}", "..." .. string.sub(v509, -4))
	p506.service:SubscribeRetry(p507)
end
function v_u_131.JoinByGroupIdToken(p510, p511, p512) -- name: JoinByGroupIdToken
	return p510.coreVoiceManager:JoinByGroupIdToken(p511, p512)
end
function v_u_131.RejoinPreviousChannel(p_u_513) -- name: RejoinPreviousChannel
	-- upvalues: (copy) v_u_19, (copy) v_u_99
	local v_u_514 = p_u_513.previousGroupId
	local v_u_515 = p_u_513.previousMutedState
	v_u_19:debug("Rejoining previous channel {} with mute status {}", v_u_514, v_u_515)
	local function v518()
		-- upvalues: (ref) v_u_99, (copy) p_u_513, (copy) v_u_514, (copy) v_u_515
		if v_u_99() then
			p_u_513.coreVoiceManager:RejoinVoice()
			local v516 = p_u_513:GetConnectDisconnectAnalyticsData()
			v516.connectionSource = p_u_513.pendingConnectionSource
			p_u_513.pendingConnectionSource = nil
			p_u_513.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v516)
			p_u_513.voiceConnectEventReportedForActiveSession = true
		elseif v_u_514 and v_u_514 ~= "" then
			p_u_513.service:Leave()
			if not p_u_513.service:JoinByGroupIdToken(v_u_514, v_u_515, true) then
				p_u_513:InitialJoinFailedPrompt()
				return
			end
			local v517 = p_u_513:GetConnectDisconnectAnalyticsData()
			v517.connectionSource = p_u_513.pendingConnectionSource
			p_u_513.pendingConnectionSource = nil
			p_u_513.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v517)
			p_u_513.voiceConnectEventReportedForActiveSession = true
		end
	end
	pcall(v518)
end
function v_u_131.SwitchDevice(_, p519, p520, p521) -- name: SwitchDevice
	-- upvalues: (copy) v_u_125, (copy) v_u_12, (copy) v_u_19
	if p519 == v_u_125.Input then
		v_u_12:SetInputDevice(p520, p521)
		v_u_19:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", p520, p521)
	else
		v_u_12:SetOutputDevice(p520, p521)
		v_u_19:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", p520, p521)
	end
end
function v_u_131.GetDevices(_, p_u_522) -- name: GetDevices
	-- upvalues: (copy) v_u_125, (copy) v_u_12
	local function v523()
		-- upvalues: (copy) p_u_522, (ref) v_u_125, (ref) v_u_12
		if p_u_522 == v_u_125.Input then
			return v_u_12:GetInputDevices()
		else
			return v_u_12:GetOutputDevices()
		end
	end
	local v524, v525, v526, v527 = pcall(v523)
	return v524, v525, v526, v527
end
function v_u_131.VoiceChatAvailable(p528) -- name: VoiceChatAvailable
	-- upvalues: (copy) v_u_127, (copy) v_u_126
	local v529 = p528.service
	if p528.available == nil and v529 then
		p528.version = v529:GetVoiceChatApiVersion()
		if v_u_127 <= p528.version then
			p528.available = v529:GetVoiceChatAvailable()
			while p528.available == v_u_126.Checking do
				wait(1)
				p528.available = v529:GetVoiceChatAvailable()
			end
		end
	end
	if not v529 then
		return false
	end
	local v530
	if v_u_127 <= p528.version then
		v530 = p528.available == v_u_126.Available
	else
		v530 = false
	end
	return v530
end
function v_u_131.VoiceChatEnded(p531) -- name: VoiceChatEnded
	-- upvalues: (copy) v_u_60
	if p531.service then
		local v532 = p531.service.VoiceChatState
		if v_u_60 then
			return v532 == Enum.VoiceChatState.Ended
		else
			return v532 == Enum.VoiceChatState.Ended and true or v532 == Enum.VoiceChatState.Idle
		end
	else
		return true
	end
end
function v_u_131.UnmountPrompt(p533) -- name: UnmountPrompt
	-- upvalues: (copy) v_u_7
	if p533.voiceChatPromptInstance ~= nil then
		v_u_7.unmount(p533.voiceChatPromptInstance)
		p533.voiceChatPromptInstance = nil
	end
end
v_u_131.default = v_u_131.new(v112.default, nil, v_u_102, v_u_9.default, v103:GetAfterBlockedStatusChangedEvent())
return v_u_131