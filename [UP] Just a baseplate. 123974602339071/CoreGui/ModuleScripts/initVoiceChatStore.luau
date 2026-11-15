-- Path: CoreGui.RobloxGui.Modules.VoiceChat.initVoiceChatStore
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = game:GetService("Players")
local v4 = require(v2.Modules.Flags.FFlagEnableVoiceChatStorybookFix)
local v_u_5 = require(v1.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix
local v_u_6 = require(script.Parent.Actions.VoiceEnabledChanged)
local v_u_7 = require(script.Parent.Actions.VoiceStateChanged)
local v_u_8 = require(script.Parent.Actions.ParticipantAdded)
local v_u_9 = require(script.Parent.Actions.ParticipantRemoved)
local v_u_10 = require(script.Parent.Actions.PlayerRemoved)
local v_u_11 = require(script.Parent.VoiceChatServiceManager).default
local v12 = require(v1.Workspace.Packages.VoiceChat).Constants
local v_u_13 = require(v1.Workspace.Packages.BlockingUtility)
local v_u_14 = require(v2.Modules.VoiceChat.Logger)(script.Name)
local v_u_15
if v4() then
	v_u_15 = v12.VOICE_STATE
else
	v_u_15 = v_u_11.VOICE_STATE
end
local v_u_16 = nil
local function v_u_25(p17, p18) -- name: setVoiceEnabled
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (ref) v_u_16, (copy) v_u_14, (copy) v_u_7, (ref) v_u_15, (copy) v_u_5, (copy) v_u_11
	local v19 = v_u_3.LocalPlayer.UserId
	local v20 = tostring(v19)
	p18:dispatch(v_u_6(p17 ~= Enum.VoiceChatState.Ended))
	if v_u_16[p17] then
		p18:dispatch(v_u_7(v20, v_u_16[p17]))
	else
		v_u_14:warning("LOCAL_STATE_MAP does not exist for {} state", p17)
		p18:dispatch(v_u_7(v20, v_u_15.MUTED))
	end
	if p17 == Enum.VoiceChatState.Failed then
		for _, v21 in pairs(v_u_3:GetPlayers()) do
			local v22 = v21.UserId
			local v23 = tostring(v22)
			if v21 == v_u_3.LocalPlayer then
				continue
			end
			p18:dispatch(v_u_7(v23, v_u_15.HIDDEN))
		end
	elseif p17 == Enum.VoiceChatState.Joined then
		local v24
		if v_u_5 then
			v24 = v_u_11.localMuted == false
		else
			v24 = not v_u_11.localMuted
		end
		if v24 then
			p18:dispatch(v_u_7(v20, v_u_15.INACTIVE))
		end
	end
end
local function v_u_61(p_u_26)
	-- upvalues: (ref) v_u_16, (ref) v_u_15, (copy) v_u_11, (copy) v_u_14, (copy) v_u_3, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7, (copy) v_u_13, (copy) v_u_25
	v_u_16 = {
		[Enum.VoiceChatState.Idle] = v_u_15.HIDDEN,
		[Enum.VoiceChatState.Joining] = v_u_15.CONNECTING,
		[Enum.VoiceChatState.JoiningRetry] = v_u_15.CONNECTING,
		[Enum.VoiceChatState.Joined] = v_u_15.MUTED,
		[Enum.VoiceChatState.Leaving] = v_u_15.MUTED,
		[Enum.VoiceChatState.Ended] = v_u_15.HIDDEN,
		[Enum.VoiceChatState.Failed] = v_u_15.ERROR
	}
	local v27 = v_u_11:getService()
	if v27 then
		local v_u_28 = v_u_3.LocalPlayer.UserId
		for _, v29 in pairs(v_u_3:GetPlayers()) do
			local v30 = v_u_14
			local v31 = v29.UserId
			local v32 = tostring(v31)
			v30:trace("Adding existing player {}", "..." .. string.sub(v32, -4))
			local v33 = v_u_8
			local v34 = v29.UserId
			p_u_26:dispatch(v33((tostring(v34))))
		end
		v_u_3.PlayerAdded:Connect(function(p35)
			-- upvalues: (ref) v_u_14, (copy) p_u_26, (ref) v_u_8
			local v36 = v_u_14
			local v37 = p35.UserId
			local v38 = tostring(v37)
			v36:trace("Adding joining player {}", "..." .. string.sub(v38, -4))
			local v39 = p_u_26
			local v40 = v_u_8
			local v41 = p35.userId
			v39:dispatch(v40((tostring(v41))))
		end)
		v_u_3.PlayerRemoving:Connect(function(p42)
			-- upvalues: (ref) v_u_14, (copy) p_u_26, (ref) v_u_10, (ref) v_u_9
			local v43 = v_u_14
			local v44 = p42.UserId
			local v45 = tostring(v44)
			v43:trace("Removing player {}", "..." .. string.sub(v45, -4))
			local v46 = p_u_26
			local v47 = v_u_10
			local v48 = p42.userId
			v46:dispatch(v47((tostring(v48))))
			local v49 = p_u_26
			local v50 = v_u_9
			local v51 = p42.userId
			v49:dispatch(v50((tostring(v51))))
		end)
		p_u_26:dispatch(v_u_7(v_u_28, v_u_15.HIDDEN))
		v_u_11.muteChanged.Event:Connect(function(p52)
			-- upvalues: (ref) v_u_14, (ref) v_u_15, (copy) p_u_26, (ref) v_u_7, (copy) v_u_28
			v_u_14:debug("Mute changed to {}", p52)
			p_u_26:dispatch(v_u_7(v_u_28, p52 and v_u_15.MUTED or v_u_15.INACTIVE))
		end)
		v_u_11.participantsUpdate.Event:Connect(function(p53)
			-- upvalues: (ref) v_u_15, (ref) v_u_14, (copy) p_u_26, (ref) v_u_7
			for v54, v55 in pairs(p53) do
				local v56 = v_u_15.INACTIVE
				if v55.subscriptionFailed then
					v56 = v_u_15.ERROR
				elseif v55.subscriptionCompleted then
					if v55.isMutedLocally then
						v56 = v_u_15.LOCAL_MUTED
					elseif v55.isMuted then
						v56 = v_u_15.MUTED
					elseif v55.isSignalActive then
						v56 = v_u_15.TALKING
					end
				else
					v56 = v_u_15.CONNECTING
				end
				v_u_14:trace("Participant update for {}, voice state {}", v54, v56)
				p_u_26:dispatch(v_u_7(v54, v56))
			end
		end)
		v_u_11.talkingChanged.Event:Connect(function(p57)
			-- upvalues: (copy) p_u_26, (ref) v_u_7, (copy) v_u_28, (ref) v_u_15
			if p57 then
				p_u_26:dispatch(v_u_7(v_u_28, v_u_15.TALKING))
			else
				p_u_26:dispatch(v_u_7(v_u_28, v_u_15.INACTIVE))
			end
		end)
		v_u_13:GetBlockedStatusChangedEvent():Connect(function(p58, p59)
			-- upvalues: (copy) p_u_26, (ref) v_u_9, (ref) v_u_8
			if p59 then
				p_u_26:dispatch(v_u_9((tostring(p58))))
			else
				p_u_26:dispatch(v_u_8((tostring(p58))))
			end
		end)
		v_u_14:debug("Initial voice state is {}", v27.VoiceChatState)
		v_u_25(v27.VoiceChatState, p_u_26)
		v27.StateChanged:Connect(function(_, p60)
			-- upvalues: (ref) v_u_14, (ref) v_u_25, (copy) p_u_26
			v_u_14:debug("Voice state changed to {}", p60)
			v_u_25(p60, p_u_26)
		end)
	else
		v_u_14:debug("VoiceChatService is not available")
	end
end
return function(p_u_62)
	-- upvalues: (copy) v_u_11, (copy) v_u_61, (copy) v_u_14
	if game:GetEngineFeature("VoiceChatSupported") then
		v_u_11:asyncInit():andThen(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_61, (copy) p_u_62
			v_u_11:SetupParticipantListeners()
			v_u_61(p_u_62)
		end):catch(function()
			-- upvalues: (ref) v_u_14
			v_u_14:warning("Failed to init VoiceChatServiceManager")
		end)
	end
end