-- Path: CoreGui.RobloxGui.Modules.VoiceChat.VoiceStateContext
local v_u_1 = game:GetEngineFeature("VoiceChatSupported") and Enum.VoiceChatState.Ended or nil
local v_u_2 = {
	["voiceEnabled"] = false,
	["voiceState"] = nil,
	["voiceState"] = v_u_1
}
local v3 = game:GetService("CorePackages")
local v4 = game:GetService("CoreGui")
local v_u_5 = require(v3.Packages.React)
local v6 = v4:WaitForChild("RobloxGui")
local v_u_7 = require(v6.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_8 = v_u_5.createContext(v_u_2)
return {
	["Provider"] = function(p9)
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_7, (copy) v_u_1, (copy) v_u_8
		local v_u_10, v_u_11 = v_u_5.useState(v_u_2)
		local function v_u_13(_, p12) -- name: updateVoiceState
			-- upvalues: (copy) v_u_10, (copy) v_u_11
			if p12 ~= v_u_10.voiceState then
				v_u_11({
					["voiceEnabled"] = p12 ~= Enum.VoiceChatState.Ended,
					["voiceState"] = p12
				})
			end
		end
		v_u_5.useEffect(function()
			-- upvalues: (ref) v_u_7, (copy) v_u_10, (copy) v_u_11, (copy) v_u_13, (ref) v_u_1
			local v_u_14 = true
			local v_u_15 = nil
			if game:GetEngineFeature("VoiceChatSupported") then
				v_u_7:asyncInit():andThen(function()
					-- upvalues: (ref) v_u_14, (ref) v_u_7, (ref) v_u_10, (ref) v_u_11, (ref) v_u_15, (ref) v_u_13
					if v_u_14 then
						v_u_7:SetupParticipantListeners()
						local v16 = v_u_7:getService()
						if v16 then
							local v17 = v16.VoiceChatState
							if v17 ~= v_u_10.voiceState then
								v_u_11({
									["voiceEnabled"] = v17 ~= Enum.VoiceChatState.Ended,
									["voiceState"] = v17
								})
							end
							v_u_15 = v16.StateChanged:Connect(v_u_13)
						end
					end
				end):catch(function()
					-- upvalues: (ref) v_u_1, (ref) v_u_10, (ref) v_u_11
					local v18 = v_u_1
					if v18 ~= v_u_10.voiceState then
						v_u_11({
							["voiceEnabled"] = v18 ~= Enum.VoiceChatState.Ended,
							["voiceState"] = v18
						})
					end
				end)
			end
			return function()
				-- upvalues: (ref) v_u_14, (ref) v_u_15
				v_u_14 = false
				if v_u_15 then
					v_u_15:Disconnect()
					v_u_15 = nil
				end
			end
		end, {})
		return v_u_5.createElement(v_u_8.Provider, {
			["value"] = v_u_10
		}, p9.children)
	end,
	["Consumer"] = v_u_8.Consumer,
	["Context"] = v_u_8,
	["withVoiceState"] = function(p19) -- name: withVoiceState
		-- upvalues: (copy) v_u_5, (copy) v_u_8
		return v_u_5.createElement(v_u_8.Consumer, {
			["render"] = p19
		})
	end
}