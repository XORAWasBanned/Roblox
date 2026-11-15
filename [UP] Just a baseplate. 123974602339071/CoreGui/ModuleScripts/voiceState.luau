-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Reducers.voiceState
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v2.Modules.Flags.FFlagEnableVoiceChatStorybookFix)
local v_u_4 = require(v1.Packages.Cryo)
local v5 = require(v1.Packages.Rodux)
local v_u_6
if v3() then
	v_u_6 = require(v1.Workspace.Packages.VoiceChat).Constants.VOICE_STATE
else
	v_u_6 = require(script.Parent.Parent.VoiceChatServiceManager).default.VOICE_STATE
end
local v7 = require(script.Parent.Parent.Actions.ParticipantAdded)
local v8 = require(script.Parent.Parent.Actions.ParticipantRemoved)
local v9 = require(script.Parent.Parent.Actions.VoiceStateChanged)
local v10 = require(script.Parent.Parent.Actions.VoiceEnabledChanged)
local v11 = require(script.Parent.Parent.Actions.ParticipantsChanged)
return v5.createReducer({}, {
	[v10.name] = function(p12, p13)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p12, {
			["voiceEnabled"] = p13.enabled
		})
	end,
	[v7.name] = function(p14, p15)
		-- upvalues: (ref) v_u_6, (copy) v_u_4
		local v16 = p15.userId
		local v17 = p14[v16] or v_u_6.HIDDEN
		return v_u_4.Dictionary.join(p14, {
			[v16] = v17
		})
	end,
	[v8.name] = function(p18, p19)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p18, {
			[p19.userId] = v_u_4.None
		})
	end,
	[v11.name] = function(p20, p21)
		-- upvalues: (ref) v_u_6
		local v22 = p21.newParticipants
		local v23 = table.clone(p20)
		for v24, v25 in v22 do
			local v26 = v_u_6.INACTIVE
			if v25.subscriptionCompleted then
				if v25.isMutedLocally then
					v26 = v_u_6.LOCAL_MUTED
				elseif v25.isMuted then
					v26 = v_u_6.MUTED
				elseif v25.isSignalActive then
					v26 = v_u_6.TALKING
				end
			else
				v26 = v_u_6.CONNECTING
			end
			v23[tostring(v24)] = v26
		end
		return v23
	end,
	[v9.name] = function(p27, p28)
		-- upvalues: (copy) v_u_4
		if p27[p28.userId] then
			return v_u_4.Dictionary.join(p27, {
				[p28.userId] = p28.newState
			})
		else
			return p27
		end
	end
})