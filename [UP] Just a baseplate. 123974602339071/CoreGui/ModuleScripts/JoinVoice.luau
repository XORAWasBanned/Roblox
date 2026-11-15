-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.JoinVoice
local v1 = script:FindFirstAncestor("Chrome")
local v_u_2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = game:GetService("CorePackages")
local v_u_4 = require(v3.Packages.React)
local v5 = require(v3.Packages.Signals)
local v_u_6 = require(v3.Packages.Foundation)
local v_u_7 = require(v_u_2.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_8 = require(v_u_2.Modules.VoiceChat.Constants)
local v_u_9 = require(v1.Integrations.CommonIcon)
local v_u_10 = require(v1.Integrations.CommonFtuxTooltip)
local v_u_11 = require(v1.ChromeShared.Unibar.Constants)
local v12 = require(v1.Integrations.isVoiceChatSupported)
local v_u_13 = v_u_8.VOICE_JOIN_PROGRESS
local v_u_14 = require(v_u_2.Modules.VoiceChatPrompt.PromptType)
local v15 = require(v3.Workspace.Packages.CrossExperience).Utils.observeCurrentContextId
local v_u_16 = require(v3.Workspace.Packages.VoiceChat).Utils.GetIcon
local v_u_17 = require(v3.Workspace.Packages.CrossExperience).Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
local v_u_18 = require(v3.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local v19 = require(v3.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local v_u_20 = require(v3.Workspace.Packages.SharedFlags).FFlagProactiveVoiceRestrictionsUFR
local v_u_21 = require(v1.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v_u_22 = game:DefineFastFlag("CheckShouldShowJoinVoiceInEvent", false)
local v_u_23 = game:DefineFastFlag("ReplaceJoinVoiceIconToMuted", false)
local v_u_24 = game:DefineFastInt("JoinVoiceFtuxShowDelayMs", 1000)
local v_u_25 = game:DefineFastInt("JoinVoiceFtuxDismissDelayMs", 5000)
local v_u_26 = game:DefineFastInt("UnibarJoinVoiceTooltipPriority", 1000)
local v_u_27 = game:DefineFastFlag("EnableChromeJoinVoiceTooltip", false)
local v_u_28 = require(v1.Service)
local v_u_29 = require(v3.Workspace.Packages.Chrome).UnibarStyle
local v30 = require(v3.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v_u_31 = false
local v_u_32 = false
local v_u_33 = v_u_28.AvailabilitySignal.Unavailable
function getShouldShowJoinVoiceTooltip() -- name: getShouldShowJoinVoiceTooltip
	-- upvalues: (copy) v_u_7, (ref) v_u_32
	local v34 = v_u_7:FetchAgeVerificationOverlay()
	local v35 = not v_u_32
	if v35 then
		if v34 then
			v34 = v34.showJoinVoiceUpsellTooltip
		end
	else
		v34 = v35
	end
	v_u_32 = true
	return v34
end
local v41 = {
	["initialAvailability"] = nil,
	["id"] = "join_voice",
	["label"] = "CoreScripts.TopBar.JoinVoice",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v_u_28.AvailabilitySignal.Unavailable,
	["sideSheetPlacement"] = v30.Unibar,
	["activated"] = function() -- name: activated
		-- upvalues: (copy) v_u_20, (copy) v_u_7, (copy) v_u_18, (copy) v_u_2, (copy) v_u_8
		if not v_u_20 or v_u_7:GetVoiceRestrictionState(false) == "normal" then
			local v36
			if v_u_18() then
				v36 = require(v_u_2.Modules.Settings.SettingsHub)
			else
				v36 = nil
			end
			v_u_7.pendingConnectionSource = v_u_8.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			v_u_7:JoinVoice(v36)
		end
	end,
	["components"] = {
		["Icon"] = function() -- name: Icon
			-- upvalues: (copy) v_u_21, (copy) v_u_29, (copy) v_u_11, (copy) v_u_23, (copy) v_u_16, (copy) v_u_27, (copy) v_u_4, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10, (copy) v_u_26, (copy) v_u_24, (copy) v_u_25, (copy) v_u_7, (copy) v_u_8
			local v37
			if v_u_21 then
				v37 = v_u_29.use().ICON_SIZE
			else
				v37 = v_u_11.ICON_SIZE
			end
			local v38 = not v_u_23 and "icons/controls/publicAudioJoin" or v_u_16("Muted", "MicLight")
			if not v_u_27 then
				return v_u_9(v38)
			end
			local v39 = getShouldShowJoinVoiceTooltip()
			return v_u_4.createElement(v_u_6.View, {
				["Size"] = UDim2.new(0, v37, 0, v37)
			}, {
				["Icon"] = v_u_9(v38),
				["Tooltip"] = v_u_10({
					["id"] = "JOIN_VOICE",
					["priority"] = nil,
					["isIconVisible"] = nil,
					["dismissOnOutsideInput"] = true,
					["headerKey"] = "CoreScripts.FTUX.Heading.JoinVoice",
					["bodyKey"] = "CoreScripts.FTUX.Label.JoinVoiceDescription",
					["showDelay"] = nil,
					["dismissDelay"] = nil,
					["onDismissed"] = nil,
					["priority"] = v_u_26,
					["isIconVisible"] = v39,
					["showDelay"] = v_u_24,
					["dismissDelay"] = v_u_25,
					["onDismissed"] = function() -- name: onDismissed
						-- upvalues: (ref) v_u_7, (ref) v_u_8
						local function v40()
							-- upvalues: (ref) v_u_7, (ref) v_u_8
							v_u_7:RecordUserSeenModal(v_u_8.MODAL_IDS.IN_EXP_JOIN_VOICE_UPSELL)
						end
						pcall(v40)
					end
				})
			})
		end
	}
}
local v_u_42 = v_u_28:register(v41)
if v19() then
	return v_u_42
end
local function v_u_44(p43) -- name: setAvailability
	-- upvalues: (copy) v_u_20, (copy) v_u_7, (ref) v_u_42, (ref) v_u_33, (ref) v_u_31, (copy) v_u_28
	if v_u_20 and v_u_7:GetVoiceRestrictionState(false) ~= "normal" then
		v_u_42.availability:unavailable()
	else
		v_u_33 = p43
		if not v_u_31 then
			if p43 == v_u_28.AvailabilitySignal.Available then
				v_u_42.availability:available()
				return
			end
			if p43 == v_u_28.AvailabilitySignal.Unavailable then
				v_u_42.availability:unavailable()
			end
		end
	end
end
local function v_u_46(p45) -- name: HideOrShowJoinVoiceButton
	-- upvalues: (copy) v_u_20, (copy) v_u_7, (ref) v_u_42, (copy) v_u_13, (copy) v_u_22, (copy) v_u_44, (copy) v_u_28, (copy) v_u_8, (copy) v_u_14
	if v_u_20 and v_u_7:GetVoiceRestrictionState(false) ~= "normal" then
		v_u_42.availability:unavailable()
		return
	elseif p45 == v_u_13.Suspended and (not v_u_22 or v_u_7:ShouldShowJoinVoice()) then
		v_u_44(v_u_28.AvailabilitySignal.Available)
	elseif p45 == v_u_13.Joined then
		v_u_44(v_u_28.AvailabilitySignal.Unavailable)
		if v_u_7.inExpUpsellEntrypoint == v_u_8.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
			v_u_7:ToggleMic()
			v_u_7:showPrompt(v_u_14.VoiceConsentAcceptedToast)
		end
	end
end
if v_u_20 then
	local v48 = v5.createEffect(function(p47)
		-- upvalues: (copy) v_u_7, (ref) v_u_42
		if v_u_7:GetVoiceRestrictionState(p47) ~= "normal" then
			v_u_42.availability:unavailable()
		end
	end)
	script.Destroying:Once(v48)
end
v15(function(p49)
	-- upvalues: (copy) v_u_17, (ref) v_u_31, (ref) v_u_33, (ref) v_u_42, (copy) v_u_44
	local v50 = p49 == v_u_17
	if v_u_31 ~= v50 then
		v_u_31 = v50
		if v_u_31 then
			v_u_33 = v_u_42.availability:get()
			v_u_42.availability:unavailable()
			return
		end
		v_u_44(v_u_33)
	end
end)
if v12() then
	if v_u_18() then
		task.spawn(function()
			-- upvalues: (copy) v_u_7, (copy) v_u_44, (copy) v_u_28, (copy) v_u_46
			if v_u_7:ShouldShowJoinVoice() then
				v_u_44(v_u_28.AvailabilitySignal.Available)
			end
			v_u_7.VoiceJoinProgressChanged.Event:Connect(v_u_46)
		end)
	else
		if v_u_7:ShouldShowJoinVoice() then
			v_u_44(v_u_28.AvailabilitySignal.Available)
		end
		v_u_7.VoiceJoinProgressChanged.Event:Connect(v_u_46)
	end
end
return v_u_42