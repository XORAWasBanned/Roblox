-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.JoinVoiceBinder
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_4 = require(v2.Packages.React)
local v_u_5 = require(v2.Packages.Signals)
local v_u_6 = require(v3.Modules.VoiceChat.VoiceChatServiceManager).default
local v7 = require(v2.Workspace.Packages.CrossExperienceVoice)
local v8 = require(v2.Workspace.Packages.CrossExperience)
local v_u_9
if require(v2.Workspace.Packages.Chrome).Enabled() then
	v_u_9 = require(v1.ChromeShared.Service)
else
	v_u_9 = nil
end
local v_u_10 = v8.Utils.isVoiceFocused
local v_u_11 = v7.Hooks.useIsVoiceFocused
local v_u_12 = v7.Hooks.useIsVoiceConnecting
local v_u_13 = require(v3.Modules.VoiceChat.Constants)
local v_u_14 = v_u_13.VOICE_JOIN_PROGRESS
local v_u_15 = require(v3.Modules.VoiceChatPrompt.PromptType)
local v_u_16 = require(v2.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local v_u_17 = require(v2.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry
local v_u_18 = require(v2.Workspace.Packages.SharedFlags).FFlagProactiveVoiceRestrictionsUFR
local v_u_19 = require(v3.Modules.VoiceChat.Flags.FFlagVoiceRewarmGrafanaMetrics)
local function v_u_23()
	-- upvalues: (copy) v_u_6, (copy) v_u_17
	local v20 = v_u_6
	local v21 = "Shown"
	local v22
	if v_u_17 then
		v22 = v_u_6.joinVoiceButtonContext
	else
		v22 = nil
	end
	v20:reportJoinVoiceUpsellEvent(v21, v22)
end
local v_u_24 = false
local function v_u_25(...)
	-- upvalues: (ref) v_u_24, (copy) v_u_23
	if v_u_24 then
		return nil
	end
	v_u_24 = true
	return v_u_23(...)
end
return function() -- name: JoinVoiceBinder
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_4, (copy) v_u_9, (copy) v_u_18, (copy) v_u_6, (copy) v_u_25, (copy) v_u_19, (copy) v_u_16, (copy) v_u_10, (copy) v_u_14, (copy) v_u_13, (copy) v_u_15, (copy) v_u_5
	local v_u_26 = v_u_11()
	local v_u_27 = v_u_12()
	local v_u_28 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_27
		return v_u_26 or v_u_27
	end, { v_u_27, v_u_26 })
	local v_u_29 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_9
		if v_u_9 then
			return v_u_9:integrations().join_voice
		else
			return nil
		end
	end, {})
	local v_u_31 = v_u_4.useCallback(function(p30)
		-- upvalues: (copy) v_u_29, (ref) v_u_9, (ref) v_u_18, (ref) v_u_6, (copy) v_u_26, (ref) v_u_25, (ref) v_u_19
		if v_u_29 and v_u_9 then
			if v_u_18 and v_u_6:GetVoiceRestrictionState(false) ~= "normal" then
				v_u_29.availability:unavailable()
			elseif not v_u_26 then
				if p30 == v_u_9.AvailabilitySignal.Available then
					v_u_25()
					if v_u_19 then
						v_u_6:reportVoiceRewarmShown()
					end
					v_u_29.availability:available()
					return
				end
				if p30 == v_u_9.AvailabilitySignal.Unavailable then
					v_u_29.availability:unavailable()
				end
			end
		else
			return
		end
	end, {})
	local v_u_32 = v_u_4.useCallback(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_16, (ref) v_u_6, (copy) v_u_28, (ref) v_u_10, (copy) v_u_31
		if v_u_9 then
			if v_u_16() then
				task.spawn(function()
					-- upvalues: (ref) v_u_6, (ref) v_u_28, (ref) v_u_10, (ref) v_u_31, (ref) v_u_9
					if v_u_6:ShouldShowJoinVoice() and not (v_u_28 or v_u_10()) then
						v_u_31(v_u_9.AvailabilitySignal.Available)
					end
				end)
			elseif v_u_6:ShouldShowJoinVoice() and not (v_u_28 or v_u_10()) then
				v_u_31(v_u_9.AvailabilitySignal.Available)
			end
		else
			return
		end
	end, { v_u_29, v_u_28 })
	local v_u_34 = v_u_4.useCallback(function(p33)
		-- upvalues: (copy) v_u_29, (ref) v_u_18, (ref) v_u_6, (copy) v_u_28, (ref) v_u_10, (ref) v_u_14, (copy) v_u_32, (ref) v_u_13, (ref) v_u_15
		if v_u_29 then
			if v_u_18 and v_u_6:GetVoiceRestrictionState(false) ~= "normal" then
				v_u_29.availability:unavailable()
				return
			elseif v_u_28 or v_u_10() then
				v_u_29.availability:unavailable()
				return
			elseif p33 == v_u_14.Idle then
				v_u_32()
			elseif p33 == v_u_14.Joined then
				v_u_29.availability:unavailable()
				if v_u_6.inExpUpsellEntrypoint == v_u_13.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
					v_u_6:ToggleMic()
					v_u_6:showPrompt(v_u_15.VoiceConsentAcceptedToast)
				end
			end
		else
			return
		end
	end, { v_u_29, v_u_28 })
	local v_u_35 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_29
		v_u_29.availability:unavailable()
	end, { v_u_29 })
	local v_u_40 = v_u_4.useCallback(function()
		-- upvalues: (ref) v_u_18, (copy) v_u_29, (ref) v_u_5, (ref) v_u_6, (copy) v_u_34, (copy) v_u_35
		local v_u_36
		if v_u_18 and v_u_29 then
			v_u_36 = v_u_5.createEffect(function(p37)
				-- upvalues: (ref) v_u_6, (ref) v_u_29
				if v_u_6:GetVoiceRestrictionState(p37) ~= "normal" then
					v_u_29.availability:unavailable()
				end
			end)
		else
			v_u_36 = nil
		end
		local v_u_38 = v_u_6.VoiceJoinProgressChanged.Event:Connect(v_u_34)
		local v_u_39 = v_u_6.showVoiceUI.Event:Connect(v_u_35)
		return function()
			-- upvalues: (ref) v_u_36, (copy) v_u_38, (ref) v_u_39
			if v_u_36 then
				v_u_36()
			end
			if v_u_38 then
				v_u_38:Disconnect()
			end
			if v_u_39 then
				v_u_39:Disconnect()
			end
		end
	end, {})
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_32, (ref) v_u_18, (copy) v_u_40
		v_u_32()
		if v_u_18 then
			return v_u_40()
		end
		v_u_40()
		return nil
	end, {})
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_34, (ref) v_u_6
		v_u_34(v_u_6.VoiceJoinProgress)
	end, { v_u_28 })
	return nil
end