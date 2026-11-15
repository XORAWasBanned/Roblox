-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Hooks.useVoiceState
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = game:GetService("Players")
local v4 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_5 = require(v1.Workspace.Packages.BlockingUtility):GetBlockedStatusChangedEvent()
local v_u_6 = require(script.Parent.Parent.VoiceChatServiceManager).default
local v_u_7 = require(v4.Modules.VoiceChat.VoiceStateContext)
local v_u_8 = require(v1.Workspace.Packages.VoiceChat).Constants.VOICE_STATE
local v9 = v3.LocalPlayer
while not v9 do
	v3:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v9 = v3.LocalPlayer
end
local v_u_10 = v9 and v9.UserId or 0
local v_u_11 = not game:GetEngineFeature("VoiceChatSupported") and {
	["Idle"] = 1,
	["Joining"] = 2,
	["JoiningRetry"] = 3,
	["Joined"] = 4,
	["Leaving"] = 5,
	["Ended"] = 6,
	["Failed"] = 7
} or Enum.VoiceChatState
local v_u_12 = {
	[v_u_11.Idle] = v_u_8.HIDDEN,
	[v_u_11.Joining] = v_u_8.CONNECTING,
	[v_u_11.JoiningRetry] = v_u_8.CONNECTING,
	[v_u_11.Joined] = v_u_8.MUTED,
	[v_u_11.Leaving] = v_u_8.MUTED,
	[v_u_11.Ended] = v_u_8.HIDDEN,
	[v_u_11.Failed] = v_u_8.ERROR
}
return function(p_u_13, p_u_14, p15) -- name: useVoiceState
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_10, (copy) v_u_12, (ref) v_u_11, (copy) v_u_5
	local v_u_16 = p15 and p15.voiceChatServiceManager or v_u_6
	local v_u_17 = v_u_2.useContext(v_u_7.Context)
	local v_u_18, v_u_19 = v_u_2.useState(v_u_8.HIDDEN)
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_17, (copy) p_u_13, (copy) p_u_14, (copy) v_u_19, (ref) v_u_8, (ref) v_u_10, (copy) v_u_18, (ref) v_u_12, (copy) v_u_16, (ref) v_u_11, (ref) v_u_5
		if not v_u_17.voiceEnabled or (not p_u_13 or p_u_14) then
			v_u_19(v_u_8.HIDDEN)
			return function() end
		end
		local v20 = p_u_13
		local v_u_21 = tonumber(v20)
		local v22 = p_u_13
		local v_u_23 = tostring(v22)
		local v_u_24 = v_u_10 == v_u_21
		local v_u_25 = nil
		local v_u_26 = {}
		local v_u_27 = false
		local function v_u_31(p28) -- name: setVoiceEnabled
			-- upvalues: (ref) v_u_18, (copy) v_u_24, (ref) v_u_12, (ref) v_u_8, (ref) v_u_16, (copy) v_u_23, (ref) v_u_25, (ref) v_u_11, (ref) v_u_27, (ref) v_u_19
			local v29 = v_u_18
			if v_u_24 then
				if v_u_12[p28] then
					v29 = v_u_12[p28]
				else
					v29 = v_u_8.MUTED
				end
			else
				local v30 = v_u_16.participants[v_u_23]
				if v30 and not v_u_25 then
					v29 = v_u_8.INACTIVE
					if v30.subscriptionFailed then
						v29 = v_u_8.ERROR
					elseif v30.subscriptionCompleted then
						if v30.isMutedLocally then
							v29 = v_u_8.LOCAL_MUTED
						elseif v30.isMuted then
							v29 = v_u_8.MUTED
						elseif v30.isSignalActive then
							v29 = v_u_8.TALKING
						end
					else
						v29 = v_u_8.CONNECTING
					end
				end
			end
			if p28 == v_u_11.Failed then
				if not v_u_24 then
					v29 = v_u_8.HIDDEN
				end
			elseif p28 == v_u_11.Joined and (not v_u_16.localMuted and v_u_24) then
				if v_u_16.isTalking then
					v29 = v_u_8.TALKING
				elseif v_u_16.localMuted then
					v29 = v_u_8.MUTED
				else
					v29 = v_u_8.INACTIVE
				end
			end
			if not v_u_27 then
				v_u_19(v29)
			end
		end
		v_u_31(v_u_17.voiceState)
		delay(0, function()
			-- upvalues: (ref) v_u_27, (copy) v_u_31, (ref) v_u_17, (copy) v_u_24, (copy) v_u_26, (ref) v_u_16, (ref) v_u_8, (ref) v_u_19, (copy) v_u_23, (ref) v_u_25, (copy) v_u_21, (ref) v_u_5
			if v_u_27 then
				return
			else
				v_u_31(v_u_17.voiceState)
				if v_u_24 then
					local v32 = v_u_26
					local v33 = v_u_16.talkingChanged.Event
					local function v36(p34)
						-- upvalues: (ref) v_u_8, (ref) v_u_27, (ref) v_u_19
						local v35
						if p34 then
							v35 = v_u_8.TALKING
						else
							v35 = v_u_8.INACTIVE
						end
						if not v_u_27 then
							v_u_19(v35)
						end
					end
					table.insert(v32, v33:Connect(v36))
					local v37 = v_u_26
					local v38 = v_u_16.muteChanged.Event
					local function v41(p39)
						-- upvalues: (ref) v_u_8, (ref) v_u_27, (ref) v_u_19
						local v40
						if p39 then
							v40 = v_u_8.MUTED
						else
							v40 = v_u_8.INACTIVE
						end
						if not v_u_27 then
							v_u_19(v40)
						end
					end
					table.insert(v37, v38:Connect(v41))
				else
					local v42 = v_u_26
					local v43 = v_u_16.participantsUpdate.Event
					local function v48(p44)
						-- upvalues: (ref) v_u_23, (ref) v_u_25, (ref) v_u_8, (ref) v_u_27, (ref) v_u_19
						local v45 = p44[v_u_23]
						if v45 and not v_u_25 then
							local v46 = v_u_8.INACTIVE
							if v45.subscriptionFailed then
								v46 = v_u_8.ERROR
							elseif v45.subscriptionCompleted then
								if v45.isMutedLocally then
									v46 = v_u_8.LOCAL_MUTED
								elseif v45.isMuted then
									v46 = v_u_8.MUTED
								elseif v45.isSignalActive then
									v46 = v_u_8.TALKING
								end
							else
								v46 = v_u_8.CONNECTING
							end
							if not v_u_27 then
								v_u_19(v46)
								return
							end
						else
							local v47 = v_u_8.HIDDEN
							if not v_u_27 then
								v_u_19(v47)
							end
						end
					end
					table.insert(v42, v43:Connect(v48))
					local v49 = v_u_26
					local v50 = v_u_16.participantLeft.Event
					local function v53(_, p51)
						-- upvalues: (ref) v_u_21, (ref) v_u_8, (ref) v_u_27, (ref) v_u_19
						if p51 == v_u_21 then
							local v52 = v_u_8.HIDDEN
							if not v_u_27 then
								v_u_19(v52)
							end
						end
					end
					table.insert(v49, v50:Connect(v53))
					local v54 = v_u_26
					local v55 = v_u_16.participantJoined.Event
					local function v58(_, p56)
						-- upvalues: (ref) v_u_21, (ref) v_u_8, (ref) v_u_27, (ref) v_u_19
						if p56 == v_u_21 then
							local v57 = v_u_8.HIDDEN
							if not v_u_27 then
								v_u_19(v57)
							end
						end
					end
					table.insert(v54, v55:Connect(v58))
					local v59 = v_u_26
					local v60 = v_u_5
					local function v67(p61, p62)
						-- upvalues: (ref) v_u_21, (ref) v_u_25, (ref) v_u_8, (ref) v_u_27, (ref) v_u_19, (ref) v_u_16, (ref) v_u_23
						if v_u_21 == p61 then
							if p62 then
								v_u_25 = true
								local v63 = v_u_8.HIDDEN
								if not v_u_27 then
									v_u_19(v63)
									return
								end
							else
								v_u_25 = nil
								local v64 = v_u_16.participants[v_u_23]
								if v64 then
									local v65 = v_u_8.INACTIVE
									if v64.subscriptionFailed then
										v65 = v_u_8.ERROR
									elseif v64.subscriptionCompleted then
										if v64.isMutedLocally then
											v65 = v_u_8.LOCAL_MUTED
										elseif v64.isMuted then
											v65 = v_u_8.MUTED
										elseif v64.isSignalActive then
											v65 = v_u_8.TALKING
										end
									else
										v65 = v_u_8.CONNECTING
									end
									if not v_u_27 then
										v_u_19(v65)
										return
									end
								else
									local v66 = v_u_8.HIDDEN
									if not v_u_27 then
										v_u_19(v66)
									end
								end
							end
						end
					end
					table.insert(v59, v60:Connect(v67))
				end
			end
		end)
		return function()
			-- upvalues: (ref) v_u_27, (copy) v_u_26
			v_u_27 = true
			delay(0, function()
				-- upvalues: (ref) v_u_26
				for _, v68 in v_u_26 do
					v68:disconnect()
				end
			end)
		end
	end, { p_u_13, v_u_17.voiceState, p_u_14 == true })
	return v_u_18
end