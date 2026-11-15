-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.ToggleMic
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_4 = game:GetService("Players")
local v5 = game:GetService("RbxAnalyticsService")
local v_u_6 = require(v2.Packages.React)
local v_u_7 = require(v2.Packages.Signals)
local v_u_8 = require(v2.Packages.SignalsReact)
local v_u_9 = require(v2.Packages.Foundation)
local v_u_10 = require(v3.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_11 = require(v3.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local v_u_12 = require(v3.Modules.VoiceChat.Helpers.showVoiceRestrictionEndedSnackbar)
local v13 = require(v2.Workspace.Packages.SharedFlags)
local v_u_14 = v13.FFlagProactiveVoiceRestrictionsUFR
local v_u_15 = v13.FFlagReactiveVoiceRestrictionsUFR
local v16 = require(v3.Modules.Settings.Analytics.VoiceAnalytics)
local v17 = require(v3.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics)
local v_u_18 = game:GetEngineFeature("AudioFocusManagement") and game:DefineFastFlag("EnableChromeAudioFocusManagement", false)
local v_u_19 = game:DefineFastFlag("MicConsumerRegistry", false)
local v20 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v_u_21 = require(v1.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v22 = require(v1.Service)
local v23 = require(v1.ChromeShared.Service.ChromeUtils)
local v24 = require(v1.Integrations.isVoiceChatSupported)
local v_u_25 = require(v1.Integrations.RedVoiceDot)
local v_u_26 = require(v2.Workspace.Packages.Chrome).UnibarStyle
local v_u_27 = require(v1.ChromeShared.Hooks.useIsPlaytestMode)
local v_u_28 = require(v2.Workspace.Packages.SharedFlags).FFlagEnablePlaytestModeUnibar
local v29 = v23.MappedSignal
local v_u_30
if v_u_14 then
	v_u_30 = v23.ObservableValue.new(false)
else
	v_u_30 = v29.new(v_u_10.muteChanged.Event, function()
		-- upvalues: (copy) v_u_10
		return v_u_10.localMuted == false
	end)
end
local v_u_31 = require(v1.ChromeShared.Unibar.Constants)
local v_u_32 = require(v3.Modules.SelfView.Analytics).new()
local v_u_33
if v17() then
	v_u_33 = v16.new(v5, "Chrome.Integrations.ToggleMic")
else
	v_u_33 = nil
end
local function v_u_35() -- name: handleRestrictedActivation
	-- upvalues: (copy) v_u_10, (copy) v_u_15, (copy) v_u_12
	local v34 = v_u_10:GetVoiceRestrictionState(false)
	if v34 == "restricted" then
		v_u_10:ShowVoiceRestriction()
	elseif v_u_15 and v34 == "hiddenUntilRejoin" then
		v_u_12()
	end
	return v34 ~= "normal"
end
local function v_u_38(_)
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_15, (copy) v_u_12, (copy) v_u_19, (copy) v_u_32, (ref) v_u_33
	if v_u_14 then
		local v36 = v_u_10:GetVoiceRestrictionState(false)
		if v36 == "restricted" then
			v_u_10:ShowVoiceRestriction()
		elseif v_u_15 and v36 == "hiddenUntilRejoin" then
			v_u_12()
		end
		if v36 ~= "normal" then
			return
		end
	end
	if v_u_19 then
		local v37 = v_u_10:GetMicManager()
		if v37 and (not v37:HasConsumer("voice_chat") and v37:GetConsumerCount() > 0) then
			v37:SetMicActiveForAllConsumers(v37.localMuted ~= false, "ChromeIntegrationsToggleMic")
			v_u_32:setLastCtx("SelfView")
			return
		end
	end
	v_u_10:ToggleMic("ChromeIntegrationsToggleMic")
	v_u_32:setLastCtx("SelfView")
	if v_u_33 then
		v_u_33:onToggleMuteSelf(not v_u_10.localMuted)
	end
end
local function v_u_40(_)
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_15, (copy) v_u_12
	if v_u_14 then
		local v39 = v_u_10:GetVoiceRestrictionState(false)
		if v39 == "restricted" then
			v_u_10:ShowVoiceRestriction()
		elseif v_u_15 and v39 == "hiddenUntilRejoin" then
			v_u_12()
		end
		if v39 ~= "normal" then
			return
		end
	end
	v_u_10:RejoinPreviousChannel()
end
local function v_u_42(_)
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_15, (copy) v_u_12
	if v_u_14 then
		local v41 = v_u_10:GetVoiceRestrictionState(false)
		if v41 == "restricted" then
			v_u_10:ShowVoiceRestriction()
		elseif v_u_15 and v41 == "hiddenUntilRejoin" then
			v_u_12()
		end
		if v41 ~= "normal" then
			return
		end
	end
	v_u_10:ShowVoiceChatLoadingMessage()
end
local v_u_77 = v22:register({
	["id"] = "toggle_mic_mute",
	["label"] = nil,
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["label"] = require(v1.Flags.FFlagChangeToggleMicText) and "CoreScripts.TopBar.Mic" or "CoreScripts.TopBar.ToggleMic",
	["sideSheetPlacement"] = v20.Unibar,
	["activated"] = v_u_38,
	["isActivated"] = v_u_30,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_21, (copy) v_u_26, (copy) v_u_31, (copy) v_u_28, (copy) v_u_27, (copy) v_u_19, (copy) v_u_10, (copy) v_u_6, (copy) v_u_14, (copy) v_u_8, (copy) v_u_9, (copy) v_u_15, (copy) v_u_11, (copy) v_u_4, (copy) v_u_25
			local v43
			if v_u_21 then
				v43 = v_u_26.use().ICON_SIZE
			else
				v43 = v_u_31.ICON_SIZE
			end
			local v44
			if v_u_28 then
				v44 = v_u_27()
			else
				v44 = nil
			end
			local v_u_45 = v_u_28 and v44 and "MicDark" or "MicLight"
			local v46 = nil
			if v_u_19 then
				local v_u_47 = v_u_10:GetMicManager()
				local v48
				if v_u_47 then
					v48 = v_u_47:HasConsumer("voice_chat")
				else
					v48 = v_u_47
				end
				local v49 = not v48
				if v49 then
					if v_u_47 then
						v49 = v_u_47:GetConsumerCount() > 0
					else
						v49 = v_u_47
					end
				end
				local v50
				if v_u_47 then
					v50 = v_u_47.localMuted
				else
					v50 = nil
				end
				local v51, v_u_52 = v_u_6.useState(v50 ~= false)
				local v53, v_u_54 = v_u_6.useBinding(0)
				local _, v_u_55 = v_u_6.useState(0)
				v_u_6.useEffect(function()
					-- upvalues: (copy) v_u_47, (copy) v_u_52, (copy) v_u_54, (copy) v_u_55
					if v_u_47 then
						local v_u_57 = v_u_47.muteChanged.Event:Connect(function(p56)
							-- upvalues: (ref) v_u_52
							v_u_52(p56 ~= false)
						end)
						local v_u_59 = v_u_47.levelChanged.Event:Connect(function(p58)
							-- upvalues: (ref) v_u_54
							v_u_54(p58)
						end)
						local v_u_61 = v_u_47.hasConsumersChanged.Event:Connect(function()
							-- upvalues: (ref) v_u_55
							v_u_55(function(p60)
								return p60 + 1
							end)
						end)
						return function()
							-- upvalues: (copy) v_u_57, (copy) v_u_59, (copy) v_u_61
							v_u_57:Disconnect()
							v_u_59:Disconnect()
							v_u_61:Disconnect()
						end
					end
				end, { v_u_47 })
				local v_u_62 = v51 and "Muted" or "Unmuted"
				local v64 = v53:map(function(p63)
					-- upvalues: (ref) v_u_10, (copy) v_u_62, (copy) v_u_45
					return v_u_10:GetIcon(v_u_62 .. tostring(p63), v_u_45)
				end)
				if v49 then
					local v65 = v_u_6.createElement
					local v66 = "ImageLabel"
					local v67 = {
						["Size"] = nil,
						["BackgroundTransparency"] = 1,
						["BorderSizePixel"] = 0,
						["Image"] = nil,
						["Size"] = UDim2.new(0, v43, 0, v43)
					}
					if v51 then
						v64 = v_u_10:GetIcon(v_u_62, v_u_45)
					end
					v67.Image = v64
					v46 = v65(v66, v67)
				end
			end
			local v69 = not v_u_14 and "normal" or v_u_8.useSignalState(function(p68)
				-- upvalues: (ref) v_u_10
				return v_u_10:GetVoiceRestrictionState(p68)
			end)
			if v_u_14 and v69 == "restricted" then
				return v_u_6.createElement(v_u_9.Image, {
					["Image"] = "icons/controls/microphoneMute",
					["imageStyle"] = nil,
					["Size"] = nil,
					["imageStyle"] = {
						["Transparency"] = 0.5
					},
					["Size"] = UDim2.fromOffset(v43, v43)
				})
			end
			if v_u_15 and v69 == "hiddenUntilRejoin" then
				return v_u_6.createElement("ImageLabel", {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["BorderSizePixel"] = 0,
					["Image"] = nil,
					["Size"] = UDim2.new(0, v43, 0, v43),
					["Image"] = v_u_10:GetIcon("Muted", v_u_45)
				})
			end
			if v46 then
				return v46
			end
			local v70 = v_u_6.createElement
			local v71 = {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(0, v43, 0, v43)
			}
			local v72 = {}
			local v73 = v_u_6.createElement
			local v74 = v_u_11
			local v75 = {
				["userId"] = nil,
				["hideOnError"] = false,
				["iconStyle"] = nil,
				["selectable"] = false,
				["size"] = nil,
				["showConnectingShimmer"] = true
			}
			local v76 = v_u_4.LocalPlayer.UserId
			v75.userId = tostring(v76)
			v75.iconStyle = v_u_45
			v75.size = UDim2.new(0, v43, 0, v43)
			__set_list(v72, 1, {v73(v74, v75), (v_u_6.createElement(v_u_25, {
	["position"] = UDim2.new(1, -7, 1, -7)
}))})
			return v70("Frame", v71, v72)
		end
	}
})
local function v85() -- name: observeMicPresentation
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_30, (ref) v_u_77, (copy) v_u_35, (copy) v_u_15
	local v_u_81 = v_u_7.createEffect(function(p78)
		-- upvalues: (ref) v_u_10, (ref) v_u_30, (ref) v_u_77, (ref) v_u_35, (ref) v_u_15
		local v79 = v_u_30
		local v80
		if v_u_10:GetVoiceRestrictionState(p78) == "normal" then
			v80 = v_u_10.localMuted == false
		else
			v80 = false
		end
		v79:set(v80)
		if v_u_10:GetVoiceRestrictionState(false) == "normal" then
			return
		else
			v_u_77.activated = v_u_35
			if v_u_15 then
				v_u_77.availability:pinned()
			else
				v_u_77.availability:unavailable()
			end
		end
	end)
	local v_u_84 = v_u_10.muteChanged.Event:Connect(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_30
		local v82 = v_u_30
		local v83
		if v_u_10:GetVoiceRestrictionState(false) == "normal" then
			v83 = v_u_10.localMuted == false
		else
			v83 = false
		end
		v82:set(v83)
	end)
	return function()
		-- upvalues: (copy) v_u_81, (copy) v_u_84
		v_u_81()
		v_u_84:Disconnect()
	end
end
local function v_u_87() -- name: applyVoiceUIVisibility
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (ref) v_u_77, (copy) v_u_35, (copy) v_u_15
	if v_u_14 then
		local v86
		if v_u_10:GetVoiceRestrictionState(false) == "normal" then
			v86 = false
		else
			v_u_77.activated = v_u_35
			if v_u_15 then
				v_u_77.availability:pinned()
				v86 = true
			else
				v_u_77.availability:unavailable()
				v86 = true
			end
		end
		if v86 then
			return
		end
	end
	if v_u_10.voiceUIVisible then
		v_u_77.availability:pinned()
	else
		v_u_77.availability:unavailable()
	end
end
local function v_u_90() -- name: updateMicAvailabilityFromConsumers
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (ref) v_u_77, (copy) v_u_35, (copy) v_u_15
	if v_u_14 then
		local v88
		if v_u_10:GetVoiceRestrictionState(false) == "normal" then
			v88 = false
		else
			v_u_77.activated = v_u_35
			if v_u_15 then
				v_u_77.availability:pinned()
				v88 = true
			else
				v_u_77.availability:unavailable()
				v88 = true
			end
		end
		if v88 then
			return
		end
	end
	local v89 = v_u_10:GetMicManager()
	if v89 and v89:GetConsumerCount() > 0 then
		v_u_77.availability:pinned()
	elseif not v_u_10.voiceUIVisible then
		v_u_77.availability:unavailable()
	end
end
local function v_u_96(_, p91) -- name: updateVoiceState
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (ref) v_u_77, (copy) v_u_35, (copy) v_u_15, (copy) v_u_18, (copy) v_u_19, (copy) v_u_90, (copy) v_u_40, (copy) v_u_42, (copy) v_u_38
	if v_u_14 then
		local v92
		if v_u_10:GetVoiceRestrictionState(false) == "normal" then
			v92 = false
		else
			v_u_77.activated = v_u_35
			if v_u_15 then
				v_u_77.availability:pinned()
				v92 = true
			else
				v_u_77.availability:unavailable()
				v92 = true
			end
		end
		if v92 then
			return
		end
	end
	local v93, v94
	if p91 ~= Enum.VoiceChatState.Ended then
		if v_u_18 then
			if v_u_14 then
				local v95
				if v_u_10:GetVoiceRestrictionState(false) == "normal" then
					v95 = false
				else
					v_u_77.activated = v_u_35
					if v_u_15 then
						v_u_77.availability:pinned()
						v95 = true
					else
						v_u_77.availability:unavailable()
						v95 = true
					end
				end
				if v95 then
					v93 = p91 == Enum.VoiceChatState.Failed
					v94 = p91 == Enum.VoiceChatState.Joining and true or p91 == Enum.VoiceChatState.JoiningRetry
					if v93 then
						v_u_77.activated = v_u_40
						return
					elseif v94 then
						v_u_77.activated = v_u_42
					else
						v_u_77.activated = v_u_38
					end
				else
					if v_u_10.voiceUIVisible then
						v_u_77.availability:pinned()
					else
						v_u_77.availability:unavailable()
					end
					v93 = p91 == Enum.VoiceChatState.Failed
					v94 = p91 == Enum.VoiceChatState.Joining and true or p91 == Enum.VoiceChatState.JoiningRetry
					if v93 then
						v_u_77.activated = v_u_40
						return
					elseif v94 then
						v_u_77.activated = v_u_42
					else
						v_u_77.activated = v_u_38
					end
				end
			else
				if v_u_10.voiceUIVisible then
					v_u_77.availability:pinned()
				else
					v_u_77.availability:unavailable()
				end
				v93 = p91 == Enum.VoiceChatState.Failed
				v94 = p91 == Enum.VoiceChatState.Joining and true or p91 == Enum.VoiceChatState.JoiningRetry
				if v93 then
					v_u_77.activated = v_u_40
					return
				elseif v94 then
					v_u_77.activated = v_u_42
				else
					v_u_77.activated = v_u_38
				end
			end
		else
			v_u_77.availability:pinned()
			v93 = p91 == Enum.VoiceChatState.Failed
			v94 = p91 == Enum.VoiceChatState.Joining and true or p91 == Enum.VoiceChatState.JoiningRetry
			if v93 then
				v_u_77.activated = v_u_40
				return
			elseif v94 then
				v_u_77.activated = v_u_42
			else
				v_u_77.activated = v_u_38
			end
		end
	else
		if v_u_19 then
			v_u_90()
		else
			v_u_77.availability:unavailable()
		end
		v93 = p91 == Enum.VoiceChatState.Failed
		v94 = p91 == Enum.VoiceChatState.Joining and true or p91 == Enum.VoiceChatState.JoiningRetry
		if v93 then
			v_u_77.activated = v_u_40
			return
		elseif v94 then
			v_u_77.activated = v_u_42
		else
			v_u_77.activated = v_u_38
		end
	end
end
if v24() then
	if v_u_14 then
		script.Destroying:Once((v85()))
	end
	v_u_10:asyncInit():andThen(function()
		-- upvalues: (copy) v_u_10, (copy) v_u_96, (copy) v_u_18, (copy) v_u_87, (copy) v_u_14, (ref) v_u_77, (copy) v_u_35, (copy) v_u_15
		local v97 = v_u_10:getService()
		if v97 then
			v97.StateChanged:Connect(v_u_96)
			v_u_10:SetupParticipantListeners()
			if v_u_18 then
				v_u_10.showVoiceUI.Event:Connect(v_u_87)
				v_u_10.hideVoiceUI.Event:Connect(v_u_87)
				if v_u_14 then
					local v98
					if v_u_10:GetVoiceRestrictionState(false) == "normal" then
						v98 = false
					else
						v_u_77.activated = v_u_35
						if v_u_15 then
							v_u_77.availability:pinned()
							v98 = true
						else
							v_u_77.availability:unavailable()
							v98 = true
						end
					end
					if v98 then
						return
					end
				end
				if v_u_10.voiceUIVisible then
					v_u_77.availability:pinned()
				else
					v_u_77.availability:unavailable()
				end
			end
			if v_u_14 then
				local v99
				if v_u_10:GetVoiceRestrictionState(false) == "normal" then
					v99 = false
				else
					v_u_77.activated = v_u_35
					if v_u_15 then
						v_u_77.availability:pinned()
						v99 = true
					else
						v_u_77.availability:unavailable()
						v99 = true
					end
				end
				if v99 then
					return
				end
				v_u_77.availability:pinned()
			else
				v_u_77.availability:pinned()
			end
		end
	end):catch(function() end)
end
if v_u_19 then
	local v_u_100 = v_u_10:GetMicManager()
	if v_u_100 and v_u_100.hasConsumersChanged then
		v_u_100.hasConsumersChanged.Event:Connect(function()
			-- upvalues: (copy) v_u_90, (copy) v_u_100
			v_u_90()
			v_u_100:SetMicIndicatorReady(v_u_100:GetConsumerCount() > 0)
		end)
		v_u_90()
		v_u_100:SetMicIndicatorReady(v_u_100:GetConsumerCount() > 0)
	end
end
return v_u_77