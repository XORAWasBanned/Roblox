-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Actions.ParticipantRemoved
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Packages.Rodux).makeActionCreator
require(v1.Packages.t)
local v_u_4 = require(v2.Modules.VoiceChat.Helpers.maybeAssert)
return v3(script.Name, function(p5)
	-- upvalues: (copy) v_u_4
	v_u_4(tonumber(p5) ~= nil)
	return {
		["userId"] = tostring(p5)
	}
end)