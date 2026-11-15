-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Reducers.components
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Cryo)
local v4 = require(v1.Packages.Rodux)
local v5 = require(v2.Modules.VoiceChat.Actions.VoiceEnabledChanged)
local v6 = require(script.Parent.Parent.Actions.BubbleChatEnabledChanged)
return v4.createReducer({
	["bubbleChatEnabled"] = false,
	["voiceEnabled"] = false
}, {
	[v6.name] = function(p7, p8)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p7, {
			["bubbleChatEnabled"] = p8.enabled
		})
	end,
	[v5.name] = function(p9, p10)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p9, {
			["voiceEnabled"] = p10.enabled
		})
	end
})