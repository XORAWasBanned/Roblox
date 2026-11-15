-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Actions.VoiceEnabledChanged
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Packages.Rodux).makeActionCreator
local v_u_4 = require(v1.Packages.t)
local v_u_5 = require(v2.Modules.VoiceChat.Helpers.maybeAssert)
return v3(script.Name, function(p6)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	v_u_5(v_u_4.boolean(p6))
	return {
		["enabled"] = p6
	}
end)