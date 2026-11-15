-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Actions.VoiceStateChanged
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Packages.Rodux).makeActionCreator
local v_u_4 = require(v1.Packages.t)
local v_u_5 = require(v2.Modules.VoiceChat.Helpers.maybeAssert)
return v3(script.Name, function(p6, p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	v_u_5(tonumber(p6) ~= nil)
	v_u_5(v_u_4.string(p7))
	return {
		["userId"] = tostring(p6),
		["newState"] = p7
	}
end)